SET DEFINE OFF;
DROP PACKAGE BODY APPS.XXECS_BOLETO_WRAPPER_PKG
/

CREATE OR REPLACE PACKAGE BODY APPS.XXECS_BOLETO_WRAPPER_PKG
AS
   /* $Header: XXECS_BOLETO_WRAPPER_PKG.pkb 4.14 2019/09/24 16:28:17IST Jayanth Siddaramaiah (A58092) Exp  $ */
   /* ********************************************************************************************************************
   *                                                                                                                    *
   * Oracle Applications : 11.5.10.2                                                                                    *
   * I --> Initial                                                                                                      *
   * E --> Enhancement                                                                                                  *
   * R --> Requirement                                                                                                  *
   * B --> Bug                                                                                                          *
   ********************************************************************************************************************/
   /* ********************************************************************************************************************
   * Type                : Package Body                                                                                 *
   * Type Name           : XXECS_BOLETO_WRAPPER_PKG
   *
   * Script Name         : XXECS_BOLETO_WRAPPER_PKG.pkb                                                                 *
   * Purpose             :B2B Inbound AP Invoices Processing package                                                    *
   *                                                                                                                    *
   * Company             : Arrow Electronics                                                                            *
   * Created By          : Sreeni Idumakanti                                                                            *
   * Created Date        : 08-24-2017                                                                                   *
   **********************************************************************************************************************
   * Modified Date  Modified By  Version  Reviewed By       Reviewed Date  Modification Type Modification Details       *
   * -------------  -----------  -------- ---------------   -------------- ----------------- ---------------------------*
   * 24-AUG-2017    Manjula       1.0                                           O             RF#15803 Brazil changes   *
   * 19-FEB-2018    Manjula       1.1                                           M             RF#15803 Reprocess scenarios *
   * 28-FEB-2018    Manjula       1.2                                           M             Change the DAC for nosso numero *
   * 06-MAR-2018    Manjula       1.3                                           M             Add default email ID for Boleto *
   * 19-APR-2018    Manjula       1.4                                           M             Changes for Debit Memo CA- 5129302  *
   * 30-MAY-2018    Manjula       1.5                                           M             Boleto Enhancement RF#5158428  *
   * 23-AUG-2018    Wipro         R12_1.0                                                     Modified for R12 Upgrade       *
   * 23-JAN-2019    Wipro         R12_1.1                                                     Replaced obsolete jl_br_company_infos and added LE address *
   * 24-JAN-2019    Wipro         R12_1.2                                                     Modified cursor query for performance issue *
   * 12-FEB-2019    Wipro         R12_1.3                                                     Commented rt.RECEIPT_METHOD_ID *
   * 12-FEB-2019   Sudarshan Raju 1.6                                           M             Added new parameters and invoice kit*
   *                                                                                          program to send invoice kit emails*
   * 20-FEB-2019   Sudarshan Raju 1.7                                           M             change to add for multiple PO exists for Invoice*
   * 30-APR-2019   Wipro          R12_1.4                                       M             Added from 11i code and changed hp table for BRADESCO Bank DFF*
   * 15-JUL-2019    Jayanth       1.8                                           M             Billing Kit NFe changes *
   *********************************************************************************************************************/
   l_error_status           VARCHAR2 (100);
   l_burst_return_status    BOOLEAN;                                   -- V1.1
   l_error_message          VARCHAR2 (2000);
   g_num_br_id              NUMBER := FND_PROFILE.VALUE ('XXECS_BR_OU_ID');
   l_exists                 VARCHAR2 (25);
   l_bank_num               VARCHAR2 (100);
   l_cp_nosso_numero_cd     VARCHAR2 (10);
   l_segment5               VARCHAR2 (100);
   l_type                   VARCHAR2 (100);
   l_sob_id                 NUMBER := FND_PROFILE.VALUE ('GL_SET_OF_BKS_ID');
   l_interest               VARCHAR2 (100);
   l_period                 VARCHAR2 (100);
   l_set_option             BOOLEAN;
   l_lang                   VARCHAR2 (100);
   l_lkup_phase             VARCHAR2 (100);
   l_exception_flag         VARCHAR2 (10);                             -- V1.1
   l_chr_message            VARCHAR2 (4000);                           -- V1.1
   g_num_request_id         NUMBER := fnd_global.conc_request_id;      -- V1.1
   l_status                 VARCHAR2 (100);                            -- V1.1
   l_burst_request_id       NUMBER;                                    -- V1.1
   l_email_req_id           NUMBER;                                    -- V1.1
   l_output_req_id          NUMBER;                                    -- V1.1
   l_email_return_status    BOOLEAN;                                   -- V1.1
   l_output_return_status   BOOLEAN;                                   -- V1.1
   l_rep_email              VARCHAR2 (2000);                           -- V1.1

   --V1.2 starts
   FUNCTION get_dac_our_number (p_nosso_numero IN VARCHAR2)
      RETURN VARCHAR2
   IS
      l_c9_nosso_numero      VARCHAR2 (100);
      cp_nosso_numero_cd     VARCHAR2 (100);
      l_cp_nosso_numero_cd   VARCHAR2 (100);
   BEGIN
      BEGIN
         l_c9_nosso_numero := p_nosso_numero;

         SELECT MOD (
                     SUBSTR (l_c9_nosso_numero, 1, 1) * 2
                   + SUBSTR (l_c9_nosso_numero, 2, 1) * 7
                   + SUBSTR (l_c9_nosso_numero, 3, 1) * 6
                   + SUBSTR (l_c9_nosso_numero, 4, 1) * 5
                   + SUBSTR (l_c9_nosso_numero, 5, 1) * 4
                   + SUBSTR (l_c9_nosso_numero, 6, 1) * 3
                   + SUBSTR (l_c9_nosso_numero, 7, 1) * 2
                   + SUBSTR (l_c9_nosso_numero, 8, 1) * 7
                   + SUBSTR (l_c9_nosso_numero, 9, 1) * 6
                   + SUBSTR (l_c9_nosso_numero, 10, 1) * 5
                   + SUBSTR (l_c9_nosso_numero, 11, 1) * 4
                   + SUBSTR (l_c9_nosso_numero, 12, 1) * 3
                   + SUBSTR (l_c9_nosso_numero, 13, 1) * 2,
                   11)
           INTO cp_nosso_numero_cd
           FROM DUAL;

         fnd_file.put_line (fnd_file.LOG,
                            'cp_nosso_numero_cd - ' || cp_nosso_numero_cd);
      EXCEPTION
         WHEN OTHERS
         THEN
            fnd_file.put_line (
               fnd_file.LOG,
               'Error while deriving cp_nosso_numero_cd - ' || SQLERRM);
            cp_nosso_numero_cd := NULL;
      END;

      IF cp_nosso_numero_cd = 1
      THEN
         l_cp_nosso_numero_cd := 'P';
         fnd_file.put_line (
            fnd_file.LOG,
            'l_cp_nosso_numero_cd 1 - ' || l_cp_nosso_numero_cd);
      ELSIF cp_nosso_numero_cd = 0
      THEN
         l_cp_nosso_numero_cd := 0;
         fnd_file.put_line (
            fnd_file.LOG,
            'l_cp_nosso_numero_cd 2 - ' || l_cp_nosso_numero_cd);
      ELSE
         BEGIN
            SELECT (11 - cp_nosso_numero_cd)
              INTO l_cp_nosso_numero_cd
              FROM DUAL;

            fnd_file.put_line (
               fnd_file.LOG,
               'l_cp_nosso_numero_cd - ' || l_cp_nosso_numero_cd);
         EXCEPTION
            WHEN OTHERS
            THEN
               l_cp_nosso_numero_cd := NULL;
         END;
      END IF;

      RETURN l_cp_nosso_numero_cd;
   EXCEPTION
      WHEN OTHERS
      THEN
         fnd_file.put_line (fnd_file.LOG,
                            'Eror in get_dac_our_number - ' || SQLERRM);
         l_cp_nosso_numero_cd := NULL;
   END get_dac_our_number;

   --V1.2 ends
   PROCEDURE ecs_archive_stg_data (p_req_id        IN     NUMBER,
                                   p_ret_code         OUT NUMBER,
                                   p_ret_err_msg      OUT VARCHAR2)
   AS
      CURSOR c_arch
      IS
         SELECT *
           FROM XXECS_BOLETO_GEN_AD
          WHERE parent_request_id = g_num_request_id;
   BEGIN
      fnd_file.put_line (fnd_file.LOG,
                         'Archiving the staging table data ... ');
      p_ret_code := 0;

      FOR r_arch IN c_arch
      LOOP
         fnd_file.put_line (
            fnd_file.LOG,
            'Inserting customer trx ID - ' || r_arch.cust_trx_id);

         BEGIN
            --INSERT INTO XXECS_DIST.XXECS_BOLETO_HISTORY_ST        -- Commented as part of R12_1.0 Version by Wipro
            INSERT INTO XXECS_BOLETO_HISTORY_ST -- Added as part of R12_1.0 Version by Wipro
                                                (BOLETO_SEQ_ID,
                                                 CUSTOMER_ID,
                                                 CUST_TRX_ID,
                                                 payment_schedule_id,
                                                 CUST_ACT_SITE_ID,
                                                 PAYMENT_METHOD_ID,
                                                 BANK_NUM_DSP,
                                                 NAME,
                                                 AGENCIA_CODIGO,
                                                 PAGADOR_NAME,
                                                 PAGADOR_ADDR1,
                                                 PAGADOR_ADDR2,
                                                 DATA_DO_DOCUMENTO,
                                                 NOSSO_NUMERO,
                                                 DO_DOCUMENTO,
                                                 VALOR_DO_DOCUMENTO,
                                                 VENCIMENTO,
                                                 ESPECIE,
                                                 CARTEIRA,
                                                 EMAIL_GROUP,
                                                 PRINTED_FLAG,
                                                 REPRINT_FLAG,
                                                 PARENT_REQUEST_ID,
                                                 request_id,
                                                 error_message,
                                                 CREATION_DATE,
                                                 STATUS,
                                                 ATTRIBUTE1 -- Trx Number    V1.6
                                                           ,
                                                 ATTRIBUTE2 -- Order Number  V1.6
                                                           ,
                                                 ATTRIBUTE3 -- PO Number     V1.6
                                                           ,
                                                 ATTRIBUTE4 -- Template Name V1.6
                                                           ,
                                                 ATTRIBUTE5 -- Customer Name V1.6
                                                           ,
                                                 ATTRIBUTE6 -- Emailed Flag  V1.6
                                                           ,
                                                 LAST_UDPATED_BY,
                                                 LAST_UPDATE_DATE,
                                                 CREATED_BY)
                 VALUES (XXECS_BOLETO_SEQ_NUM.NEXTVAL,
                         r_arch.customer_id,
                         r_arch.cust_trx_id,
                         r_arch.payment_schedule_id,
                         r_arch.cust_act_site_id,
                         r_arch.payment_method_id,
                         r_arch.bank_num_dsp,
                         r_arch.name,
                         r_arch.agencia_codigo,
                         r_arch.pagador_name,
                         r_arch.pagador_addr1,
                         r_arch.pagador_addr2,
                         r_arch.data_do_documento,
                         r_arch.nosso_numero,
                         r_arch.do_documento,
                         r_arch.valor_do_documento,
                         r_arch.vencimento,
                         r_arch.especie,
                         r_arch.carteira,
                         r_arch.email_group,
                         r_arch.printed_flag,
                         r_arch.reprint_flag,
                         r_arch.parent_request_id,
                         r_arch.request_id,
                         r_arch.error_message,
                         r_arch.creation_date,
                         r_arch.status,
                         r_arch.ATTRIBUTE1              -- Trx Number     V1.6
                                          ,
                         r_arch.ATTRIBUTE2              -- Order Number   V1.6
                                          ,
                         r_arch.ATTRIBUTE3               -- PO NUmber     V1.6
                                          ,
                         r_arch.ATTRIBUTE4              -- Template Name  V1.6
                                          ,
                         r_arch.ATTRIBUTE5              -- Customer Name  V1.6
                                          ,
                         r_arch.ATTRIBUTE6              -- Emailed Flag   V1.6
                                          ,
                         r_arch.last_udpated_by,
                         r_arch.last_update_date,
                         r_arch.created_by);
         EXCEPTION
            WHEN OTHERS
            THEN
               p_ret_code := 1;
               fnd_file.put_line (
                  fnd_file.LOG,
                  'Error while archiving the data - ' || SQLERRM);
         END;
      END LOOP;

      COMMIT;
   END ecs_archive_stg_data;

   PROCEDURE ecs_write_to_output (out_num_ret_code      OUT NUMBER,
                                  out_num_msg_char      OUT VARCHAR2,
                                  p_req_id           IN     NUMBER)
   AS
      l_header_count   NUMBER;

      CURSOR c_op_file (
         l_req_ID   IN NUMBER)
      IS
         SELECT DISTINCT rc.party_name customer_name, -- Replaced customer_name in RA_CUSTOMERS table with party_name in HZ_PARTIES table -- V1.8
                hca.account_number customer_number, -- Replaced customer_number in RA_CUSTOMERS table with account_number in HZ_CUST_ACCOUNTS table
                rct.trx_number,
                rct.trx_date,
                arm.name,
                xbs.status,
                xbs.request_id,
                xbs.email_group,
                xbs.error_message,
                xbs.attribute2 order_number,                           -- V1.6
                xbs.attribute3 po_number                               -- V1.6
           -- FROM XXECS_BOLETO_HISTORY_ST xbs,
           --ra_customers rc,                 --Commented as part of R12_1.0 Version by Wipro
           --  HZ_PARTIES rc,?HZ_CUST_ACCOUNTS hca,                  --Added as part of R12_1.0 Version by Wipro
           -- ra_customer_trx_all rct,
           -- ar_receipt_methods arm
           FROM XXECS_BOLETO_HISTORY_ST xbs,
                HZ_PARTIES rc,
                HZ_CUST_ACCOUNTS hca,
                ra_customer_trx_all rct,
                ar_receipt_methods arm
          WHERE     xbs.parent_request_id = l_req_ID
                AND xbs.customer_id = hca.cust_account_id
                AND hca.party_id = rc.party_id --Added as part of R12_1.0 Version by Wipro
                AND xbs.cust_trx_id = rct.customer_trx_id
                AND xbs.payment_method_id = arm.receipt_method_id
                AND rct.org_id = g_num_br_id;
   BEGIN
      fnd_file.put_line (fnd_file.LOG, 'Inside ecs_write_to_output  ..');
      out_num_ret_code := 0;
      l_header_count := 0;

      FOR r_op_file IN c_op_file (p_req_id)
      LOOP
         fnd_file.put_line (fnd_file.LOG,
                            'Printing the transaction statuses ..');

         IF l_header_count = 0
         THEN
           -- v1.8 commented
          /*  fnd_file.put_line (
               fnd_file.output,
               'Customer Name                               ,Customer Number           ,TRX Number         ,TRX Date         ,Payment Method                    ,Status        ,Boleto request ID           ,Email ID                          ,Error Message');
            */ 
           
           -- v1.8 Added
            fnd_file.put_line (
            fnd_file.output,
               RPAD ('Customer Name', 70, ' ')
            || ','
            || RPAD ('Customer Number', 26, ' ')
            || ','
            || RPAD ('TRX Number', 19, ' ')
            || ','
            || RPAD ('TRX Date', 17, ' ')
            || ','
            || RPAD ('Order Number', 19, ' ')                  -- V1.6
            || ','            
            || RPAD ('PO Number', 100, ' ')          
            || ','           
            || RPAD ('Payment Method', 50, ' ')          
            || ','
            || RPAD ('Status', 14, ' ')
            || ','
            || RPAD ('Boleto Request ID', 28, ' ')
            || ','          
            || RPAD ('Email ID', 100, ' ')           
            || ','
            || RPAD ('Error Message', 100, ' '));
           
           
            l_header_count := l_header_count + 1;
            fnd_file.put_line (fnd_file.LOG,
                               'Header Count - ' || l_header_count);
         END IF;                                             -- l_header_count

         fnd_file.put_line (
            fnd_file.output,
               '"'
            || RPAD (r_op_file.customer_name, 70, ' ')
            || '"'
            || ','
            || '"'
            || RPAD (r_op_file.customer_number, 26, ' ')
            || '"'
            || ','
            || RPAD (r_op_file.trx_number, 19, ' ')
            || ','
            || RPAD (r_op_file.trx_date, 17, ' ')
            || ','
            || RPAD (r_op_file.order_number, 19, ' ')                  -- V1.6
            || ','
            || --RPAD (r_op_file.po_number, 20, ' ')                     -- V1.6 -- commented for V1.7
              '"'
            || RPAD (r_op_file.po_number, 100, ' ')
            || '"' -- V1.7 Added for to put po Numbers on report if have multiple
            || ','
            || '"'
            || RPAD (r_op_file.name, 50, ' ')
            || '"'
            || ','
            || '"'
            || RPAD (r_op_file.status, 14, ' ')
            || '"'
            || ','
            || RPAD (r_op_file.request_id, 28, ' ')
            || ','
            || '"'
            || RPAD (r_op_file.email_group, 100, ' ')
            || '"'
            || ','
            || '"'
            || RPAD (r_op_file.error_message, 100, ' ')
            || '"');
          
      END LOOP;
   EXCEPTION
      WHEN OTHERS
      THEN
         out_num_ret_code := 2;
         fnd_file.put_line (fnd_file.LOG,
                            'Error while generating Output - ' || SQLERRM);
   END ecs_write_to_output;

   FUNCTION ecs_number_format (l_num2 IN NUMBER)
      RETURN VARCHAR2
   IS
      l_var1   VARCHAR2 (100);
      l_var2   VARCHAR2 (1);
      l_var3   VARCHAR2 (100);
      l_num1   NUMBER := 0;
   BEGIN
      l_var1 :=
         TRIM (
            TO_CHAR (l_num2,
                     '99G990G990G990G990G990D00',
                     'NLS_NUMERIC_CHARACTERS = '',.'''));

      FOR i IN 1 .. LENGTH (l_var1)
      LOOP
         l_var2 := SUBSTR (l_var1, i, 1);

         IF l_var2 IN ('1',
                       '2',
                       '3',
                       '4',
                       '5',
                       '6',
                       '7',
                       '8',
                       '9')
         THEN
            l_num1 := i;
            EXIT;
         END IF;
      END LOOP;

      l_var3 := SUBSTR (l_var1, l_num1, LENGTH (l_var1));
      fnd_file.put_line (fnd_file.LOG, 'After formatting - ' || l_var3);
      RETURN l_var3;
   EXCEPTION
      WHEN OTHERS
      THEN
         fnd_file.put_line (fnd_file.LOG, 'ecs_number_format - ' || SQLERRM);
   END ecs_number_format;

   PROCEDURE ecs_upd_cust_trx (p_ret_code           OUT NUMBER,
                               p_ret_err_msg        OUT VARCHAR2,
                               p_customer_id     IN     NUMBER,
                               p_trx_num         IN     NUMBER, -- v1.8
                               p_in_pay_method   IN     NUMBER,
                               p_in_request_id   IN     NUMBER)
   IS
      CURSOR c_upd_trx (
         p_cust_id     NUMBER,
         p_trx_number  NUMBER        -- v1.8 
         )
      IS
         SELECT *
           FROM xxecs_boleto_gen_ad
          WHERE customer_id = p_cust_id
            AND attribute1  = NVL(p_trx_number,attribute1) -- v1.8
            AND printed_flag = 'N'
            AND status = 'NEW';                                    -- V1.1
   BEGIN
      fnd_file.put_line (
         fnd_file.LOG,
         'Inside ecs_upd_cust_trx procedure, customer ID - ' || p_customer_id ||' Trx num - '||p_trx_num); -- v1.8

      FOR r_upd_trx IN c_upd_trx (p_customer_id, p_trx_num) -- v1.8
      LOOP
         fnd_file.put_line (fnd_file.LOG,
                            'Inside loop customer ID - ' || p_customer_id);
         /*           BEGIN V1.2
         UPDATE RA_CUSTOMER_TRX
         SET receipt_method_id = p_in_pay_method
         ,last_update_date  = SYSDATE
         ,last_update_login = 0
         WHERE customer_trx_id = r_upd_trx.cust_trx_id;
         fnd_file.put_line (fnd_file.LOG,'No of transactions updated with Receipt method - '||SQL%ROWCOUNT);
         EXCEPTION
         WHEN OTHERS THEN
         fnd_file.put_line (fnd_file.LOG,'Error while updating trx - '||r_upd_trx.cust_trx_id);
         END;
         V1.2 */
         -- Update payment schedule with the receipt_method_id
         fnd_file.put_line (fnd_file.LOG,
                            'Inside loop customer ID - ' || p_customer_id);

         BEGIN
            UPDATE AR_PAYMENT_SCHEDULES_ALL
               SET global_attribute8 = p_in_pay_method,
                   last_update_date = SYSDATE,
                   last_update_login = 0
             WHERE payment_schedule_id = r_upd_trx.payment_schedule_id;

            fnd_file.put_line (
               fnd_file.LOG,
                  'No of AR_PAYMENT_SCHEDULES_ALL updated with Receipt method - '
               || SQL%ROWCOUNT);
         EXCEPTION
            WHEN OTHERS
            THEN
               fnd_file.put_line (
                  fnd_file.LOG,
                     'Error while updating AR_PAYMENT_SCHEDULES_ALL - '
                  || r_upd_trx.cust_trx_id);
         END;
      END LOOP;
   --COMMIT; V1.1
   EXCEPTION
      WHEN OTHERS
      THEN
         fnd_file.put_line (fnd_file.LOG, 'ecs_upd_cust_trx - ' || SQLERRM);
   END ecs_upd_cust_trx;

   -- v1.8 start
   PROCEDURE get_nfe_email_details(
                                    P_INVOICE_NO    IN  VARCHAR2,
                                    P_ORG_CODE      IN  VARCHAR2,
                                    P_INVOICE_TYPE  IN  VARCHAR2,
                                    P_CPF_CNPJ      OUT VARCHAR2,
                                    P_MUNICIPLE     OUT VARCHAR2,
                                    P_NUMERO        OUT VARCHAR2,
                                    P_SERIE         OUT VARCHAR2,
                                    P_LINK_PARA     OUT VARCHAR2,
                                    P_CODIGO        OUT VARCHAR2,
                                    P_PDF_FILE_NAME OUT VARCHAR2,
                                    P_PDF_FILE_PATH OUT VARCHAR2,
                                    P_XML_FILE_NAME OUT VARCHAR2,
                                    P_XML_FILE_PATH OUT VARCHAR2)
   IS
        l_chr_cpf_cnpj  VARCHAR2(1000);
        l_chr_municiple VARCHAR2(1000);
        l_chr_numero    VARCHAR2(1000);
        l_chr_serie     VARCHAR2(1000);
        l_chr_para      VARCHAR2(1000);
        l_chr_codigo    VARCHAR2(1000);
        l_chr_pdf_file_name xxecs_brazil_nfe_file_ad.file_name%TYPE;
        l_chr_pdf_file_path xxecs_brazil_nfe_file_ad.file_path%TYPE;
        l_chr_xml_file_name xxecs_brazil_nfe_file_ad.file_name%TYPE;
        l_chr_xml_file_path xxecs_brazil_nfe_file_ad.file_path%TYPE;
        
   BEGIN
        fnd_file.put_line (fnd_file.LOG,'Inside get_nfe_email_details proc');
        IF P_INVOICE_TYPE = 'SW' THEN
          BEGIN
            SELECT 
                REPLACE(REPLACE(REPLACE(DBMS_LOB.substr(
                mail_body
                ,DBMS_LOB.instr(mail_body,'Inscrição Municipal Prestador',1,1) - (DBMS_LOB.instr(mail_body,'CPF/CNPJ Prestador',1,1)+18)
                ,DBMS_LOB.instr(mail_body,'CPF/CNPJ Prestador',1,1)+18
                ),CHR(09), ''),CHR(13),''),CHR(10),'') cpf_cnpj,
                REPLACE(REPLACE(REPLACE(DBMS_LOB.substr(
                mail_body
                ,DBMS_LOB.instr(mail_body,'Razão Social Prestador',1,1) - (DBMS_LOB.instr(mail_body,'Inscrição Municipal Prestador',1,1)+29)
                ,DBMS_LOB.instr(mail_body,'Inscrição Municipal Prestador',1,1)+29
                ),CHR(09), ''),CHR(13),''),CHR(10),'') municiple,
                REPLACE(REPLACE(REPLACE(DBMS_LOB.substr(
                mail_body
                ,DBMS_LOB.instr(mail_body,'Número da NFS-e',1,1) - (DBMS_LOB.instr(mail_body,'Número do RPS',1,1)+13)
                ,DBMS_LOB.instr(mail_body,'Número do RPS',1,1)+13
                ),CHR(09), ''),CHR(13),''),CHR(10),'') numero,
                REPLACE(REPLACE(REPLACE(DBMS_LOB.substr(
                mail_body
                ,DBMS_LOB.instr(mail_body,'Situação',1,1) - (DBMS_LOB.instr(mail_body,'Série',1,1)+5)
                ,DBMS_LOB.instr(mail_body,'Série',1,1)+5
                ),CHR(09), ''),CHR(13),''),CHR(10),'') serie,
                /*REPLACE(REPLACE(REPLACE(DBMS_LOB.substr(
                mail_body
                ,DBMS_LOB.instr(mail_body,'Código Verificação',1,1) - (DBMS_LOB.instr(mail_body,'Link para consulta da nota',1,1)+26)
                ,DBMS_LOB.instr(mail_body,'Link para consulta da nota',1,1)+26
                ),CHR(09), ''),CHR(13),''),CHR(10),'') */
                (SELECT org_nfe_link FROM XXECS_BR_NFE_ORGCODE_ORGLINK
                  WHERE SUBSTR(org_code,-3,3) = P_ORG_CODE) link_para,
                REPLACE(REPLACE(REPLACE(DBMS_LOB.substr(
                mail_body
                ,DBMS_LOB.instr(mail_body,'---------------------------------------------------------------------------',300,1) - (DBMS_LOB.instr(mail_body,'Código Verificação',1,1)+18)
                ,DBMS_LOB.instr(mail_body,'Código Verificação',1,1)+18
                ),CHR(09), ''),CHR(13),''),CHR(10),'') codigo
          INTO  l_chr_cpf_cnpj,
                l_chr_municiple,
                l_chr_numero,
                l_chr_serie,
                l_chr_para,
                l_chr_codigo
          FROM xxecs_brazil_nfe_mail_ad        
          WHERE nfe_header_id = (SELECT MIN(nfe_header_id) 
                                   FROM xxecs_brazil_nfe_mail_ad
                                  WHERE 1=1
                                    AND invoice_no = P_INVOICE_NO
                                    AND org_code   = P_ORG_CODE
                                    AND invoice_type = 'SW'
                                    AND mail_forwarded_flag IS NULL
                                    AND status_flag = 'I');
            
          P_CPF_CNPJ    := l_chr_cpf_cnpj;
          P_MUNICIPLE   := l_chr_municiple;
          P_NUMERO      := l_chr_numero;
          P_SERIE       := l_chr_serie;
          P_LINK_PARA   := l_chr_para;
          P_CODIGO      := l_chr_codigo;
          
        EXCEPTION
        WHEN OTHERS THEN
            P_CPF_CNPJ  := NULL;
            P_MUNICIPLE := NULL;
            P_NUMERO    := NULL;
            P_SERIE     := NULL;
            P_LINK_PARA := NULL;
            P_CODIGO    := NULL;
        END;
      ELSIF P_INVOICE_TYPE = 'HW' THEN
        BEGIN
            SELECT file_name,
                   file_path
              INTO l_chr_pdf_file_name,
                   l_chr_pdf_file_path
              FROM xxecs_brazil_nfe_file_ad    nfile    
             WHERE 1=1          
               AND nfile.file_id = (SELECT MIN(file_id)
                                      FROM xxecs_brazil_nfe_mail_ad    nm,
                                           xxecs_brazil_nfe_file_ad    nf    
                                     WHERE nm.nfe_header_id =  nf.nfe_header_id                                       
                                       AND invoice_no = P_INVOICE_NO
                                       AND org_code   = P_ORG_CODE
                                       AND INSTR(UPPER(nf.file_name), '.PDF') > 0
                                       AND nm.status_flag = 'M'
                                       AND nm.mail_forwarded_flag IS NULL
                                       AND invoice_type = 'HW');
               
            P_PDF_FILE_NAME := l_chr_pdf_file_name;
            P_PDF_FILE_PATH := l_chr_pdf_file_path;
        EXCEPTION
        WHEN OTHERS THEN
            P_PDF_FILE_NAME := NULL;
            P_PDF_FILE_PATH := NULL;
        END;
        
        BEGIN
            SELECT file_name,
                   file_path
              INTO l_chr_xml_file_name,
                   l_chr_xml_file_path
              FROM xxecs_brazil_nfe_file_ad    nfile    
             WHERE 1=1          
               AND nfile.file_id = (SELECT MIN(file_id)
                                      FROM xxecs_brazil_nfe_mail_ad    nm,
                                           xxecs_brazil_nfe_file_ad    nf    
                                     WHERE nm.nfe_header_id =  nf.nfe_header_id                                       
                                       AND invoice_no = P_INVOICE_NO
                                       AND org_code   = P_ORG_CODE
                                       AND INSTR(UPPER(nf.file_name), '.XML') > 0
                                       AND nm.status_flag = 'M'
                                       AND nm.mail_forwarded_flag IS NULL
                                       AND invoice_type = 'HW');
               
            P_XML_FILE_NAME := l_chr_xml_file_name;
            P_XML_FILE_PATH := l_chr_xml_file_path;
        EXCEPTION
        WHEN OTHERS THEN
            P_XML_FILE_NAME := NULL;
            P_XML_FILE_PATH := NULL;
        END;
      END IF;
      
      fnd_file.put_line (fnd_file.LOG,'l_chr_cpf_cnpj - ' || l_chr_cpf_cnpj);
      fnd_file.put_line (fnd_file.LOG,'l_chr_municiple - ' || l_chr_municiple);
      fnd_file.put_line (fnd_file.LOG,'l_chr_numero - ' || l_chr_numero);
      fnd_file.put_line (fnd_file.LOG,'l_chr_serie - ' || l_chr_serie);
      fnd_file.put_line (fnd_file.LOG,'l_chr_para - ' || l_chr_para);
      fnd_file.put_line (fnd_file.LOG,'l_chr_codigo - ' || l_chr_codigo);
      fnd_file.put_line (fnd_file.LOG,'l_chr_pdf_file_name - ' || l_chr_pdf_file_name);
      fnd_file.put_line (fnd_file.LOG,'l_chr_pdf_file_path - ' || l_chr_pdf_file_path);
      fnd_file.put_line (fnd_file.LOG,'l_chr_xml_file_name - ' || l_chr_xml_file_name);
      fnd_file.put_line (fnd_file.LOG,'l_chr_xml_file_path - ' || l_chr_xml_file_path);
      
   EXCEPTION
   WHEN OTHERS THEN   
        fnd_file.put_line (fnd_file.LOG,'get_nfe_email_details proc - ' || SQLERRM);
   END get_nfe_email_details;
   -- v1.8 end
   
   PROCEDURE ecs_update_email_id (p_ret_code      OUT NUMBER,
                                  p_ret_err_msg   OUT VARCHAR2)
   IS
      l_email_ID   VARCHAR2 (1000);
      i            NUMBER;

      CURSOR c_get_email
      IS
         SELECT DISTINCT CUSTOMER_ID, CUST_ACT_SITE_ID
           FROM XXECS_BOLETO_GEN_AD
          WHERE parent_request_id = g_num_request_id;                  -- V1.1

      CURSOR c_email_grp (
         p_customer_id        IN NUMBER,
         p_cust_act_site_id   IN NUMBER)
      IS
         SELECT cont_point.email_address
           FROM HZ_CONTACT_POINTS CONT_POINT,
                HZ_CUST_ACCOUNT_ROLES ACCT_ROLE,
                HZ_PARTIES PARTY,
                HZ_PARTIES REL_PARTY,
                HZ_RELATIONSHIPS REL,
                HZ_ORG_CONTACTS ORG_CONT,
                HZ_CUST_ACCOUNTS ROLE_ACCT
          WHERE     ACCT_ROLE.PARTY_ID = REL.PARTY_ID
                AND ACCT_ROLE.ROLE_TYPE = 'CONTACT'
                AND ORG_CONT.PARTY_RELATIONSHIP_ID = REL.RELATIONSHIP_ID
                AND REL.SUBJECT_ID = PARTY.PARTY_ID
                AND REL_PARTY.PARTY_ID = REL.PARTY_ID
                AND CONT_POINT.OWNER_TABLE_ID(+) = REL_PARTY.PARTY_ID
                AND CONT_POINT.CONTACT_POINT_TYPE(+) = 'EMAIL'
                AND ACCT_ROLE.CUST_ACCOUNT_ID = ROLE_ACCT.CUST_ACCOUNT_ID
                AND ROLE_ACCT.PARTY_ID = REL.OBJECT_ID
                AND CONT_POINT.OWNER_TABLE_NAME(+) = 'HZ_PARTIES'
                AND ACCT_ROLE.CUST_ACCOUNT_ID = p_customer_id
                AND current_role_state = 'A'
                AND cont_point.status = 'A'                            -- V1.1
                AND cont_point.email_address IS NOT NULL               -- V1.3
                AND cont_point.CONTACT_POINT_PURPOSE = 'EMAIL INVOICE' -- v1.8
                AND cust_acct_site_id = p_cust_act_site_id;
   BEGIN
      p_ret_code := 0;
      p_ret_err_msg := 'SUCCESS';

      FOR r_get_email IN c_get_email
      LOOP
         i := 0;
         l_email_id := NULL;

         FOR r_email_grp
            IN c_email_grp (r_get_email.customer_id,
                            r_get_email.CUST_ACT_SITE_ID)
         LOOP
            i := i + 1;

            --IF i = 1 AND r_email_grp.email_address IS NOT NULL THEN --V1.1 commented for V1.3
            IF i = 1
            THEN                                                       -- V1.3
               --l_email_id := r_email_grp.email_address; V1.5
               l_email_id :=
                     FND_PROFILE.VALUE ('XXECS_BOLETO_DEFAULT_EMAIL')
                  || ','
                  || r_email_grp.email_address;                        -- V1.5
               fnd_file.put_line (fnd_file.LOG,
                                  'Email ID 1 - ' || l_email_id);
            --ELSIF i > 1 and r_email_grp.email_address IS NOT NULL THEN -- V1.1 commented for V1.3
            ELSIF i > 1
            THEN                                                       -- V1.3
               l_email_id := l_email_ID || ',' || r_email_grp.email_address;
               fnd_file.put_line (fnd_file.LOG,
                                  'Email ID 2 - ' || l_email_id);
            ELSE
               l_email_ID := NULL;
               fnd_file.put_line (fnd_file.LOG, 'Email ID not found');
            END IF;
         END LOOP;

         -- Added for V1.3 starts
         IF l_email_ID IS NULL
         THEN
            l_email_ID := FND_PROFILE.VALUE ('XXECS_BOLETO_DEFAULT_EMAIL');
            fnd_file.put_line (fnd_file.LOG, 'Email ID - ' || l_email_id);
         END IF;

         -- Added for V1.3 ends
         fnd_file.put_line (fnd_file.LOG, 'Email ID - ' || l_email_id);

         BEGIN
            UPDATE XXECS_BOLETO_GEN_AD
               SET email_group = l_email_ID
             WHERE     customer_id = r_get_email.customer_id
                   AND parent_request_id = g_num_request_id;           -- V1.1

            fnd_file.put_line (
               fnd_file.LOG,
               'Email count updated in staging table - ' || SQL%ROWCOUNT);
         EXCEPTION
            WHEN OTHERS
            THEN
               fnd_file.put_line (fnd_file.LOG,
                                  'Error in updating email ID - ' || SQLERRM);
         END;

         COMMIT;
      END LOOP;

      fnd_file.put_line (fnd_file.LOG, 'After mail ID update');
   EXCEPTION
      WHEN OTHERS
      THEN
         fnd_file.put_line (fnd_file.LOG,
                            'ecs_update_email_id proc - ' || SQLERRM);
   END ecs_update_email_id;

   -- V1.8 commented
   -- Start Added ecs_update_po_num procedure for V1.7
  /* PROCEDURE ecs_update_po_num (p_ret_code      OUT NUMBER,
                                p_ret_err_msg   OUT VARCHAR2)
   IS
      CURSOR c_get_ord_num
      IS
         SELECT DISTINCT attribute2
           FROM XXECS_BOLETO_GEN_AD
          WHERE parent_request_id = g_num_request_id;

      CURSOR c_get_po_num (
         in_order_num    VARCHAR2)
      IS
         SELECT LISTAGG (po_number, ' , ') WITHIN GROUP (ORDER BY po_number)
                   AS PO_NUMBER
           FROM (SELECT DISTINCT poh.segment1 po_number
                   FROM apps.oe_order_headers_all ooh,
                        apps.oe_drop_ship_sources ood,
                        apps.po_headers_all poh
                  WHERE     ooh.header_id = ood.header_id
                        AND poh.po_header_id = ood.po_header_id
                        AND TO_CHAR (ooh.order_number) = in_order_num);
   BEGIN
      p_ret_code := 0;
      p_ret_err_msg := 'SUCCESS';

      FOR rec_get_ord_num IN c_get_ord_num
      LOOP
         FOR rec_get_po_num IN c_get_po_num (rec_get_ord_num.attribute2)
         LOOP
            BEGIN
               UPDATE XXECS_BOLETO_GEN_AD
                  SET attribute3 = rec_get_po_num.po_number
                WHERE  attribute2 = rec_get_ord_num.attribute2
                  AND parent_request_id = g_num_request_id;

               fnd_file.put_line (
                  fnd_file.LOG,
                  'PO Number updated in staging table - ' || SQL%ROWCOUNT);
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while updating PO Number - ' || SQLERRM);
            END;

            COMMIT;
         END LOOP;
      END LOOP;

      fnd_file.put_line (fnd_file.LOG, 'After PO Number update');
   EXCEPTION
      WHEN OTHERS
      THEN
         fnd_file.put_line (fnd_file.LOG,
                            'ecs_update_po_num proc - ' || SQLERRM);
   END ecs_update_po_num;

   -- End Added ecs_update_po_num procedure for V1.7
   */
   -- V1.8 commented
   -- v1.8 start
   PROCEDURE ecs_update_po_num (p_ret_code      OUT NUMBER,
                                p_ret_err_msg   OUT VARCHAR2)
   IS
      CURSOR c_get_trx_num
      IS
         SELECT DISTINCT bol.attribute1,cust_trx_id
           FROM XXECS_BOLETO_GEN_AD bol
          WHERE parent_request_id = g_num_request_id;
          
      CURSOR c_get_po_num (
           in_trx_num      VARCHAR2,
           in_cust_trx_id      NUMBER)
         IS   
           SELECT LISTAGG (po_number, ',') WITHIN GROUP (ORDER BY po_number)
                   AS PO_NUMBER
             FROM (SELECT DISTINCT pha.segment1 po_number
                  FROM ra_customer_trx_all        rcta,
                       ra_customer_trx_lines_all  rctla,
                       oe_order_headers_all       ooha,
                       oe_order_lines_all         oola,
                       oe_drop_ship_sources       odss,
                       po_lines_all               pla,
                       po_headers_all             pha
                 WHERE 1 = 1   
                       AND rcta.customer_trx_id = rctla.customer_trx_id
                       AND rctla.line_type = 'LINE'
                       AND rcta.org_id = rctla.org_id
                       AND ooha.order_number = rctla.interface_line_attribute1
                       and to_char(oola.line_id) = rctla.interface_line_attribute6
                       AND ooha.header_id = oola.header_id
                       AND ooha.org_id = oola.org_id
                       AND odss.header_id = ooha.header_id
                       And odss.line_id = oola.line_id
                       AND pla.po_line_id = odss.po_line_id
                       and pla.po_header_id = odss.po_header_id
                       AND pla.po_header_id = pha.po_header_id
                       AND rcta.customer_trx_id = in_cust_trx_id
                       AND rcta.trx_number = in_trx_num
                UNION       
                SELECT DISTINCT pha.segment1 po_number
                  FROM ra_customer_trx_all        rcta,
                       ra_customer_trx_lines_all  rctla,
                       oe_order_headers_all       ooha,
                       oe_order_lines_all         oola,
                       ecs_om_addnal_detls_ad     eoad1,
                       po_lines_all               pla,
                       po_headers_all             pha
                 WHERE 1 =1
                       AND rcta.customer_trx_id = rctla.customer_trx_id
                       AND rctla.line_type = 'LINE'
                       AND rcta.org_id = rctla.org_id
                       AND ooha.order_number = rctla.interface_line_attribute1
                       and to_char(oola.line_id) = rctla.interface_line_attribute6
                       AND ooha.header_id = oola.header_id
                       AND ooha.org_id = oola.org_id
                       AND pla.po_line_id = eoad1.po_line_id
                       AND eoad1.header_id = ooha.header_id
                       AND eoad1.line_id = oola.line_id
                       AND pla.po_header_id = pha.po_header_id
                       AND rcta.customer_trx_id = in_cust_trx_id
                       AND rcta.trx_number = in_trx_num);      
   BEGIN
      p_ret_code := 0;
      p_ret_err_msg := 'SUCCESS';

      FOR rec_get_trx_num IN c_get_trx_num
      LOOP
         FOR rec_get_po_num IN c_get_po_num (rec_get_trx_num.attribute1, rec_get_trx_num.cust_trx_id)
         LOOP
            BEGIN
               UPDATE XXECS_BOLETO_GEN_AD
                  SET attribute3 = rec_get_po_num.po_number
                WHERE  attribute1 = rec_get_trx_num.attribute1
                  AND  cust_trx_id = rec_get_trx_num.cust_trx_id
                  AND parent_request_id = g_num_request_id;

               fnd_file.put_line (
                  fnd_file.LOG,
                  'PO Number updated in staging table - ' || SQL%ROWCOUNT);
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while updating PO Number - ' || SQLERRM);
            END;

            COMMIT;
         END LOOP;
      END LOOP;

      fnd_file.put_line (fnd_file.LOG, 'After PO Number update');
   EXCEPTION
      WHEN OTHERS
      THEN
         fnd_file.put_line (fnd_file.LOG,
                            'ecs_update_po_num proc - ' || SQLERRM);
   END ecs_update_po_num;
   -- v1.8 end
   PROCEDURE ecs_generate_bar_code (p_ret_code      OUT NUMBER,
                                    p_ret_err_msg   OUT VARCHAR2)
   IS
      l_05                 NUMBER; -- Dito verificador do C?digo de Barras (check digit)
      l_group1             VARCHAR2 (100);
      l_group1_ckd         VARCHAR2 (100);
      l_group2             VARCHAR2 (100);
      l_group2_ckd         VARCHAR2 (100);
      l_group3             VARCHAR2 (100);
      l_group3_ckd         VARCHAR2 (100);
      l_group4_ckd         VARCHAR2 (100);
      l_group5             VARCHAR2 (100);
      l_04_amt             NUMBER;
      l_05_amt_1           NUMBER;
      l_05_amt_2           NUMBER;
      l_05_amt_3           NUMBER;
      l_05_amt             NUMBER;
      l_c9_nosso_numero    VARCHAR2 (1000);
      l_chk_digit          NUMBER;
      cp_nosso_numero_cd   NUMBER;
      v_start_code         VARCHAR2 (50) := CHR (202);
      v_end_code           VARCHAR2 (50) := CHR (203);
      v_num                NUMBER;
      v_final_chars        VARCHAR2 (45);
      l_bar_code           VARCHAR2 (4000);
      cp_bar_code          VARCHAR2 (4000);
      l_string             VARCHAR2 (4000);
      l_new_bar_code       VARCHAR2 (4000);

      CURSOR c_gen_bar_code
      IS
         SELECT rct.customer_trx_id,
                --cac.customer_id,
                hcasa.cust_account_id,
                jb_bank.bank_name_dsp ca_bank_name_dsp,
                jb_bank.bank_number_dsp || '-' || hcasa.attribute1
                   cb_bank_num_dsp,
                jb_bank.bank_number_dsp,
                jb_bank.bank_branch_name_dsp,
                jb_bank.bank_num_dsp bank_agent_number,
                SUBSTR (jb_bank.bank_account_num_dsp,
                        0,
                        INSTR (jb_bank.bank_account_num_dsp, '-', 1) - 1)
                   bank_account_num,
                hle.name c1_company_name,
                jb_bank.bank_account_num_dsp,
                jb_bank.bank_num_dsp || '/' || bank_account_num_dsp
                   c2_agencia_codigo,
                TO_CHAR (aps.due_date, 'DD/MM/RRRR') c3_vencimento,
                TO_CHAR (aps.trx_date, 'DD/MM/RRRR') c4_data_do_documento,
                LPAD (aps.payment_schedule_id, 8, '0') c_pay_schedule_id,
                aps.terms_sequence_number,
                aps.payment_schedule_id,
                aps.trx_number || '-' || aps.terms_sequence_number
                   c5_no_do_documento,
                DECODE (jb_bank.bank_number_dsp,
                        '237', DECODE (aps.class,  'INV', 'DM',  'DM', 'ND'),
                        '1')
                   c6_especie,
                -- 'N? c7_aceite,  -- Commented as per V1.6
                jb_bank.portfolio_code c11_carteira,
                'R$' c12_especie,
                LPAD (
                   LTRIM (
                      RTRIM (
                         REPLACE (
                            TO_CHAR (ROUND (aps.amount_due_remaining, 2),
                                     '99999999990.00'),
                            '.',
                            ','))),
                   15,
                   ' ')
                   c15_valor_do_documento,
                aps.amount_due_remaining valor_do_documento,
                'COBRAR JUROS DE MORA DIARIA DE R$ ' || NULL
                   c16_bank_instructions,
                --cac.nome_cliente c22_nome_clliente,
                hp.party_name c22_nome_clliente,
                   --cac.endereco
                   hl.address1
                || '  '
                || hl.address2                                   -- endereco_1
                || '   '
                || hl.address3                                        -- compl
                || '  '
                || hl.address4
                   c22_line1,                             -- bairro c22_line1,
                   hl.postal_code                                   -- cac.cep
                || '      '
                || hl.city                                           -- cidade
                || '                           '
                || hl.state
                   c22_line2,                                 -- uf c22_line2,
                SUBSTR (jb_bank.bank_account_num_dsp,
                        INSTR (jb_bank.bank_account_num_dsp, '-', 1) + 1)
                   c_check_dig
           FROM ar_payment_schedules_all aps,
                ra_customer_trx_all rct,
                -- caibr_ar_clientes_v cac,
                hz_cust_accounts hca,
                hz_parties hp,
                hz_party_sites hps,
                hz_locations hl,
                hz_cust_acct_sites_all hcasa,
                hz_cust_site_uses_all hcsua,
                --jl_br_company_infos jbci,        --R12_1.1
                hr_legal_entities hle,                              -- R12_1.1
                hr_organization_information hoi,                    -- R12_1.1
                jl_br_ar_rec_met_accts_ext_v jb_bank,
                --ap_bank_branches abb,                                        -- Commented as part of R12_1.0 Version by Wipro
                CE_BANK_BRANCHES_V abb, -- Added as part of R12_1.0 Version by Wipro
                ar_system_parameters asp,
                xxecs_boleto_gen_ad xbg,
                -- AP_BANK_ACCOUNTS_ALL aba              -- Commented as part of R12_1.0 Version by Wipro
                CE_BANK_ACCOUNTS aba -- Added as part of R12_1.0 Version by Wipro
          WHERE     hca.party_id = hp.party_id
                AND hps.party_id = hp.party_id
                AND hps.party_site_id = hcasa.party_site_id --Added as part of R12_1.2 Version by Wipro
                AND hps.location_id = hl.location_id
                AND hcasa.cust_acct_site_id = hcsua.cust_acct_site_id
                AND aps.customer_trx_id = rct.customer_trx_id
                --AND rct.bill_to_customer_id = cac.customer_id
                AND rct.bill_to_customer_id = hca.cust_account_id -- Modified as part of R12_1.0 Version by Wipro
                AND aba.bank_branch_id = abb.branch_party_id
                AND aba.bank_account_num = jb_bank.bank_account_num_dsp
                AND hcsua.location =              -- cac.location            =
                       (SELECT location
                          FROM hz_cust_site_uses_all --ra_site_uses_all  -- Commented ra_site_uses_all and added hz_cust_site_uses_all as part of R12_1.0 Version by Wipro
                         WHERE site_use_id = aps.customer_site_use_id)
                --AND cac.site_use_code          = 'BILL_TO'
                AND hcsua.site_use_code = 'BILL_TO'
                AND jb_bank.receipt_method_id = xbg.payment_method_id
                AND aps.customer_trx_id = xbg.cust_trx_id
                --AND rct.set_of_books_id        = jbci.set_of_books_id  -- R12.1.1
                --AND jbci.inactive_date        IS NULL   --R12.1.1
                AND hle.organization_id = hoi.organization_id       -- R12.1.1
                AND UPPER (org_information_context) =
                       UPPER ('Legal Entity Accounting')            -- R12.1.1
                AND hoi.org_information1 = rct.set_of_books_id      -- R12.1.1
                AND xbg.printed_flag = 'N'
                AND xbg.status = 'NEW'                                 -- V1.1
                AND xbg.parent_request_id = g_num_request_id           -- V1.1
                AND xbg.payment_schedule_id = aps.payment_schedule_id
                --AND cac.org_id                 = g_num_br_id -- Added for V1.1
                AND hcasa.org_id = g_num_br_id
                AND jb_bank.bank_branch_id_dsp = abb.branch_party_id;
   BEGIN
      fnd_file.put_line (fnd_file.LOG,
                         'Inside ecs_generate_bar_code procedure');
      p_ret_code := 0;

      FOR r_gen_bar_code IN c_gen_bar_code
      LOOP
         l_exception_flag := 'N';                                      -- V1.1
         fnd_file.put_line (
            fnd_file.LOG,
               'Deriving DACs for customer_trx_id - '
            || r_gen_bar_code.customer_trx_id);
         -- Initialise variables
         l_group1 := NULL;
         l_group1_ckd := NULL;
         l_group2 := NULL;
         l_group2_ckd := NULL;
         l_group3 := NULL;
         l_group3_ckd := NULL;
         l_05_amt_1 := NULL;
         l_05_amt_2 := NULL;
         l_05_amt_3 := NULL;
         l_05_amt := NULL;
         l_c9_nosso_numero := NULL;
         cp_nosso_numero_cd := NULL;
         l_cp_nosso_numero_cd := NULL;
         v_num := NULL;
         v_final_chars := NULL;
         l_bar_code := NULL;
         cp_bar_code := NULL;
         l_string := NULL;
         l_05 := NULL;
         l_new_bar_code := NULL;
         l_group4_ckd := NULL;
         l_group5 := NULL;
         l_04_amt := NULL;

         -- Initialise variables
         IF r_gen_bar_code.bank_number_dsp = '341'
         THEN
            fnd_file.put_line (fnd_file.LOG, 'ITAU');
            l_group1 :=
                  r_gen_bar_code.bank_number_dsp
               || '9'
               || LPAD (TO_CHAR (r_gen_bar_code.c11_carteira), 3, '0')
               || SUBSTR (TO_CHAR (r_gen_bar_code.c_pay_schedule_id), 0, 2);
            fnd_file.put_line (fnd_file.LOG, 'l_group1 - ' || l_group1);

            BEGIN                                                      -- V1.1
               l_group1_ckd :=
                  SUBSTR (
                       10
                     - MOD (
                          (  SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 1, 1) * 2),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 1, 1) * 2),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 2, 1) * 1),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 2, 1) * 1),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 3, 1) * 2),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 3, 1) * 2),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 4, 1) * 1),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 4, 1) * 1),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 5, 1) * 2),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 5, 1) * 2),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 6, 1) * 1),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 6, 1) * 1),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 7, 1) * 2),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 7, 1) * 2),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 8, 1) * 1),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 8, 1) * 1),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 9, 1) * 2),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 9, 1) * 2),
                                      2,
                                      '0'),
                                2,
                                1)),
                          10),
                     -1,
                     1);
               fnd_file.put_line (fnd_file.LOG,
                                  'l_group1_ckd - ' || l_group1_ckd);
            EXCEPTION                                                  -- V1.1
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while deriving l_group1_ckd ' || SQLERRM);
                  l_chr_message := 'Error while deriving l_group1_ckd -';
                  l_exception_flag := 'Y';                             -- V1.1
            END;

            BEGIN
               SELECT    LPAD (r_gen_bar_code.bank_agent_number, 4, 0)
                      || LPAD (r_gen_bar_code.bank_account_num, 5, 0)
                      || LPAD (TO_CHAR (r_gen_bar_code.c11_carteira), 3, '0')
                      || LPAD (TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                               8,
                               '0')
                 INTO l_c9_nosso_numero
                 FROM DUAL;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error deriving l_c9_nosso_numero - ' || SQLERRM);
                  --p_ret_code := 1; V1.1
                  l_c9_nosso_numero := NULL;
                  l_chr_message :=
                     l_chr_message || 'Error deriving l_c9_nosso_numero -  ';
                  l_exception_flag := 'Y';                             -- V1.1
            END;

            fnd_file.put_line (fnd_file.LOG,
                               'l_c9_nosso_numero - ' || l_c9_nosso_numero);

            -- Calculation Digit E
            BEGIN
               SELECT SUBSTR (
                           10
                         - MOD (
                              (  SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 1, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 1, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 2, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 2, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 3, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 3, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 4, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 4, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 5, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 5, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 6, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 6, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 7, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 7, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 8, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 8, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 9, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 9, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 10, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 10, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 11, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 11, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 12, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 12, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 13, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 13, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 14, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 14, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 15, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 15, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 16, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 16, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 17, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 17, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 18, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 18, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 19, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 19, 1)
                                          * 1),
                                       2,
                                       '0'),
                                    2,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 20, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    1,
                                    1)
                               + SUBSTR (
                                    LPAD (
                                       TO_CHAR (
                                            SUBSTR (l_c9_nosso_numero, 20, 1)
                                          * 2),
                                       2,
                                       '0'),
                                    2,
                                    1)),
                              10),
                         -1,
                         1)
                 INTO cp_nosso_numero_cd
                 FROM DUAL;

               fnd_file.put_line (
                  fnd_file.LOG,
                  'cp_nosso_numero_cd - ' || cp_nosso_numero_cd);
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                        'Exception while deriving cp_nosso_numero_cd -  '
                     || SQLERRM);
                  --p_ret_code := 1; -- V1.1
                  cp_nosso_numero_cd := NULL;
                  l_chr_message :=
                        l_chr_message
                     || 'Exception while deriving cp_nosso_numero_cd -  ';
                  l_exception_flag := 'Y';                             -- V1.1
            END;

            l_cp_nosso_numero_cd := cp_nosso_numero_cd;
            fnd_file.put_line (
               fnd_file.LOG,
               'l_cp_nosso_numero_cd - ' || l_cp_nosso_numero_cd);
            l_group2 :=
                  SUBSTR (TO_CHAR (r_gen_bar_code.c_pay_schedule_id), 3, 6)
               || cp_nosso_numero_cd
               || SUBSTR (TO_CHAR (r_gen_bar_code.bank_agent_number), 1, 3);
            fnd_file.put_line (fnd_file.LOG, 'l_group2 - ' || l_group2);

            BEGIN
               l_group2_ckd :=
                  SUBSTR (
                       10
                     - MOD (
                            SUBSTR (
                               LPAD (SUBSTR (l_group2, 1, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 1, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 2, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 2, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 3, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 3, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 4, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 4, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 5, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 5, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 6, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 6, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 7, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 7, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 8, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 8, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 9, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 9, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 10, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 10, 1) * 2, 2, '0'),
                               2,
                               1),
                          10),
                     -1,
                     1);
            EXCEPTION                                                  -- V1.1
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Exception while deriving l_group2_ckd -  ' || SQLERRM);
                  l_exception_flag := 'Y';
                  l_chr_message :=
                        l_chr_message
                     || 'Exception while deriving l_group2_ckd  -  ';
            END;

            fnd_file.put_line (fnd_file.LOG,
                               'l_group2_ckd - ' || l_group2_ckd);
            l_group3 :=
                  SUBSTR (r_gen_bar_code.bank_agent_number, 4, 1)
               || SUBSTR (r_gen_bar_code.bank_account_num, 0, 5)
               || r_gen_bar_code.c_check_dig
               || '000';
            fnd_file.put_line (fnd_file.LOG, 'l_group3 - ' || l_group3);

            BEGIN
               l_group3_ckd :=
                  SUBSTR (
                       10
                     - MOD (
                            SUBSTR (
                               LPAD (SUBSTR (l_group3, 1, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 1, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 2, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 2, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 3, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 3, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 4, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 4, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 5, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 5, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 6, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 6, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 7, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 7, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 8, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 8, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 9, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 9, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 10, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 10, 1) * 2, 2, '0'),
                               2,
                               1),
                          10),
                     -1,
                     1);
            EXCEPTION                                                  -- V1.1
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Exception while deriving l_group3_ckd -  ' || SQLERRM);
                  l_exception_flag := 'Y';
                  l_chr_message :=
                        l_chr_message
                     || 'Exception while deriving l_group3_ckd  -  ';
            END;

            fnd_file.put_line (fnd_file.LOG,
                               'l_group3_ckd - ' || l_group3_ckd);

            BEGIN
               SELECT   SUBSTR (r_gen_bar_code.bank_number_dsp, 1, 1) * 4
                      + -- 1  **************************************************
                       SUBSTR (r_gen_bar_code.bank_number_dsp, 2, 1) * 3
                      +  -- 2  * Identifica? do Banco (bank_number) (1 to 3)
                       SUBSTR (r_gen_bar_code.bank_number_dsp, 3, 1) * 2
                      + -- 3  ***************************************************
                       SUBSTR (9, 1, 1) * 9
                      +                             -- 4  Brazil currency code
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     TO_DATE (r_gen_bar_code.c3_vencimento,
                                              'DD/MM/RRRR')
                                   - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                                4,
                                '0'),
                             1,
                             1)
                        * 8
                      + -- 6  ****************************************************************************************
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     TO_DATE (r_gen_bar_code.c3_vencimento,
                                              'DD/MM/RRRR')
                                   - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                                4,
                                '0'),
                             2,
                             1)
                        * 7
                      + -- 7  *  fator de vencimento (expiration factor,: due_date - to_date(07/10/1997,'dd/mm/yyyy')
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     TO_DATE (r_gen_bar_code.c3_vencimento,
                                              'DD/MM/RRRR')
                                   - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                                4,
                                '0'),
                             3,
                             1)
                        * 6
                      + -- 8  *     where 07/10/1997 will always be the same) (6 to 9)
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     TO_DATE (r_gen_bar_code.c3_vencimento,
                                              'DD/MM/RRRR')
                                   - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                                4,
                                '0'),
                             4,
                             1)
                        * 5 -- 9  *****************************************************************************************
                 INTO l_05_amt_1
                 FROM DUAL;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while deriving l_05_amt_1 - ' || SQLERRM);
                  --p_ret_code := 1; V1.1
                  l_exception_flag := 'Y';                             -- V1.1
                  l_chr_message :=
                     l_chr_message || 'Error while deriving l_05_amt_1 -  ';
            --l_05_amt_1 := NULL;
            END;

            fnd_file.put_line (fnd_file.LOG, 'l_05_amt_1 - ' || l_05_amt_1);

            BEGIN
               SELECT     SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             1,
                             1)
                        * 4
                      +          -- 10   *************************************
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             2,
                             1)
                        * 3
                      +                            -- 11   *   document amount
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             3,
                             1)
                        * 2
                      +                              -- 12   *   from 10 to 19
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             4,
                             1)
                        * 9
                      +                                              -- 13   *
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             5,
                             1)
                        * 8
                      +                                              -- 14   *
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             6,
                             1)
                        * 7
                      +                                              -- 15   *
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             7,
                             1)
                        * 6
                      +                                              -- 16   *
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             8,
                             1)
                        * 5
                      +                                              -- 17   *
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             9,
                             1)
                        * 4
                      +                                              -- 18   *
                       SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             10,
                             1)
                        * 3      -- 19   *************************************
                 INTO l_05_amt_2
                 FROM DUAL;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while deriving l_05_amt_2 - ' || SQLERRM);
                  --          p_ret_code := 1; V1.1
                  l_exception_flag := 'Y';                             -- V1.1
                  l_chr_message :=
                     l_chr_message || 'Error while deriving l_05_amt_2 -  ';
            END;

            fnd_file.put_line (fnd_file.LOG, 'l_05_amt_2 - ' || l_05_amt_2);

            BEGIN
               SELECT     SUBSTR (
                             LPAD (TO_CHAR (r_gen_bar_code.c11_carteira),
                                   3,
                                   '0'),
                             1,
                             1)
                        * 2
                      +   SUBSTR (
                             LPAD (TO_CHAR (r_gen_bar_code.c11_carteira),
                                   3,
                                   '0'),
                             3,
                             1)
                        * 8
                      +   SUBSTR (
                             LPAD (TO_CHAR (r_gen_bar_code.c11_carteira),
                                   3,
                                   '0'),
                             2,
                             1)
                        * 9
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                1,
                                '0'),
                             1,
                             1)
                        * 7
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                2,
                                '0'),
                             2,
                             1)
                        * 6
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                3,
                                '0'),
                             3,
                             1)
                        * 5
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                4,
                                '0'),
                             4,
                             1)
                        * 4
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                5,
                                '0'),
                             5,
                             1)
                        * 3
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                6,
                                '0'),
                             6,
                             1)
                        * 2
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                7,
                                '0'),
                             7,
                             1)
                        * 9
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                8,
                                '0'),
                             8,
                             1)
                        * 8
                      + LPAD (cp_nosso_numero_cd, 1, '0') * 7
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_agent_number, 4, '0'),
                             1,
                             1)
                        * 6
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_agent_number, 4, '0'),
                             2,
                             1)
                        * 5
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_agent_number, 4, '0'),
                             3,
                             1)
                        * 4
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_agent_number, 4, '0'),
                             4,
                             1)
                        * 3
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 5, '0'),
                             1,
                             1)
                        * 2
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 5, '0'),
                             2,
                             1)
                        * 9
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 5, '0'),
                             3,
                             1)
                        * 8
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 5, '0'),
                             4,
                             1)
                        * 7
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 5, '0'),
                             5,
                             1)
                        * 6
                      +   SUBSTR (LPAD (r_gen_bar_code.c_check_dig, 1, '0'),
                                  1,
                                  1)
                        * 5
                      + (0 * 4 * 3 * 2)
                 INTO l_05_amt_3
                 FROM DUAL;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while deriving l_05_amt_3 - ' || SQLERRM);
                  --p_ret_code := 1; V1.1
                  l_chr_message :=
                     l_chr_message || 'Error while deriving l_05_amt_3 -  ';
                  l_exception_flag := 'Y';                             -- V1.1
            END;

            fnd_file.put_line (fnd_file.LOG, 'l_05_amt_3 - ' || l_05_amt_3);
            l_05 :=
                 11
               - MOD (
                      NVL (l_05_amt_1, 0)
                    + NVL (l_05_amt_2, 0)
                    + NVL (l_05_amt_3, 0),
                    11);

            IF l_05 <= 0 OR l_05 >= 9
            THEN
               l_05 := 1;
            END IF;

            fnd_file.put_line (fnd_file.LOG, 'l_05 - ' || l_05);
            l_string :=
               (   SUBSTR (l_group1, 1, 5)
                || '.'
                || SUBSTR (l_group1, 6, 4)
                || l_group1_ckd
                || ' '
                || SUBSTR (l_group2, 1, 5)
                || '.'
                || SUBSTR (l_group2, 6, 5)
                || l_group2_ckd
                || ' '
                || SUBSTR (l_group3, 1, 5)
                || '.'
                || SUBSTR (l_group3, 6, 5)
                || l_group3_ckd
                || ' '
                || l_05
                || ' '
                || LPAD (
                      TO_CHAR (
                           TO_DATE (r_gen_bar_code.c3_vencimento,
                                    'DD/MM/RRRR')
                         - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                      4,
                      '0')
                || LPAD (
                      TO_CHAR (
                         NVL (r_gen_bar_code.valor_do_documento * 100, 0)),
                      10,
                      '0'));
            fnd_file.put_line (fnd_file.LOG, 'l_string - ' || l_string);
            l_new_bar_code :=
                  LPAD (r_gen_bar_code.bank_number_dsp, 3, '0')
               || '9'
               || l_05
               || LPAD (
                     TO_CHAR (
                          TO_DATE (r_gen_bar_code.c3_vencimento,
                                   'DD/MM/RRRR')
                        - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                     4,
                     '0')
               || LPAD (
                     TO_CHAR (
                        NVL (r_gen_bar_code.valor_do_documento * 100, 0)),
                     10,
                     '0')
               || LPAD (TO_CHAR (r_gen_bar_code.c11_carteira), 3, '0')
               || LPAD (r_gen_bar_code.c_pay_schedule_id, 8, '0')
               || cp_nosso_numero_cd
               || LPAD (r_gen_bar_code.bank_agent_number, 4, '0')
               || LPAD (r_gen_bar_code.bank_account_num, 5, '0')
               ||                                                       --  40
                 LPAD (r_gen_bar_code.c_check_dig, 1, '0')
               ||                                                        -- 41
                 '000';                                                  -- 44
            fnd_file.put_line (fnd_file.LOG,
                               'l_new_bar_code - ' || l_new_bar_code);

            -- Convert bar code to ASCII
            FOR i IN 1 .. LENGTH (l_new_bar_code)
            LOOP
               IF (MOD (i, 2) = 1)
               THEN
                  -- Read two numbers at the time
                  v_num := TO_NUMBER (SUBSTR (l_new_bar_code, i, 2));

                  IF (v_num < 94)
                  THEN
                     v_final_chars := v_final_chars || CHR (v_num + 33);
                  END IF;

                  IF (v_num >= 94)
                  THEN
                     --v_final_chars := v_final_chars || CHR(v_num + 102);
                     BEGIN
                        SELECT    v_final_chars
                               || CHR (v_num + 103 USING NCHAR_CS)
                          INTO v_final_chars
                          FROM DUAL;
                     EXCEPTION
                        WHEN OTHERS
                        THEN
                           fnd_file.put_line (fnd_file.LOG,
                                              'Exception while getting >=94');
                           l_exception_flag := 'Y';                    -- V1.1
                           l_chr_message :=
                                 l_chr_message
                              || 'Exception while getting >=94 -  ';
                     END;
                  END IF;
               END IF;                                      -- End of MOD(i,2)
            END LOOP;

            -- Retrieve  the start and end character
            BEGIN
               SELECT CHR (203 USING NCHAR_CS), CHR (204 USING NCHAR_CS)
                 INTO v_start_code, v_end_code
                 FROM DUAL;

               fnd_file.put_line (
                  fnd_file.LOG,
                     'v_start_code , v_end_code'
                  || v_start_code
                  || '-'
                  || v_end_code);
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (fnd_file.LOG,
                                     'Encoding..' || SQLERRM (SQLCODE));
                  l_chr_message :=
                     l_chr_message || 'Exception while Encoding -  ';
                  v_start_code := NULL;
                  --p_ret_code := 1; V1.1
                  v_end_code := NULL;
                  l_exception_flag := 'Y';                             -- V1.1
            END;

            -- Final ASCII Bar code
            cp_bar_code := v_start_code || v_final_chars || v_end_code;
         ELSIF r_gen_bar_code.bank_number_dsp = '237'
         THEN
            fnd_file.put_line (fnd_file.LOG, 'BRADESCO');
            l_group1 :=
                  r_gen_bar_code.bank_number_dsp
               || '9'
               || LPAD (TO_CHAR (r_gen_bar_code.bank_agent_number), 4, '0')
               || SUBSTR (
                     LPAD (TO_CHAR (r_gen_bar_code.c11_carteira), 2, '0'),
                     0,
                     1);
            fnd_file.put_line (fnd_file.LOG, 'l_group1 - ' || l_group1);

            BEGIN
               l_group1_ckd :=
                  SUBSTR (
                       10
                     - MOD (
                          (  SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 1, 1) * 2),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 1, 1) * 2),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 2, 1) * 1),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 2, 1) * 1),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 3, 1) * 2),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 3, 1) * 2),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 4, 1) * 1),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 4, 1) * 1),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 5, 1) * 2),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 5, 1) * 2),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 6, 1) * 1),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 6, 1) * 1),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 7, 1) * 2),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 7, 1) * 2),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 8, 1) * 1),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 8, 1) * 1),
                                      2,
                                      '0'),
                                2,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 9, 1) * 2),
                                      2,
                                      '0'),
                                1,
                                1)
                           + SUBSTR (
                                LPAD (TO_CHAR (SUBSTR (l_group1, 9, 1) * 2),
                                      2,
                                      '0'),
                                2,
                                1)),
                          10),
                     -1,
                     1);
            EXCEPTION                                                  -- V1.1
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while deriving l_group1_ckd - ' || SQLERRM);
                  l_exception_flag := 'Y';
                  l_chr_message := 'Error while deriving l_group1_ckd  -  ';
            END;

            fnd_file.put_line (fnd_file.LOG,
                               'l_group1_ckd - ' || l_group1_ckd);

            BEGIN
               SELECT    LPAD (r_gen_bar_code.c11_carteira, 2, '0')
                      || LPAD (TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                               11,
                               '0')
                 INTO l_c9_nosso_numero
                 FROM DUAL;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while deriving l_c9_nosso_numero - ' || SQLERRM);
                  --p_ret_code := 1;
                  l_exception_flag := 'Y';                             -- V1.1
                  l_chr_message :=
                        l_chr_message
                     || 'Error while deriving l_c9_nosso_numero -  ';
                  l_c9_nosso_numero := NULL;
            END;

            fnd_file.put_line (fnd_file.LOG,
                               'l_c9_nosso_numero - ' || l_c9_nosso_numero);
            -- Calculation Digit E
            /* BEGIN V1.2
            SELECT
            11 - MOD(      SUBSTR(l_c9_nosso_numero,1,1) * 2 +
            SUBSTR(l_c9_nosso_numero,2,1) * 7 +
            SUBSTR(l_c9_nosso_numero,3,1) * 6 +
            SUBSTR(l_c9_nosso_numero,4,1) * 5 +
            SUBSTR(l_c9_nosso_numero,5,1) * 4 +
            SUBSTR(l_c9_nosso_numero,6,1) * 3 +
            SUBSTR(l_c9_nosso_numero,7,1) * 2 +
            SUBSTR(l_c9_nosso_numero,8,1) * 7 +
            SUBSTR(l_c9_nosso_numero,9,1) * 6 +
            SUBSTR(l_c9_nosso_numero,10,1) * 5 +
            SUBSTR(l_c9_nosso_numero,11,1) * 4 +
            SUBSTR(l_c9_nosso_numero,12,1) * 3 +
            SUBSTR(l_c9_nosso_numero,13,1) * 2
            ,11)
            INTO cp_nosso_numero_cd
            FROM DUAL;  V1.2 */
            -- V1.2 starts
            l_cp_nosso_numero_cd := get_dac_our_number (l_c9_nosso_numero);
            -- V1.2 ends
            fnd_file.put_line (fnd_file.LOG,
                               'Check Digit E = ' || l_cp_nosso_numero_cd);
            l_group2 :=
                  SUBSTR (
                     LPAD (TO_CHAR (r_gen_bar_code.c11_carteira), 2, '0'),
                     2,
                     1)
               || SUBSTR (
                     LPAD (TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                           11,
                           '0'),
                     0,
                     9);
            fnd_file.put_line (fnd_file.LOG, 'l_group2 - ' || l_group2);

            BEGIN
               l_group2_ckd :=
                  SUBSTR (
                       10
                     - MOD (
                            SUBSTR (
                               LPAD (SUBSTR (l_group2, 1, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 1, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 2, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 2, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 3, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 3, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 4, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 4, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 5, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 5, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 6, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 6, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 7, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 7, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 8, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 8, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 9, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 9, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 10, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group2, 10, 1) * 2, 2, '0'),
                               2,
                               1),
                          10),
                     -1,
                     1);
            EXCEPTION                                                  -- V1.1
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while deriving l_group2_ckd - ' || SQLERRM);
                  l_exception_flag := 'Y';
                  l_chr_message :=
                     l_chr_message || 'Error while deriving l_group2_ckd - ';
            END;

            fnd_file.put_line (fnd_file.LOG,
                               'l_group2_ckd - ' || l_group2_ckd);
            l_group3 :=
                  SUBSTR (LPAD (r_gen_bar_code.c_pay_schedule_id, 11, '0'),
                          10,
                          11)
               || SUBSTR (LPAD (r_gen_bar_code.bank_account_num, 7, '0'),
                          0,
                          7)
               || '0';
            fnd_file.put_line (fnd_file.LOG, 'l_group3 - ' || l_group3);

            BEGIN
               l_group3_ckd :=
                  SUBSTR (
                       10
                     - MOD (
                            SUBSTR (
                               LPAD (SUBSTR (l_group3, 1, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 1, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 2, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 2, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 3, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 3, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 4, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 4, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 5, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 5, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 6, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 6, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 7, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 7, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 8, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 8, 1) * 2, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 9, 1) * 1, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 9, 1) * 1, 2, '0'),
                               2,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 10, 1) * 2, 2, '0'),
                               1,
                               1)
                          + SUBSTR (
                               LPAD (SUBSTR (l_group3, 10, 1) * 2, 2, '0'),
                               2,
                               1),
                          10),
                     -1,
                     1);
            EXCEPTION                                                  -- V1.1
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while deriving l_group3_ckd - ' || SQLERRM);
                  l_exception_flag := 'Y';
                  l_chr_message :=
                     l_chr_message || 'Error while deriving l_group3_ckd - ';
            END;

            fnd_file.put_line (fnd_file.LOG,
                               'l_group3_ckd - ' || l_group3_ckd);

            -- group - 4
            BEGIN
               SELECT   SUBSTR (r_gen_bar_code.bank_number_dsp, 1, 1) * 4
                      + SUBSTR (r_gen_bar_code.bank_number_dsp, 2, 1) * 3
                      + SUBSTR (r_gen_bar_code.bank_number_dsp, 3, 1) * 2
                      + SUBSTR (9, 1, 1) * 9
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     TO_DATE (r_gen_bar_code.c3_vencimento,
                                              'DD/MM/RRRR')
                                   - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                                4,
                                '0'),
                             1,
                             1)
                        * 8
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     TO_DATE (r_gen_bar_code.c3_vencimento,
                                              'DD/MM/RRRR')
                                   - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                                4,
                                '0'),
                             2,
                             1)
                        * 7
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     TO_DATE (r_gen_bar_code.c3_vencimento,
                                              'DD/MM/RRRR')
                                   - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                                4,
                                '0'),
                             3,
                             1)
                        * 6
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     TO_DATE (r_gen_bar_code.c3_vencimento,
                                              'DD/MM/RRRR')
                                   - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                                4,
                                '0'),
                             4,
                             1)
                        * 5
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             1,
                             1)
                        * 4
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             2,
                             1)
                        * 3
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             3,
                             1)
                        * 2
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             4,
                             1)
                        * 9
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             5,
                             1)
                        * 8
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             6,
                             1)
                        * 7
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             7,
                             1)
                        * 6
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             8,
                             1)
                        * 5
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             9,
                             1)
                        * 4
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (
                                     NVL (r_gen_bar_code.valor_do_documento,
                                          0)
                                   * 100),
                                10,
                                '0'),
                             10,
                             1)
                        * 3
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_agent_number, 4, '0'),
                             1,
                             1)
                        * 2
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_agent_number, 4, '0'),
                             2,
                             1)
                        * 9
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_agent_number, 4, '0'),
                             3,
                             1)
                        * 8
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_agent_number, 4, '0'),
                             4,
                             1)
                        * 7
                      +   SUBSTR (
                             LPAD (TO_CHAR (r_gen_bar_code.c11_carteira),
                                   2,
                                   '0'),
                             1,
                             1)
                        * 6
                      +   SUBSTR (
                             LPAD (TO_CHAR (r_gen_bar_code.c11_carteira),
                                   2,
                                   '0'),
                             2,
                             1)
                        * 5
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                11,
                                '0'),
                             1,
                             1)
                        * 4
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                11,
                                '0'),
                             2,
                             1)
                        * 3
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                11,
                                '0'),
                             3,
                             1)
                        * 2
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                11,
                                '0'),
                             4,
                             1)
                        * 9
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                11,
                                '0'),
                             5,
                             1)
                        * 8
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                11,
                                '0'),
                             6,
                             1)
                        * 7
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                11,
                                '0'),
                             7,
                             1)
                        * 6
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                11,
                                '0'),
                             8,
                             1)
                        * 5
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                11,
                                '0'),
                             9,
                             1)
                        * 4
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                11,
                                '0'),
                             10,
                             1)
                        * 3
                      +   SUBSTR (
                             LPAD (
                                TO_CHAR (r_gen_bar_code.c_pay_schedule_id),
                                11,
                                '0'),
                             11,
                             1)
                        * 2
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 7, '0'),
                             1,
                             1)
                        * 9
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 7, '0'),
                             2,
                             1)
                        * 8
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 7, '0'),
                             3,
                             1)
                        * 7
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 7, '0'),
                             4,
                             1)
                        * 6
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 7, '0'),
                             5,
                             1)
                        * 5
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 7, '0'),
                             6,
                             1)
                        * 4
                      +   SUBSTR (
                             LPAD (r_gen_bar_code.bank_account_num, 7, '0'),
                             7,
                             1)
                        * 3
                      + 0 * 2
                 INTO l_04_amt                                    --l_05_amt_3
                 FROM DUAL;

               fnd_file.put_line (fnd_file.LOG, 'l_04_amt - ' || l_04_amt);

               --IF ((11 - MOD ( l_04_amt, 11)) IN (0,1)) OR ((11 - MOD ( l_04_amt, 11)) >=9) THEN commented for V1.2
               IF    ( (11 - MOD (l_04_amt, 11)) IN (0, 1))
                  OR ( (11 - MOD (l_04_amt, 11)) > 9)
               THEN                                                     --V1.1
                  l_group4_ckd := 1;
                  fnd_file.put_line (fnd_file.LOG,
                                     'l_group4_ckd - ' || l_group4_ckd);
               ELSE
                  l_group4_ckd := (11 - MOD (l_04_amt, 11));
                  fnd_file.put_line (fnd_file.LOG,
                                     'l_group4_ckd - ' || l_group4_ckd);
               END IF;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (fnd_file.LOG,
                                     'Error deriving l_04_amt - ' || SQLERRM);
                  --p_ret_code := 1; V1.1
                  l_exception_flag := 'Y';                             -- V1.1
                  l_chr_message :=
                     l_chr_message || 'Error while deriving l_04_amt - ';
            END;

            fnd_file.put_line (fnd_file.LOG, 'l_04_amt - ' || l_04_amt);

            -- group - 5
            BEGIN
               SELECT    SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    TO_DATE (r_gen_bar_code.c3_vencimento,
                                             'DD/MM/RRRR')
                                  - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                               4,
                               '0'),
                            1,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    TO_DATE (r_gen_bar_code.c3_vencimento,
                                             'DD/MM/RRRR')
                                  - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                               4,
                               '0'),
                            2,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    TO_DATE (r_gen_bar_code.c3_vencimento,
                                             'DD/MM/RRRR')
                                  - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                               4,
                               '0'),
                            3,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    TO_DATE (r_gen_bar_code.c3_vencimento,
                                             'DD/MM/RRRR')
                                  - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                               4,
                               '0'),
                            4,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    NVL (r_gen_bar_code.valor_do_documento,
                                         0)
                                  * 100),
                               10,
                               '0'),
                            1,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    NVL (r_gen_bar_code.valor_do_documento,
                                         0)
                                  * 100),
                               10,
                               '0'),
                            2,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    NVL (r_gen_bar_code.valor_do_documento,
                                         0)
                                  * 100),
                               10,
                               '0'),
                            3,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    NVL (r_gen_bar_code.valor_do_documento,
                                         0)
                                  * 100),
                               10,
                               '0'),
                            4,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    NVL (r_gen_bar_code.valor_do_documento,
                                         0)
                                  * 100),
                               10,
                               '0'),
                            5,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    NVL (r_gen_bar_code.valor_do_documento,
                                         0)
                                  * 100),
                               10,
                               '0'),
                            6,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    NVL (r_gen_bar_code.valor_do_documento,
                                         0)
                                  * 100),
                               10,
                               '0'),
                            7,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    NVL (r_gen_bar_code.valor_do_documento,
                                         0)
                                  * 100),
                               10,
                               '0'),
                            8,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    NVL (r_gen_bar_code.valor_do_documento,
                                         0)
                                  * 100),
                               10,
                               '0'),
                            9,
                            1)
                      || SUBSTR (
                            LPAD (
                               TO_CHAR (
                                    NVL (r_gen_bar_code.valor_do_documento,
                                         0)
                                  * 100),
                               10,
                               '0'),
                            10,
                            1)
                 INTO l_group5
                 FROM DUAL;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (fnd_file.LOG,
                                     'Error deriving l_group5 - ' || SQLERRM);
                  --p_ret_code := 1;
                  l_chr_message :=
                     l_chr_message || 'Error while deriving l_group5 - ';
                  l_exception_flag := 'Y';                             -- V1.1
            END;

            l_string :=
                  SUBSTR (l_group1, 1, 5)
               || '.'
               || SUBSTR (l_group1, 6, 4)
               || l_group1_ckd
               || ' '
               || SUBSTR (l_group2, 1, 5)
               || '.'
               || SUBSTR (l_group2, 6, 5)
               || l_group2_ckd
               || ' '
               || SUBSTR (l_group3, 1, 5)
               || '.'
               || SUBSTR (l_group3, 6, 5)
               || l_group3_ckd
               || ' '
               || l_group4_ckd
               || ' '
               || l_group5
               || ' ';
            fnd_file.put_line (fnd_file.LOG, 'l_string - ' || l_string);
            l_new_bar_code :=
                  LPAD (r_gen_bar_code.bank_number_dsp, 3, '0')
               || '9'
               || l_group4_ckd
               || LPAD (
                     TO_CHAR (
                          TO_DATE (r_gen_bar_code.c3_vencimento,
                                   'DD/MM/RRRR')
                        - TO_DATE ('07/10/1997', 'dd/mm/rrrr')),
                     4,
                     '0')
               || LPAD (
                     TO_CHAR (
                        NVL (r_gen_bar_code.valor_do_documento * 100, 0)),
                     10,
                     '0')
               || LPAD (r_gen_bar_code.bank_agent_number, 4, '0')
               || LPAD (TO_CHAR (r_gen_bar_code.c11_carteira), 2, '0')
               || LPAD (r_gen_bar_code.c_pay_schedule_id, 11, '0')
               || LPAD (r_gen_bar_code.bank_account_num, 7, '0')
               || '0';
            fnd_file.put_line (fnd_file.LOG,
                               'l_new_bar_code - ' || l_new_bar_code);

            -- Convert bar code to ASCII
            FOR i IN 1 .. LENGTH (l_new_bar_code)
            LOOP
               IF (MOD (i, 2) = 1)
               THEN
                  -- Read two numbers at the time
                  v_num := TO_NUMBER (SUBSTR (l_new_bar_code, i, 2));

                  IF (v_num < 94)
                  THEN
                     v_final_chars := v_final_chars || CHR (v_num + 33);
                  END IF;

                  IF (v_num >= 94)
                  THEN
                     --v_final_chars := v_final_chars || CHR(v_num + 102);
                     BEGIN
                        SELECT    v_final_chars
                               || CHR (v_num + 103 USING NCHAR_CS)
                          INTO v_final_chars
                          FROM DUAL;
                     EXCEPTION
                        WHEN OTHERS
                        THEN
                           fnd_file.put_line (fnd_file.LOG,
                                              'Exception while getting >=94');
                           l_exception_flag := 'Y';                    -- V1.1
                           l_chr_message :=
                                 l_chr_message
                              || 'Exception while getting >=94 - ';
                     END;
                  END IF;
               END IF;                                      -- End of MOD(i,2)
            END LOOP;

            -- Retrieve  the start and end character
            BEGIN
               SELECT CHR (203 USING NCHAR_CS), CHR (204 USING NCHAR_CS)
                 INTO v_start_code, v_end_code
                 FROM DUAL;

               fnd_file.put_line (
                  fnd_file.LOG,
                     'v_start_code , v_end_code'
                  || v_start_code
                  || '-'
                  || v_end_code);
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (fnd_file.LOG,
                                     'Encoding..' || SQLERRM (SQLCODE));
                  v_start_code := NULL;
                  --p_ret_code := 1;
                  l_chr_message :=
                     l_chr_message || 'Exception while Encoding - ';
                  l_exception_flag := 'Y';                             -- V1.1
                  v_end_code := NULL;
            END;

            -- Final ASCII Bar code
            cp_bar_code := v_start_code || v_final_chars || v_end_code;
         END IF;                                             -- Bank Name type

         IF l_exception_flag = 'N'
         THEN                                                          -- V1.1
            BEGIN
               fnd_file.put_line (
                  fnd_file.LOG,
                     'customer_trx_id ,payment_schedule_id '
                  || r_gen_bar_code.customer_trx_id
                  || r_gen_bar_code.payment_schedule_id);

               --UPDATE XXECS_DIST.XXECS_BOLETO_GEN_AD                       --Commented as part of R12_1.0 Version by Wipro
               UPDATE XXECS_BOLETO_GEN_AD --Added as part of R12_1.0 Version by Wipro
                  SET BAR_CODE_DSP = l_string,
                      BAR_CODE_PRINT = cp_bar_code,
                      nosso_numero =
                         nosso_numero || '-' || l_cp_nosso_numero_cd
                WHERE     cust_trx_id = r_gen_bar_code.customer_trx_id
                      AND payment_schedule_id =
                             r_gen_bar_code.payment_schedule_id;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                        'Exception while updating XXECS_BOLETO_GEN_AD - '
                     || SQLERRM);
            END;
         ELSE
            BEGIN
               fnd_file.put_line (
                  fnd_file.LOG,
                     'customer_trx_id ,payment_schedule_id '
                  || r_gen_bar_code.customer_trx_id
                  || r_gen_bar_code.payment_schedule_id);

               --UPDATE XXECS_DIST.XXECS_BOLETO_GEN_AD                       --Commented as part of R12_1.0 Version by Wipro
               UPDATE XXECS_BOLETO_GEN_AD --Added as part of R12_1.0 Version by Wipro
                  SET error_message = l_chr_message, status = 'ERROR'
                WHERE     cust_trx_id = r_gen_bar_code.customer_trx_id
                      AND payment_schedule_id =
                             r_gen_bar_code.payment_schedule_id;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                        'Exception while updating XXECS_BOLETO_GEN_AD - '
                     || SQLERRM);
            END;
         END IF;                                 -- l_exception_flag V1.1 ends
      END LOOP;

      COMMIT;
      fnd_file.put_line (fnd_file.LOG, 'After Loop');
   EXCEPTION
      WHEN OTHERS
      THEN
         fnd_file.put_line (fnd_file.LOG,
                            'ecs_generate_bar_code proc -' || SQLERRM);
         p_ret_code := 2;
   END ecs_generate_bar_code;

   PROCEDURE main_boleto_process (
      out_num_ret_code      OUT NUMBER,
      out_num_msg_char      OUT VARCHAR2,
      p_low_trx_date     IN     DATE DEFAULT NULL,
      p_high_trx_date    IN     DATE DEFAULT NULL,
      p_in_pay_method    IN     NUMBER,
      p_cust_name        IN     VARCHAR2 DEFAULT NULL,
      p_cust_number      IN     VARCHAR2 DEFAULT NULL,
      p_trx_num_low      IN     VARCHAR2 DEFAULT NULL,
      p_trx_num_high     IN     VARCHAR2 DEFAULT NULL,
      p_ord_num_low      IN     NUMBER DEFAULT NULL,         -- Added for V1.6
      p_ord_num_high     IN     NUMBER DEFAULT NULL,         -- Added for V1.6
      p_gen_inv_kit      IN     VARCHAR2                     -- Added for V1.6
                                        )
   IS
      l_high_trx_id           NUMBER;
      l_low_trx_id            NUMBER;
      l_payment_method        NUMBER;
      l_request_id            NUMBER := 0;
      l_request_id2           NUMBER := 0;
      g_global_burst_req_id   NUMBER;
      l_layout                BOOLEAN;
      l_trx_num               VARCHAR2 (30);
      --l_insert_flag VARCHAR2(1):= 'N';
      l_ret_code              NUMBER;
      l_ret_err_msg           VARCHAR2 (4000);
      p_customer_id           NUMBER;
      ln_no_boleto_flag       NUMBER; -- Added for No Boleto Generation
      lc_phase                VARCHAR2 (50);
      lc_status               VARCHAR2 (50);
      lc_dev_phase            VARCHAR2 (50);
      lc_dev_status           VARCHAR2 (50);
      lc_message              VARCHAR2 (50);
      l_req_return_status     BOOLEAN;
      l_br_amount             VARCHAR2 (1000);
      --V1.1
      l_phase                 VARCHAR2 (50);
      l_status                VARCHAR2 (50);
      l_dev_phase             VARCHAR2 (50);
      l_dev_status            VARCHAR2 (50);
      l_message               VARCHAR2 (50);

      --V1.1
      lv_po_count             NUMBER := 0;                   -- Added for V1.7
      lv_inv_count            NUMBER := 0;                   -- Added for V1.7
      l_inv_tot_amt           VARCHAR2 (1000);               -- Added for V1.7
      l_num_inv_days          NUMBER := 0; -- v1.8
      l_bol_result            BOOLEAN := FALSE;
      l_num_govt_agcy_cnt     NUMBER := 0;     
      
      CURSOR c_inv_trx (
         l_low_trx_dt      DATE,
         l_high_trx_dt     DATE,
         l_pay_methd       NUMBER,
         l_cust_name       VARCHAR2,
         l_cust_number     VARCHAR2,
         l_trx_num_low     VARCHAR2,
         l_trx_num_high    VARCHAR2,
         l_ord_num_low     NUMBER                                      -- V1.6
                                 ,
         l_ord_num_high    NUMBER                                      -- V1.6
                                 )
      IS
         --R12_1.2 --
         SELECT rt.bill_to_customer_id customer_id,
                rt.customer_trx_id,
                hcasa.cust_acct_site_id address_id,          --cac.address_id,
                aps.terms_sequence_number,
                aps.payment_schedule_id,
                (abb.bank_number || '-' || hp3.attribute15) bank_num_A, -- R12_1.4  changed hcsa to hp table for BRADESCO Bank Account
                --jbci.name,
                --Added from 11i code and changed the table R12_1.4
                DECODE(abb.bank_number,'237',(UPPER(hle_add.name) || CHR(13) ||
                                            SUBSTR(hle_add.registration_number, 1,2) || '.' ||
                                            SUBSTR(hle_add.registration_number, 3,3) || '.' ||
                                            SUBSTR(hle_add.registration_number, 6,3) || '/' ||
                                            SUBSTR(hle_add.registration_number, 9,4) || '.' ||
                                            SUBSTR(hle_add.registration_number,13,2) || CHR(13) ||
                                             hle_add.add1 || ',' ||hle_add.add2||'-'||hle_add.add3||','
                                            ||hle_add.city||','||hle_add.state||','||hle_add.country||','||hle_add.postal_code ),
                                        '341', UPPER(hle_add.name)) NAME ,
                -- End change R12_1.4
                (jb_bank.bank_num_dsp || '/' || bank_account_num_dsp)
                   agencia_codigo,
                --cac.nome_cliente c22_nome_clliente,
                hp.party_name c22_nome_clliente,
                DECODE (
                   abb.bank_number,
                   '237',    hl.address1                        --cac.endereco
                          || '  '
                          || hl.address2                          --endereco_1
                          || '                           '
                          || hl.address4                              --bairro
                          || '               '
                          || (   SUBSTR (RAA.GLOBAL_ATTRIBUTE3, 2, 2)
                              || '.'
                              || SUBSTR (RAA.GLOBAL_ATTRIBUTE3, 4, 3)
                              || '.'
                              || SUBSTR (RAA.GLOBAL_ATTRIBUTE3, 7, 3)
                              || '/'
                              || RAA.GLOBAL_ATTRIBUTE4
                              || '.'
                              || RAA.GLOBAL_ATTRIBUTE5),
                   '341', (   hl.address1                       --cac.endereco
                           || '  '
                           || hl.address2                         --endereco_1
                           || '                           '
                           || hl.address4                             --bairro
                                         ))
                   c22_line1,
                   hl.postal_code                                   -- cac.cep
                || '      '
                || hl.city                                            --cidade
                || '                           '
                || hl.state                                               --uf
                   c22_line2,
                aps.trx_date c4_data_do_documento,
                DECODE (
                   abb.bank_number,
                   '237',    LPAD (jb_bank.PORTFOLIO_CODE, 2, '0')
                          || '/'
                          || LPAD (aps.PAYMENT_SCHEDULE_ID, 11, 0),
                   '341',    LPAD (jb_bank.PORTFOLIO_CODE, 3, '0')
                          || '/'
                          || LPAD (aps.PAYMENT_SCHEDULE_ID, 8, 0))
                   nosso_numero_E,
                APS.TRX_NUMBER || '-' || aps.terms_sequence_number
                   do_documento_G,
                aps.amount_due_remaining valor_do_documento,
                TO_CHAR (APS.DUE_DATE, 'DD/MM/YYYY') vencimento_F,
                jb_bank.portfolio_code c11_carteira,
                -- Added for V1.6
                rt.trx_number,
                (SELECT ooh.ORDER_NUMBER
                   FROM oe_order_headers_all ooh
                  WHERE TO_CHAR (ooh.order_number) =
                           rt.interface_header_attribute1)
                   order_number,                             -- Added for V1.7
                /* ooh.order_number,
                 (SELECT DISTINCT poh.segment1
                    FROM po_headers_all poh, oe_drop_ship_sources ood
                   WHERE     ood.po_header_id = poh.po_header_id
                         AND ood.header_id = ooh.header_id)   po_number,*/
                -- V1.7
                hp2.party_name customer_name,
                raa.global_attribute8 -- v1.8,
           -- end for V1.6
           FROM ra_customer_trx_all rt,
                hz_cust_accounts hca,
                hz_parties hp,
                hz_party_sites hps,
                hz_locations hl,
                hz_cust_acct_sites_all hcasa,
                hz_cust_site_uses_all hcsua,
                ar_payment_schedules_all aps,
                jl_br_ar_rec_met_accts_ext_v jb_bank,
                CE_BANK_ACCOUNTS aba,
                AR_RECEIPT_METHOD_ACCOUNTS_ALL arm,
                --jl_br_company_infos jbci,        --R12_1.1
                hr_legal_entities hle,                              -- R12_1.1
                hr_organization_information hoi,                    -- R12_1.1
                RA_CUST_TRX_TYPES_ALL rctta,
                CE_BANK_BRANCHES_V abb,
                HZ_CUST_ACCT_SITES_ALL raa,
                hz_parties hp2,
                HZ_CUST_ACCOUNTS rc,
                jl_br_customer_trx_exts jcte,
                --   oe_order_headers_all ooh,  -- Added for V1.6   -- Commented for V1.7
                hz_parties hp3,                         -- Added to get BRADESCO Bank Account DFF R12_1.4
                -- R12_1.1
                (SELECT xep.legal_entity_id Legal_Entity_id,
                        reg.registration_number registration_number,
                        xep.name name,
                        hr_loc.address_line_1 add1,
                        hr_loc.address_line_2 add2,
                        hr_loc.address_line_3 add3,
                        hr_loc.town_or_city city,
                        hr_loc.region_2 state,
                        hr_loc.country Country,
                        hr_loc.postal_code postal_code
                   FROM xle_entity_profiles xep,
                        xle_registrations reg,
                        hr_legal_entities hle,
                        hr_locations_all hr_loc
                  WHERE     1 = 1
                        AND xep.transacting_entity_flag = 'Y'
                        AND xep.legal_entity_id = reg.source_id
                        AND reg.source_table = 'XLE_ENTITY_PROFILES'
                        AND reg.identifying_flag = 'Y'
                        AND reg.location_id = hr_loc.location_id
                        AND hle.organization_id = xep.legal_entity_id)
                hle_add
          -- R12_1.1
          WHERE     1 = 1
                AND hca.party_id = hp.party_id
                --and rt.trx_number='55381'
                AND hps.party_id = hp.party_id
                AND hps.party_site_id = hcasa.party_site_id
                AND hps.location_id = hl.location_id
                AND hcasa.cust_acct_site_id = hcsua.cust_acct_site_id
                AND rt.bill_to_customer_id = hca.cust_account_id
                AND aps.customer_trx_id = rt.customer_trx_id                
                -- AND rt.INTERFACE_HEADER_ATTRIBUTE1 =    TO_CHAR (ooh.order_number)   -- V1.6  Commented for V1.7
                AND hcsua.location =
                       (SELECT location
                          FROM hz_cust_site_uses_all
                         WHERE site_use_id = aps.customer_site_use_id)
                AND jb_bank.receipt_method_id = l_pay_methd
                AND rt.org_id = g_num_br_id
                AND hcsua.site_use_code = 'BILL_TO'
                AND aba.bank_branch_id = abb.branch_party_id
                AND abb.branch_party_id = hp3.party_id        -- R12_1.4 Added for BRADESCO Bank Account DFF
                AND aba.bank_account_id = arm.REMIT_BANK_ACCT_USE_ID
                AND rt.complete_flag = 'Y'
                AND rt.cust_trx_type_id = rctta.cust_trx_type_id
                AND rctta.accounting_affect_flag = 'Y'
                AND rctta.TYPE = 'INV'
                --  AND arm.RECEIPT_METHOD_ID        = rt.RECEIPT_METHOD_ID   -- R12_1.3
                AND arm.receipt_method_id = jb_bank.receipt_method_id
                --AND rt.set_of_books_id           = jbci.set_of_books_id
                --AND jbci.inactive_date          IS NULL
                AND hle.organization_id = hoi.organization_id       -- R12.1.1
                AND UPPER (org_information_context) =
                       UPPER ('Legal Entity Accounting')            -- R12.1.1
                AND hoi.org_information1 = rt.set_of_books_id       -- R12.1.1
                AND hle.organization_id = hle_add.legal_entity_id   -- R12.1.1
                AND raa.cust_acct_site_id = hcasa.cust_acct_site_id
                AND hca.party_id = hp2.party_id
                AND aps.amount_due_remaining > 0 -- v1.8
                /*AND raa.global_attribute8 NOT IN (SELECT meaning
                                                    FROM fnd_lookup_values_vl
                                                   WHERE     lookup_type =
                                                                'XXECS_BOLETO_CONTRIBUTOR_CLASS'
                                                         AND enabled_flag =
                                                                'Y') */ --v1.8
                AND rc.cust_account_id = rt.bill_to_customer_id
                -- v1.8 start
               /* AND hp2.party_name = NVL (l_cust_name, hp2.party_name)
                AND rc.account_number =
                       NVL (l_cust_number, rc.account_number)
                AND rt.trx_number BETWEEN NVL (l_trx_num_low, rt.trx_number)
                                      AND NVL (l_trx_num_high, rt.trx_number)
                AND rt.trx_date BETWEEN NVL (
                                           TO_DATE (
                                              TO_CHAR (
                                                 TO_DATE (l_low_trx_dt,
                                                          'DD-MON-YY'),
                                                 'DD/MM/YYYY'),
                                              'DD/MM/YYYY'),
                                           rt.trx_date)
                                    AND NVL (
                                           TO_DATE (
                                              TO_CHAR (
                                                 TO_DATE (l_high_trx_dt,
                                                          'DD-MON-YY'),
                                                 'DD/MM/YYYY'),
                                              'DD/MM/YYYY'),
                                           rt.trx_date) */ -- v1.8 end commenting
                /*    AND ooh.order_number BETWEEN NVL (l_ord_num_low,
                                                      ooh.order_number)
                                             AND NVL (l_ord_num_high,
                                                      ooh.order_number)  */
                -- Added for V1.6 -- Commented for V1.7
                /*AND NVL (rt.interface_header_attribute1, 'X') BETWEEN NVL (
                                                                         TO_CHAR (
                                                                            l_ord_num_low),
                                                                         NVL (
                                                                            rt.interface_header_attribute1,
                                                                            'X'))
                                                                  AND NVL (
                                                                         TO_CHAR (
                                                                            l_ord_num_high),
                                                                         NVL (
                                                                            rt.interface_header_attribute1,
                                                                            'X')) -- Added for V1.7
                */ 
                AND (hp2.party_name = l_cust_name OR l_cust_name IS NULL)
                AND (rc.account_number = l_cust_number OR l_cust_number IS NULL)
                AND ((rt.trx_number >= l_trx_num_low OR l_trx_num_low IS NULL) AND (rt.trx_number <= l_trx_num_high OR l_trx_num_high IS NULL))
                AND ((rt.trx_date >= TO_DATE ( TO_CHAR (TO_DATE (l_low_trx_dt,'DD-MON-YY'),'DD/MM/YYYY'),'DD/MM/YYYY') OR l_low_trx_dt IS NULL) AND 
                     (rt.trx_date <= TO_DATE ( TO_CHAR (TO_DATE (l_high_trx_dt,'DD-MON-YY'),'DD/MM/YYYY'),'DD/MM/YYYY')) OR l_high_trx_dt IS NULL)										
                AND ((rt.interface_header_attribute1 >= TO_CHAR(l_ord_num_low) OR l_ord_num_low IS NULL) AND (rt.interface_header_attribute1 <= TO_CHAR(l_ord_num_high) OR l_ord_num_high IS NULL))
                --v1.8 end	
                AND jcte.customer_trx_id = rt.customer_trx_id
                AND jcte.electronic_inv_status = '2'
                AND NOT EXISTS
                       (SELECT 1
                          FROM XXECS_BOLETO_GEN_AD xbg
                         WHERE     xbg.cust_trx_id = rt.customer_trx_id
                               AND xbg.payment_schedule_id =
                                      aps.payment_schedule_id
                               AND xbg.status = 'SUCCESS')
         UNION ALL
         SELECT rt.bill_to_customer_id customer_id,
                rt.customer_trx_id,
                hcasa.cust_acct_site_id,                     --cac.address_id,
                aps.terms_sequence_number,
                aps.payment_schedule_id,
                (abb.bank_number || '-' || hp3.attribute15) bank_num_A, -- R12_1.4 hcasa to hp table for BRADESCO Bank DFF
                --jbci.name,
                --Added from 11i code and changed the table R12_1.4
                DECODE(abb.bank_number,'237', (UPPER(hle_add.name) || CHR(13) ||
                                            SUBSTR(hle_add.registration_number, 1,2) || '.' ||
                                            SUBSTR(hle_add.registration_number, 3,3) || '.' ||
                                            SUBSTR(hle_add.registration_number, 6,3) || '/' ||
                                            SUBSTR(hle_add.registration_number, 9,4) || '.' ||
                                            SUBSTR(hle_add.registration_number,13,2) || CHR(13) ||
                                            hle_add.add1 || ',' ||hle_add.add2||'-'||hle_add.add3||','
                                            ||hle_add.city||','||hle_add.state||','||hle_add.country||','||hle_add.postal_code),
                                      '341', UPPER(hle_add.name)) NAME,
                -- End change R12_1.4
                (jb_bank.bank_num_dsp || '/' || bank_account_num_dsp)
                   agencia_codigo,
                -- cac.nome_cliente c22_nome_clliente,
                hp.party_name c22_nome_clliente,
                DECODE (
                   abb.bank_number,
                   '237',    hl.address1                        --cac.endereco
                          || '  '
                          || hl.address2                         -- endereco_1
                          || '                           '
                          || hl.address4                             -- bairro
                          || '               '
                          || (   SUBSTR (RAA.GLOBAL_ATTRIBUTE3, 2, 2)
                              || '.'
                              || SUBSTR (RAA.GLOBAL_ATTRIBUTE3, 4, 3)
                              || '.'
                              || SUBSTR (RAA.GLOBAL_ATTRIBUTE3, 7, 3)
                              || '/'
                              || RAA.GLOBAL_ATTRIBUTE4
                              || '.'
                              || RAA.GLOBAL_ATTRIBUTE5),
                   '341', (   hl.address1                       --cac.endereco
                           || '  '
                           || hl.address2                        -- endereco_1
                           || '                           '
                           || hl.address4                             --bairro
                                         ))
                   c22_line1,
                   hl.postal_code                                   -- cac.cep
                || '      '
                || hl.city                                            --cidade
                || '                           '
                || hl.state                                               --uf
                   c22_line2,
                aps.trx_date c4_data_do_documento,
                DECODE (
                   abb.bank_number,
                   '237',    LPAD (jb_bank.PORTFOLIO_CODE, 2, '0')
                          || '/'
                          || LPAD (aps.PAYMENT_SCHEDULE_ID, 11, 0),
                   '341',    LPAD (jb_bank.PORTFOLIO_CODE, 3, '0')
                          || '/'
                          || LPAD (aps.PAYMENT_SCHEDULE_ID, 8, 0))
                   nosso_numero_E,
                APS.TRX_NUMBER || '-' || aps.terms_sequence_number
                   do_documento_G,
                aps.amount_due_remaining valor_do_documento,
                TO_CHAR (APS.DUE_DATE, 'DD/MM/YYYY') vencimento_F,
                jb_bank.portfolio_code c11_carteira,
                -- Added for V1.6
                rt.trx_number,
                (SELECT ooh.ORDER_NUMBER
                   FROM oe_order_headers_all ooh
                  WHERE TO_CHAR (ooh.order_number) =
                           rt.interface_header_attribute1)
                   order_number,                             -- Added for V1.7
                /*ooh.order_number,
               (SELECT DISTINCT poh.segment1
                  FROM po_headers_all poh, oe_drop_ship_sources ood
                 WHERE     ood.po_header_id = poh.po_header_id
                       AND ood.header_id = ooh.header_id)
                  po_number, */
                --Commented for V1.7
                hp2.party_name customer_name,
                raa.global_attribute8 -- v1.8                
           -- end for V1.6
           FROM ra_customer_trx_all rt,
                hz_cust_accounts hca,
                hz_parties hp,
                hz_party_sites hps,
                hz_locations hl,
                hz_cust_acct_sites_all hcasa,
                hz_cust_site_uses_all hcsua,
                ar_payment_schedules_all aps,
                jl_br_ar_rec_met_accts_ext_v jb_bank,
                CE_BANK_ACCOUNTS aba,
                AR_RECEIPT_METHOD_ACCOUNTS_ALL arm,
                --jl_br_company_infos jbci,        --R12_1.1
                hr_legal_entities hle,                              -- R12_1.1
                hr_organization_information hoi,                    -- R12_1.1
                RA_CUST_TRX_TYPES_ALL rctta,
                CE_BANK_BRANCHES_V abb,
                HZ_CUST_ACCT_SITES_ALL raa,
                hz_parties hp2,
                HZ_CUST_ACCOUNTS rc,
                --oe_order_headers_all ooh,                    -- Added for V1.6   -- Commented for V1.7
                hz_parties hp3,                                   -- R12_1.4 Added for BRADESCO Bank Account DFF
                -- R12_1.1
                (SELECT xep.legal_entity_id Legal_Entity_id,
                        reg.registration_number registration_number,
                        xep.name name,
                        hr_loc.address_line_1 add1,
                        hr_loc.address_line_2 add2,
                        hr_loc.address_line_3 add3,
                        hr_loc.town_or_city city,
                        hr_loc.region_2 state,
                        hr_loc.country Country,
                        hr_loc.postal_code postal_code
                   FROM xle_entity_profiles xep,
                        xle_registrations reg,
                        hr_legal_entities hle,
                        hr_locations_all hr_loc
                  WHERE     1 = 1
                        AND xep.transacting_entity_flag = 'Y'
                        AND xep.legal_entity_id = reg.source_id
                        AND reg.source_table = 'XLE_ENTITY_PROFILES'
                        AND reg.identifying_flag = 'Y'
                        AND reg.location_id = hr_loc.location_id
                        AND hle.organization_id = xep.legal_entity_id)
                hle_add
          -- R12_1.1
          WHERE     1 = 1
                AND hca.party_id = hp.party_id
                --and rt.trx_number='55381'
                AND hps.party_id = hp.party_id
                AND hps.party_site_id = hcasa.party_site_id
                AND hps.location_id = hl.location_id
                AND hcasa.cust_acct_site_id = hcsua.cust_acct_site_id
                AND rt.bill_to_customer_id = hca.cust_account_id
                AND aps.customer_trx_id = rt.customer_trx_id                
                -- AND rt.INTERFACE_HEADER_ATTRIBUTE1 =         TO_CHAR (ooh.order_number)                      -- V1.6 -- Commented for V1.7
                AND hcsua.location =
                       (SELECT location
                          FROM hz_cust_site_uses_all
                         WHERE site_use_id = aps.customer_site_use_id)
                AND jb_bank.receipt_method_id = l_pay_methd
                AND rt.org_id = g_num_br_id
                AND hcsua.site_use_code = 'BILL_TO'
                AND aba.bank_branch_id = abb.branch_party_id
                AND abb.branch_party_id = hp3.party_id             -- R12_1.4 Added for BRADESCO Bank Account DFF
                AND aba.bank_account_id = arm.REMIT_BANK_ACCT_USE_ID
                AND rt.complete_flag = 'Y'
                AND rt.cust_trx_type_id = rctta.cust_trx_type_id
                AND rctta.accounting_affect_flag = 'Y'
                AND rctta.TYPE = 'DM'
                -- AND arm.RECEIPT_METHOD_ID        = rt.RECEIPT_METHOD_ID           -- R12.1.3
                AND arm.receipt_method_id = jb_bank.receipt_method_id
                -- AND rt.set_of_books_id           = jbci.set_of_books_id
                -- AND jbci.inactive_date          IS NULL
                AND hle.organization_id = hoi.organization_id       -- R12.1.1
                AND UPPER (org_information_context) =
                       UPPER ('Legal Entity Accounting')            -- R12.1.1
                AND hoi.org_information1 = rt.set_of_books_id       -- R12.1.1
                AND hle.organization_id = hle_add.legal_entity_id   -- R12.1.1
                AND raa.cust_acct_site_id = hcasa.cust_acct_site_id
                AND hca.party_id = hp2.party_id
                AND aps.amount_due_remaining > 0 -- V1.8
                /* AND raa.global_attribute8 NOT IN (SELECT meaning
                                                    FROM fnd_lookup_values_vl
                                                   WHERE     lookup_type =
                                                                'XXECS_BOLETO_CONTRIBUTOR_CLASS'
                                                         AND enabled_flag =
                                                                'Y') */ -- v1.8
                AND rc.cust_account_id = rt.bill_to_customer_id
                --v1.8 start
                /*AND hp2.party_name = NVL (l_cust_name, hp2.party_name)
                AND rc.account_number =
                       NVL (l_cust_number, rc.account_number)
                AND rt.trx_number BETWEEN NVL (l_trx_num_low, rt.trx_number)
                                      AND NVL (l_trx_num_high, rt.trx_number)
                AND rt.trx_date BETWEEN NVL (
                                           TO_DATE (
                                              TO_CHAR (
                                                 TO_DATE (l_low_trx_dt,
                                                          'DD-MON-YY'),
                                                 'DD/MM/YYYY'),
                                              'DD/MM/YYYY'),
                                           rt.trx_date)
                                    AND NVL (
                                           TO_DATE (
                                              TO_CHAR (
                                                 TO_DATE (l_high_trx_dt,
                                                          'DD-MON-YY'),
                                                 'DD/MM/YYYY'),
                                              'DD/MM/YYYY'),
                                           rt.trx_date)*/
                /* AND ooh.order_number BETWEEN NVL (l_ord_num_low,
                                                   ooh.order_number)
                                          AND NVL (l_ord_num_high,
                                                   ooh.order_number) */                
                -- Added for V1.6   -- Added for V1.6 -- Commented for V1.7
                /*AND NVL (rt.interface_header_attribute1, 'X') BETWEEN NVL (
                                                                         TO_CHAR (
                                                                            l_ord_num_low),
                                                                         NVL (
                                                                            rt.interface_header_attribute1,
                                                                            'X'))
                                                                  AND NVL (
                                                                         TO_CHAR (
                                                                            l_ord_num_high),
                                                                         NVL (
                                                                            rt.interface_header_attribute1,
                                                                            'X')) -- Added for V1.7
                */ 
                AND (hp2.party_name = l_cust_name OR l_cust_name IS NULL)
                AND (rc.account_number = l_cust_number OR l_cust_number IS NULL)
                AND ((rt.trx_number >= l_trx_num_low OR l_trx_num_low IS NULL) AND (rt.trx_number <= l_trx_num_high OR l_trx_num_high IS NULL))
                AND ((rt.trx_date >= TO_DATE ( TO_CHAR (TO_DATE (l_low_trx_dt,'DD-MON-YY'),'DD/MM/YYYY'),'DD/MM/YYYY') OR l_low_trx_dt IS NULL) AND 
                     (rt.trx_date <= TO_DATE ( TO_CHAR (TO_DATE (l_high_trx_dt,'DD-MON-YY'),'DD/MM/YYYY'),'DD/MM/YYYY')) OR l_high_trx_dt IS NULL)										
                AND ((rt.interface_header_attribute1 >= TO_CHAR(l_ord_num_low) OR l_ord_num_low IS NULL) AND (rt.interface_header_attribute1 <= TO_CHAR(l_ord_num_high) OR l_ord_num_high IS NULL))
                --v1.8 end
                AND NOT EXISTS
                       (SELECT 1
                          FROM XXECS_BOLETO_GEN_AD xbg
                         WHERE     xbg.cust_trx_id = rt.customer_trx_id
                               AND xbg.payment_schedule_id =
                                      aps.payment_schedule_id
                               AND xbg.status = 'SUCCESS');

      --R12_1.2 --
      -- Added for V1.4 ends
      
      -- v1.8 start query to pull records at customer level or invoice level based on p_gen_inv_kit flag
      CURSOR c_get_cust (
         l_low_trx_dt      DATE,
         l_high_trx_dt     DATE,
         l_pay_methd       NUMBER,
         l_cust_name       VARCHAR2,
         l_cust_number     VARCHAR2,
         l_trx_num_low     VARCHAR2,
         l_trx_num_high    VARCHAR2)
      IS
         SELECT customer_id, trx_num, bank_num_dsp, email_group, attribute8 -- v1.8
           FROM           
               (SELECT DISTINCT customer_id, NULL trx_num, bank_num_dsp, email_group , attribute8     -- V1.1
                 FROM XXECS_BOLETO_GEN_AD
                WHERE     printed_flag = 'N'
                      AND status = 'NEW'                                   -- V1.1
                      AND parent_request_id = g_num_request_id             -- V1.1
                      AND pagador_name = NVL (l_cust_name, pagador_name)
                      AND customer_id =
                             NVL (
                                (SELECT hca1.cust_account_id
                                   --FROM ra_customers          --Commented as part of R12_1.0 Version by Wipro
                                   FROM HZ_PARTIES hp, HZ_CUST_ACCOUNTS hca1 --Added as part of R12_1.0 Version by Wipro
                                  WHERE     hca1.account_number = l_cust_number
                                        AND hca1.party_id = hp.party_id),
                                customer_id)
                      AND SUBSTR (do_documento,
                                  0,
                                  INSTR (do_documento, '-', 1) - 1) BETWEEN NVL (
                                                                               l_trx_num_low,
                                                                               SUBSTR (
                                                                                  do_documento,
                                                                                  0,
                                                                                    INSTR (
                                                                                       do_documento,
                                                                                       '-',
                                                                                       1)
                                                                                  - 1))
                                                                        AND NVL (
                                                                               l_trx_num_high,
                                                                               SUBSTR (
                                                                                  do_documento,
                                                                                  0,
                                                                                    INSTR (
                                                                                       do_documento,
                                                                                       '-',
                                                                                       1)
                                                                                  - 1))
                      AND data_do_documento BETWEEN NVL (
                                                       TO_DATE (l_low_trx_dt,
                                                                'DD-MON-YY'),
                                                       data_do_documento)
                                                AND NVL (
                                                       TO_DATE (l_high_trx_dt,
                                                                'DD-MON-YY'),
                                                       data_do_documento)
                      AND p_gen_inv_kit = 'N'
             UNION ALL
             SELECT DISTINCT customer_id, attribute1 trx_num, bank_num_dsp, email_group, attribute8     -- V1.1
                 FROM XXECS_BOLETO_GEN_AD
                WHERE     printed_flag = 'N'
                      AND status = 'NEW'                                   -- V1.1
                      AND parent_request_id = g_num_request_id             -- V1.1
                      AND pagador_name = NVL (l_cust_name, pagador_name)
                      AND customer_id =
                             NVL (
                                (SELECT hca1.cust_account_id
                                   --FROM ra_customers          --Commented as part of R12_1.0 Version by Wipro
                                   FROM HZ_PARTIES hp, HZ_CUST_ACCOUNTS hca1 --Added as part of R12_1.0 Version by Wipro
                                  WHERE     hca1.account_number = l_cust_number
                                        AND hca1.party_id = hp.party_id),
                                customer_id)
                      AND SUBSTR (do_documento,
                                  0,
                                  INSTR (do_documento, '-', 1) - 1) BETWEEN NVL (
                                                                               l_trx_num_low,
                                                                               SUBSTR (
                                                                                  do_documento,
                                                                                  0,
                                                                                    INSTR (
                                                                                       do_documento,
                                                                                       '-',
                                                                                       1)
                                                                                  - 1))
                                                                        AND NVL (
                                                                               l_trx_num_high,
                                                                               SUBSTR (
                                                                                  do_documento,
                                                                                  0,
                                                                                    INSTR (
                                                                                       do_documento,
                                                                                       '-',
                                                                                       1)
                                                                                  - 1))
                      AND data_do_documento BETWEEN NVL (
                                                       TO_DATE (l_low_trx_dt,
                                                                'DD-MON-YY'),
                                                       data_do_documento)
                                                AND NVL (
                                                       TO_DATE (l_high_trx_dt,
                                                                'DD-MON-YY'),
                                                       data_do_documento)
                      AND p_gen_inv_kit = 'Y'
                 )
         ORDER BY customer_id , trx_num ASC;
      -- v1.8 end
      --  Start Added for V1.6 to provide the details to Invoice Kit Program
      
      -- v1.8 start added code get invoice type, inventory org, boleto run date
      CURSOR c_get_bol_det (in_parent_req_id NUMBER)
      IS
         SELECT  customer_id,
                trx_number,
                order_number,
                po_number,
                boleto_red_id,
                template_name,
                email_group,
                customer_name,
                inv_tot_amount,
                inv_org,
                invoice_type,
                boleto_date_diff
           FROM (SELECT DISTINCT 
                     customer_id,
                     attribute1 trx_number,
                     attribute2 order_number,                       --V1.7
                     attribute3 po_number,
                     request_id boleto_red_id,
                     attribute4 template_name,
                     email_group,                    
                     attribute5 customer_name,
                     (SELECT SUM (aps.amount_due_remaining)
                        FROM ar_payment_schedules_all aps
                       WHERE aps.customer_trx_id = bol_ad.cust_trx_id)
                        inv_tot_amount,                   -- Added for V1.7
       --VALOR_DO_DOCUMENTO inv_tot_amount     -- Commented for V1.7
                      (SELECT organization_code
                       FROM org_organization_definitions ood
                       WHERE organization_id = (SELECT interface_header_attribute10
                                                  FROM ra_customer_trx_all
                                                 WHERE customer_trx_id = bol_ad.cust_trx_id )
                      ) inv_org,
                      (SELECT DECODE (b.global_attribute1, '01','HW','08','SW')
                         FROM ra_customer_trx_all a, ra_cust_trx_types_all b
                        WHERE customer_trx_id = bol_ad.cust_trx_id
                          AND a.cust_trx_type_id = b.cust_trx_type_id) invoice_type,
                       ROUND( SYSDATE - NVL( ( SELECT MIN(HST.creation_Date) FROM XXECS_BOLETO_HISTORY_ST HST 
                                WHERE HST.CUST_TRX_ID = bol_ad.CUST_TRX_ID ),SYSDATE-1) ) boleto_date_diff                                                  
           FROM XXECS_BOLETO_GEN_AD bol_ad
          WHERE 1 = 1 AND parent_request_id = in_parent_req_id);
   --  End Added for V1.6 to provide the details to Invoice Kit Program
    -- v1.8 end
   BEGIN
      out_num_ret_code := 0;
      out_num_msg_char := 'SUCCESS';
      fnd_file.put_line (fnd_file.LOG, '********Parameters*************');
      fnd_file.put_line (fnd_file.LOG,
                         'Transaction Date(Low) - ' || p_low_trx_date);
      fnd_file.put_line (fnd_file.LOG,
                         'Transaction Date (High) - ' || p_high_trx_date);
      fnd_file.put_line (fnd_file.LOG,
                         'Payment Method ID - ' || p_in_pay_method);
      fnd_file.put_line (fnd_file.LOG, 'Customer Name - ' || p_cust_name);
      fnd_file.put_line (fnd_file.LOG, 'Customer Number - ' || p_cust_number);
      fnd_file.put_line (fnd_file.LOG,
                         'Transaction Number(Low) - ' || p_trx_num_low);
      fnd_file.put_line (fnd_file.LOG,
                         'Transaction Number(High) - ' || p_trx_num_high);
      fnd_file.put_line (fnd_file.LOG,
                         'Order Number (Low) - ' || p_ord_num_low);    -- V1.7
      fnd_file.put_line (fnd_file.LOG,
                         'Order Number(High) - ' || p_ord_num_high);   -- V1.7
      fnd_file.put_line (fnd_file.LOG,
                         'Generate Invoice Kit - ' || p_gen_inv_kit);  -- V1.7

      fnd_file.put_line (fnd_file.LOG, 'Main boleto process started');

      -- Insert records in custom table
      FOR rec_inv_trx IN c_inv_trx (p_low_trx_date,
                                    p_high_trx_date,
                                    p_in_pay_method,
                                    p_cust_name,
                                    p_cust_number,
                                    p_trx_num_low,
                                    p_trx_num_high,
                                    p_ord_num_low                      -- V1.6
                                                 ,
                                    p_ord_num_high                     -- V1.6
                                                  )
      LOOP
         fnd_file.put_line (
            fnd_file.LOG,
            'Processing customer trx ID  - ' || rec_inv_trx.customer_trx_id);
         l_bol_result := TRUE;
         
         BEGIN
            SELECT flv.tag
              INTO l_type
              FROM ra_customer_trx_all rt,
                   ra_batch_sources_all rbs,
                   fnd_lookup_values_vl flv
             WHERE     rt.customer_trx_id = rec_inv_trx.customer_trx_id
                   AND rbs.batch_source_id = rt.batch_source_id
                   AND rbs.org_id = g_num_br_id
                   AND rt.org_id = g_num_br_id
                   AND rbs.name = flv.meaning
                   AND flv.lookup_type = 'XXECS_BOLETO_ITEM_CAT'
                   AND flv.enabled_flag = 'Y';

            fnd_file.put_line (fnd_file.LOG, 'l_type - ' || l_type);
         EXCEPTION
            WHEN OTHERS
            THEN
               l_type := NULL;                                         -- V1.1
               fnd_file.put_line (
                  fnd_file.LOG,
                  'Error while deriving ITEM category' || SQLERRM);
         END;

         -- Check if the transaction already exist in the staging table
         l_exists := 'N';                                              -- V1.1
         l_status := NULL;                                             -- V1.1

         BEGIN
            SELECT 'Y', status                                         -- V1.1
              INTO l_exists, l_status                                  -- V1.1
              FROM XXECS_BOLETO_GEN_AD
             WHERE     cust_trx_id = rec_inv_trx.customer_trx_id
                   AND payment_schedule_id = rec_inv_trx.payment_schedule_id;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               l_exists := 'N';
               l_status := NULL;
               fnd_file.put_line (
                  fnd_file.LOG,
                     'Error while finding the Boleto trx in staging table - '
                  || SQLERRM);                                         -- V1.1
            WHEN OTHERS
            THEN
               fnd_file.put_line (fnd_file.LOG,
                                  'Unknown exception 1  - ' || SQLERRM); -- V1.1
         END;

         -- Insert
         IF NVL (l_exists, 'Z') = 'N'
         THEN
            BEGIN
               IF rec_inv_trx.valor_do_documento = 0
               THEN
                  l_br_amount := '0,0';
                  fnd_file.put_line (fnd_file.LOG,
                                     'Transaction amount - ' || l_br_amount); -- V1.1
               ELSE
                  l_br_amount :=
                     ecs_number_format (rec_inv_trx.valor_do_documento);
                  fnd_file.put_line (fnd_file.LOG,
                                     'Transaction amount - ' || l_br_amount); -- V1.1
               END IF;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while formatting number - ' || SQLERRM);
                  l_br_amount := NULL;
            END;

            BEGIN
               fnd_file.put_line (
                  fnd_file.LOG,
                     'Inserting details for trx ID - '
                  || rec_inv_trx.customer_trx_id);

               INSERT INTO XXECS_BOLETO_GEN_AD (CUSTOMER_ID,
                                                CUST_TRX_ID,
                                                payment_schedule_id,
                                                CUST_ACT_SITE_ID,
                                                PAYMENT_METHOD_ID,
                                                BANK_NUM_DSP,
                                                NAME,
                                                AGENCIA_CODIGO,
                                                PAGADOR_NAME,
                                                PAGADOR_ADDR1,
                                                PAGADOR_ADDR2,
                                                DATA_DO_DOCUMENTO,
                                                NOSSO_NUMERO,
                                                DO_DOCUMENTO,
                                                VALOR_DO_DOCUMENTO,
                                                VENCIMENTO,
                                                ESPECIE,
                                                CARTEIRA,
                                                EMAIL_GROUP,
                                                PRINTED_FLAG        --,COLUMN1
                                                            ,
                                                parent_request_id      -- V1.1
                                                                 ,
                                                reprint_flag           -- V1.1
                                                            ,
                                                CREATION_DATE,
                                                STATUS                 -- V1.1
                                                      ,
                                                ATTRIBUTE1 -- Trx Number    V1.6
                                                          ,
                                                ATTRIBUTE2 -- Order Number  V1.6
                                                          --,ATTRIBUTE3 -- PO Number     V1.6   -- Commented for V1.7
                                                ,
                                                ATTRIBUTE5 -- Customer Name V1.6
                                                          ,
                                                ATTRIBUTE8, -- v1.8
                                                LAST_UDPATED_BY        -- V1.1
                                                               ,
                                                LAST_UPDATE_DATE       -- V1.1
                                                                ,
                                                CREATED_BY             -- V1.1
                                                          )
                       VALUES (
                                 rec_inv_trx.customer_id,
                                 rec_inv_trx.customer_trx_id,
                                 rec_inv_trx.payment_schedule_id,
                                 rec_inv_trx.address_id,
                                 p_in_pay_method,
                                 rec_inv_trx.bank_num_A,
                                 rec_inv_trx.name,
                                 rec_inv_trx.agencia_codigo,
                                 rec_inv_trx.c22_nome_clliente,
                                 rec_inv_trx.c22_line1,
                                 rec_inv_trx.c22_line2,
                                 rec_inv_trx.c4_data_do_documento,
                                 rec_inv_trx.nosso_numero_E,
                                 rec_inv_trx.do_documento_G,
                                 l_br_amount,
                                 rec_inv_trx.vencimento_F,
                                 DECODE (l_type,
                                         'HW', 'DM-Duplicata Mercantil',
                                         'SW', 'DS-Duplicata de Servicos'),
                                 rec_inv_trx.c11_carteira,
                                 NULL,
                                 'N',
                                 g_num_request_id                      -- V1.1
                                                 ,
                                 'N'                                   -- V1.1
                                    ,
                                 SYSDATE,
                                 'NEW'                                 -- V1.1
                                      ,
                                 rec_inv_trx.trx_number                -- V1.6
                                                       ,
                                 rec_inv_trx.order_number              -- V1.6
                                                         --,rec_inv_trx.po_number -- V1.6   -- Commented for V1.7
                                 ,
                                 rec_inv_trx.customer_name             -- V1.6
                                                          ,
                                 rec_inv_trx.global_attribute8, -- v1.8
                                 fnd_global.user_id                    -- V1.1
                                                   ,
                                 SYSDATE                               -- V1.1
                                        ,
                                 fnd_global.user_id                    -- V1.1
                                                   );
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                        'Exception while inserting into staging table - '
                     || SQLERRM);
            END;
         -- V1.1 changes start
         ELSIF l_exists = 'Y' AND l_status <> 'SUCCESS'
         THEN
            BEGIN
               IF rec_inv_trx.valor_do_documento = 0
               THEN
                  l_br_amount := '0,0';
                  fnd_file.put_line (fnd_file.LOG,
                                     'Transaction amount - ' || l_br_amount); -- V1.1
               ELSE
                  l_br_amount :=
                     ecs_number_format (rec_inv_trx.valor_do_documento);
                  fnd_file.put_line (fnd_file.LOG,
                                     'Transaction amount - ' || l_br_amount); -- V1.1
               END IF;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error while formatting number - ' || SQLERRM);
                  l_br_amount := NULL;
            END;

            BEGIN
               DELETE FROM XXECS_BOLETO_GEN_AD
                     WHERE     cust_trx_id = rec_inv_trx.customer_trx_id
                           AND payment_schedule_id =
                                  rec_inv_trx.payment_schedule_id;

               COMMIT;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Exception while deleting staging table - ' || SQLERRM);
            END;

            -- Insert the record for reprocessing
            BEGIN
               INSERT INTO XXECS_BOLETO_GEN_AD (CUSTOMER_ID,
                                                CUST_TRX_ID,
                                                payment_schedule_id,
                                                CUST_ACT_SITE_ID,
                                                PAYMENT_METHOD_ID,
                                                BANK_NUM_DSP,
                                                NAME,
                                                AGENCIA_CODIGO,
                                                PAGADOR_NAME,
                                                PAGADOR_ADDR1,
                                                PAGADOR_ADDR2,
                                                DATA_DO_DOCUMENTO,
                                                NOSSO_NUMERO,
                                                DO_DOCUMENTO,
                                                VALOR_DO_DOCUMENTO,
                                                VENCIMENTO,
                                                ESPECIE,
                                                CARTEIRA,
                                                EMAIL_GROUP,
                                                PRINTED_FLAG,
                                                PARENT_REQUEST_ID,
                                                reprint_flag,
                                                CREATION_DATE,
                                                STATUS,
                                                ATTRIBUTE1 -- Trx Number    V1.6
                                                          ,
                                                ATTRIBUTE2 -- Order Number  V1.6
                                                          --,ATTRIBUTE3 -- PO Number     V1.6  -- Commented for V1.7
                                                ,
                                                ATTRIBUTE5 -- Customer Name V1.6
                                                          ,
                                                ATTRIBUTE8, -- v1.8
                                                LAST_UDPATED_BY,
                                                LAST_UPDATE_DATE,
                                                CREATED_BY)
                       VALUES (
                                 rec_inv_trx.customer_id,
                                 rec_inv_trx.customer_trx_id,
                                 rec_inv_trx.payment_schedule_id,
                                 rec_inv_trx.address_id,
                                 p_in_pay_method,
                                 rec_inv_trx.bank_num_A,
                                 rec_inv_trx.name,
                                 rec_inv_trx.agencia_codigo,
                                 rec_inv_trx.c22_nome_clliente,
                                 rec_inv_trx.c22_line1,
                                 rec_inv_trx.c22_line2,
                                 rec_inv_trx.c4_data_do_documento,
                                 rec_inv_trx.nosso_numero_E,
                                 rec_inv_trx.do_documento_G,
                                 l_br_amount,
                                 rec_inv_trx.vencimento_F,
                                 DECODE (l_type,
                                         'HW', 'DM-Duplicata Mercantil',
                                         'SW', 'DS-Duplicata de Servicos'),
                                 rec_inv_trx.c11_carteira,
                                 NULL,
                                 'N',
                                 g_num_request_id,
                                 'N',
                                 SYSDATE,
                                 'NEW',
                                 rec_inv_trx.trx_number                -- V1.6
                                                       ,
                                 rec_inv_trx.order_number              -- V1.6
                                                         --,rec_inv_trx.po_number                 -- V1.6   -- Commented for V1.7
                                 ,
                                 rec_inv_trx.customer_name             -- V1.6
                                                          ,
                                 rec_inv_trx.global_attribute8, -- v1.8
                                 fnd_global.user_id,
                                 SYSDATE,
                                 fnd_global.user_id);
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                        'Exception while reinserting into staging table - '
                     || SQLERRM);
            END;
         -- V1.1 changes ends
         END IF;                                                   -- l_exists
      END LOOP;

      COMMIT;
      -- generate Bar code and insert into  the custom table
      ecs_generate_bar_code (l_ret_code, l_ret_err_msg);

      -- update the PO number for Invoice
      -- v1.8 start
      ecs_update_po_num(l_ret_code ,l_ret_err_msg );
      -- v1.8 end
      
      -- update email_address for each transaction and trigger boleto
      IF l_ret_code <> 2
      THEN
         ecs_update_email_id (l_ret_code, l_ret_err_msg);

         FOR r_get_cust IN c_get_cust (p_low_trx_date,
                                       p_high_trx_date,
                                       p_in_pay_method,
                                       p_cust_name,
                                       p_cust_number,
                                       p_trx_num_low,
                                       p_trx_num_high)
         LOOP
            -- submit request for XML Publisher
            BEGIN
               fnd_file.put_line (
                  fnd_file.LOG,
                     'Customer ID - '
                  || r_get_cust.customer_id
                  || ' Bank Number - '
                  || r_get_cust.bank_num_dsp);

               SELECT (SUBSTR (r_get_cust.bank_num_dsp,
                               1,
                               INSTR (r_get_cust.bank_num_dsp, '-', 1) - 1))
                 INTO l_bank_num
                 FROM DUAL;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Error deriving Bank Name - ' || SQLERRM);
                  l_bank_num := NULL;
            END;

            BEGIN
               SELECT DECODE (USERENV ('LANG'),  'US', 'en',  'PTB', 'pt')
                 INTO l_lang
                 FROM DUAL;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (fnd_file.LOG, 'Session - ' || SQLERRM);
            END;
             
            -- Check for Govt agency (Boleto not required)
            -- v1.8 start
            BEGIN            
                SELECT COUNT(1)
                  INTO l_num_govt_agcy_cnt
                  FROM fnd_lookup_values_vl
                 WHERE lookup_type = 'XXECS_BOLETO_CONTRIBUTOR_CLASS' 
                  AND enabled_flag = 'Y'
                  AND meaning =  r_get_cust.attribute8;    
             fnd_file.put_line (fnd_file.LOG, 'l_num_govt_agcy_cnt  - ' || l_num_govt_agcy_cnt); -- V1.8   
            EXCEPTION
            WHEN OTHERS THEN
                fnd_file.put_line (fnd_file.LOG, 'Error l_num_govt_agcy_cnt  - ' || SQLERRM); -- V1.8
            END;
            
            BEGIN
                SELECT COUNT (1)
                  INTO ln_no_boleto_flag
                  FROM hz_cust_site_uses_all   c,
                       hz_cust_acct_sites_all  b,
                       hz_cust_accounts        a
                 WHERE     a.cust_account_id = r_get_cust.customer_id
                       AND b.cust_account_id = a.cust_account_id
                       AND c.CUST_ACCT_SITE_ID = b.CUST_ACCT_SITE_ID
                       AND c.site_use_code = 'BILL_TO'
                       AND c.attribute6 = 'Y'
                       AND a.status = 'A'
                       AND c.status = 'A';
            EXCEPTION
                WHEN OTHERS
                THEN
                    ln_no_boleto_flag := 0;
            END;
            
            IF ln_no_boleto_flag >= 1 AND l_num_govt_agcy_cnt = 0 THEN
              l_num_govt_agcy_cnt := 1;
            END IF;
         
            -- v1.8 end
            IF r_get_cust.email_group IS NOT NULL AND l_num_govt_agcy_cnt = 0  -- v1.8
            THEN
               BEGIN
                  IF NVL (l_bank_num, 'XXX') = '341'
                  THEN
                     fnd_file.put_line (fnd_file.LOG, 'Adding ITAU Layout');
                     l_layout :=
                        fnd_request.add_layout (
                           template_appl_name   => 'XXECS_FIN',
                           template_code        => 'XXECS_BOLETO_RPT',
                           template_language    => l_lang,
                           template_territory   => 'BR',
                           output_format        => 'PDF');
                           
                       -- v1.8 start generate boleto at customer level or invoice level based on p_gen_inv_kit flag
                       IF p_gen_inv_kit = 'Y' THEN
                         l_request_id :=
                            fnd_request.submit_request (
                               application   => 'XXECS_FIN',
                               program       => 'XXECS_BOLETO_RPT',
                               description   => 'ECS ITAU Boleto Bancario Generation',
                               start_time    => SYSDATE,
                               sub_request   => FALSE,
                               argument1     => r_get_cust.customer_id,
                               argument2     => (TO_CHAR (
                                                    TO_DATE (p_low_trx_date,
                                                             'DD-MON-YY'),
                                                    'DD/MM/YYYY')),
                               argument3     => (TO_CHAR (
                                                    TO_DATE (p_high_trx_date,
                                                             'DD-MON-YY'),
                                                    'DD/MM/YYYY')),
                               argument4     => r_get_cust.trx_num,
                               argument5     => r_get_cust.trx_num);
                       ELSE
                            l_request_id :=
                            fnd_request.submit_request (
                               application   => 'XXECS_FIN',
                               program       => 'XXECS_BOLETO_RPT',
                               description   => 'ECS ITAU Boleto Bancario Generation',
                               start_time    => SYSDATE,
                               sub_request   => FALSE,
                               argument1     => r_get_cust.customer_id,
                               argument2     => (TO_CHAR (
                                                    TO_DATE (p_low_trx_date,
                                                             'DD-MON-YY'),
                                                    'DD/MM/YYYY')),
                               argument3     => (TO_CHAR (
                                                    TO_DATE (p_high_trx_date,
                                                             'DD-MON-YY'),
                                                    'DD/MM/YYYY')),
                               argument4     => p_trx_num_low,
                               argument5     => p_trx_num_high);
                       END IF;
                       -- v1.8 end
                     COMMIT;
                  ELSIF NVL (l_bank_num, 'XXX') = '237'
                  THEN
                     fnd_file.put_line (fnd_file.LOG,
                                        'Adding BRADESCO Layout');
                     l_layout :=
                        fnd_request.add_layout (
                           template_appl_name   => 'XXECS_FIN',
                           template_code        => 'XXECS_BRAD_BOL_RPT',
                           template_language    => l_lang,
                           template_territory   => 'BR',
                           output_format        => 'PDF');
                           
                       -- v1.8 start generate boleto at customer level or invoice level based on p_gen_inv_kit flag   
                       IF p_gen_inv_kit = 'Y' THEN    
                         l_request_id :=
                            fnd_request.submit_request (
                               application   => 'XXECS_FIN',
                               program       => 'XXECS_BRAD_BOL_RPT',
                               description   => 'ECS Bradesco Boleto Bancario Generation',
                               start_time    => SYSDATE,
                               sub_request   => FALSE,
                               argument1     => r_get_cust.customer_id,
                               argument2     => (TO_CHAR (
                                                    TO_DATE (p_low_trx_date,
                                                             'DD-MON-YY'),
                                                    'DD/MM/YYYY')),
                               argument3     => (TO_CHAR (
                                                    TO_DATE (p_high_trx_date,
                                                             'DD-MON-YY'),
                                                    'DD/MM/YYYY')),
                               argument4     => r_get_cust.trx_num,
                               argument5     => r_get_cust.trx_num);
                       ELSE
                            l_request_id :=
                            fnd_request.submit_request (
                               application   => 'XXECS_FIN',
                               program       => 'XXECS_BRAD_BOL_RPT',
                               description   => 'ECS Bradesco Boleto Bancario Generation',
                               start_time    => SYSDATE,
                               sub_request   => FALSE,
                               argument1     => r_get_cust.customer_id,
                               argument2     => (TO_CHAR (
                                                    TO_DATE (p_low_trx_date,
                                                             'DD-MON-YY'),
                                                    'DD/MM/YYYY')),
                               argument3     => (TO_CHAR (
                                                    TO_DATE (p_high_trx_date,
                                                             'DD-MON-YY'),
                                                    'DD/MM/YYYY')),
                               argument4     => p_trx_num_low,
                               argument5     => p_trx_num_high);
                       END IF;
                       -- v1.8
                     -- added for V1.6 to Store the Template Code
                     -- Added Exception while update for V1.7
                     BEGIN
                        UPDATE XXECS_BOLETO_GEN_AD
                           SET attribute4 = 'XXECS_BRAD_BOL_RPT'
                         WHERE parent_request_id = g_num_request_id;
                     EXCEPTION
                        WHEN OTHERS
                        THEN
                           fnd_file.put_line (
                              fnd_file.LOG,
                              'Error while update Template Name XXECS_BRAD_BOL_RPT ');
                     END;

                     COMMIT;
                  END IF;                                        -- l_bank_num
               EXCEPTION
                  WHEN OTHERS
                  THEN
                     l_ret_code := 2;
                     fnd_file.put_line (
                        fnd_file.LOG,
                        'Error while submitting - ' || SQLERRM);
               END;

               IF l_request_id = 0
               THEN
                  fnd_file.put_line (fnd_file.LOG,
                                     'Concurrent request failed to submit');
               ELSE
                  fnd_file.put_line (
                     fnd_file.LOG,
                        'Successfully Submitted the Concurrent Request - '
                     || l_request_id);
                  -- update ra_customer_trx_all with Payment method
               ecs_upd_cust_trx (l_ret_code,
                                    l_ret_err_msg,
                                    r_get_cust.customer_id,
                                    r_get_cust.trx_num,      -- v1.8                              
                                    p_in_pay_method,
                                    l_request_id);                     -- V1.1
                                   
               END IF;

               IF l_request_id > 0
               THEN
                  LOOP
                     --
                     --To make process execution to wait for 1st program to complete
                     --
                     l_req_return_status :=
                        fnd_concurrent.wait_for_request (
                           request_id   => l_request_id,
                           INTERVAL     => 5 --interval Number of seconds to wait between checks
                                            ,
                           max_wait     => 60 --Maximum number of seconds to wait for the request completion
                                             ,
                           phase        => lc_phase,
                           STATUS       => lc_status,
                           dev_phase    => lc_dev_phase,
                           dev_status   => lc_dev_status,
                           MESSAGE      => lc_message);
                     EXIT /*WHEN UPPER (lc_phase) in ('COMPLETED','CONCLU?O') OR UPPER (lc_status) IN ('CANCELLED',
                          'ERROR', 'TERMINATED' ,'CANCELADO','ERRO','FINALIZADO');*/
                          --commented for removing Junk char
                          WHEN    UPPER (lc_dev_phase) = 'COMPLETE'
                               OR UPPER (lc_dev_status) IN ('CANCELLED',
                                                            'ERROR',
                                                            'TERMINATED');
                  END LOOP;

                  fnd_file.put_line (
                     fnd_file.LOG,
                     'lc_phase - ' || lc_phase || 'lc_status - ' || lc_status);
                  fnd_file.put_line (
                     fnd_file.LOG,
                        'lc_dev_phase - '
                     || lc_dev_phase
                     || 'lc_dev_status - '
                     || lc_dev_status);

                  --IF UPPER (lc_phase) in ('COMPLETED','CONCLU?O')  AND UPPER (lc_status) in ('ERROR','ERRO') THEN --commented for removing Junk char
                  IF     UPPER (lc_dev_phase) = 'COMPLETE'
                     AND UPPER (lc_dev_status) = 'ERROR'
                  THEN
                     -- Added for V1.1 starts
                     ROLLBACK;

                     BEGIN
                        fnd_file.put_line (
                           fnd_file.LOG,
                              'Updating customer ID - '
                           || r_get_cust.customer_id
                           || 'Request ID - '
                           || l_request_id);

                        --UPDATE XXECS_DIST.XXECS_BOLETO_GEN_AD              --Commented as part of R12_1.0 Version by Wipro
                        UPDATE XXECS_BOLETO_GEN_AD --Added as part of R12_1.0 Version by Wipro
                           SET request_id = l_request_id,
                               status = 'ERROR',
                               error_message = 'Boleto not generated'
                         WHERE customer_id = r_get_cust.customer_id
                           AND attribute1  = NVL(r_get_cust.trx_num, attribute1) -- v1.8
                           AND printed_flag = 'N'
                           AND status = 'NEW'
                           AND parent_request_id = g_num_request_id;

                        fnd_file.put_line (
                           fnd_file.LOG,
                              'Updating Printed flag for Error transactions count - '
                           || SQL%ROWCOUNT);
                     EXCEPTION
                        WHEN OTHERS
                        THEN
                           fnd_file.put_line (
                              fnd_file.LOG,
                              'Update printed flag - ' || SQLERRM);
                     END;

                     -- Added for V1.1 ends
                     fnd_file.put_line (
                        fnd_file.LOG,
                           'The PROGRAM completed in error request id: '
                        || l_request_id
                        || ' '
                        || SQLERRM);
                  --ELSIF UPPER (lc_phase) in ('COMPLETED','CONCLU?O') AND UPPER (lc_status) = 'NORMAL' THEN --commented for removing Junk char
                  ELSIF     UPPER (lc_dev_phase) = 'COMPLETE'
                        AND UPPER (lc_dev_status) = 'NORMAL'
                  THEN
                     fnd_file.put_line (
                        fnd_file.LOG,
                           'The PROGRAM completed normal request id: '
                        || l_request_id);

                     -- update ra_customer_trx_all with Payment method
                     --ecs_upd_cust_trx(l_ret_code,l_ret_err_msg,r_get_cust.customer_id,p_in_pay_method,l_request_id); commented for V1.1
                     -- Added for V1.1 starts

                     -- Start Added for update the request_id  boleto program complated and bursting program not subbmitted for V1.6
                     IF p_gen_inv_kit = 'Y'
                     THEN
                        BEGIN
                           fnd_file.put_line (
                              fnd_file.LOG,
                                 'Updating customer ID - '
                              || r_get_cust.customer_id
                              || 'Request ID - '
                              || l_request_id);

                           UPDATE XXECS_DIST.XXECS_BOLETO_GEN_AD
                              SET status = 'SUCCESS',
                                  request_id = l_request_id,
                                  printed_flag = 'Y'
                            WHERE  customer_id = r_get_cust.customer_id
                              AND attribute1  = NVL(r_get_cust.trx_num, attribute1) -- v1.8
                              AND printed_flag = 'N'
                              AND status = 'NEW'
                              AND parent_request_id = g_num_request_id;

                           COMMIT;
                           fnd_file.put_line (
                              fnd_file.LOG,
                                 'Updating Printed flag for Sucess transactions count - '
                              || SQL%ROWCOUNT);
                        EXCEPTION
                           WHEN OTHERS
                           THEN
                              fnd_file.put_line (
                                 fnd_file.LOG,
                                 'Update printed flag - ' || SQLERRM);
                        END;
                     ELSIF p_gen_inv_kit = 'N'
                     THEN                                    -- Added for V1.6
                        -- Submit the bursting program
                        fnd_file.put_line (
                           fnd_file.LOG,
                           'Submitting the Bursting program .. ');
                        l_burst_request_id :=
                           fnd_request.submit_request (
                              application   => 'XDO',
                              program       => 'XDOBURSTREP',
                              argument1     => 'Y',
                              argument2     => l_request_id,
                              argument3     => 'N');                -- R12_1.0
                        COMMIT;

                        --Link the report with the Main Program for VER 2.0
                        IF l_burst_request_id > 0
                        THEN
                           fnd_file.put_line (
                              fnd_file.LOG,
                                 'Bursting Program request ID - '
                              || l_burst_request_id);

                           /*                           fnd_file.put_line(fnd_file.log,'Link the Bursting program to the parent request .. ');
                           -- Call the UTILITY package to Create relation of Child with Parent.
                           XXECS_UTILITY_PACKAGE_PKG.xxecs_parent_child_conc_req
                           (         l_request_id
                           , l_burst_request_id
                           , l_error_status
                           , l_error_message
                           );
                           IF l_error_status = 0 then
                           fnd_file.put_line(fnd_file.log,' Successfully Updated the fnd_concurrent_requests for request_id '|| l_burst_request_id );
                           */
                           LOOP
                              l_burst_return_status :=
                                 fnd_concurrent.wait_for_request (
                                    request_id   => l_burst_request_id,
                                    INTERVAL     => 5 --interval Number of seconds to wait between checks
                                                     ,
                                    max_wait     => 60 --Maximum number of seconds to wait for the request completion
                                                      ,
                                    phase        => l_phase,
                                    STATUS       => l_status,
                                    dev_phase    => l_dev_phase,
                                    dev_status   => l_dev_status,
                                    MESSAGE      => l_message);
                              EXIT WHEN UPPER (l_dev_phase) = 'COMPLETE';
                           END LOOP;

                           fnd_file.put_line (
                              fnd_file.LOG,
                                 ' l_dev_phase - '
                              || l_dev_phase
                              || ' l_dev_status - '
                              || l_dev_status);

                           IF     UPPER (l_dev_phase) = 'COMPLETE'
                              AND UPPER (l_dev_status) = 'ERROR'
                           THEN
                              BEGIN
                                 fnd_file.put_line (
                                    fnd_file.LOG,
                                       'Updating customer ID - '
                                    || r_get_cust.customer_id
                                    || 'Request ID - '
                                    || l_request_id);
                                 ROLLBACK;

                                 --UPDATE XXECS_DIST.XXECS_BOLETO_GEN_AD               --Commented as part of R12_1.0 Version by Wipro
                                 UPDATE XXECS_BOLETO_GEN_AD --Added as part of R12_1.0 Version by Wipro
                                    SET status = 'ERROR',
                                        request_id = l_request_id,
                                        error_message =
                                           'Error while emailing Boleto'
                                  WHERE     customer_id =
                                               r_get_cust.customer_id
                                        AND printed_flag = 'N'
                                        AND status = 'NEW'
                                        AND parent_request_id =
                                               g_num_request_id;

                                 fnd_file.put_line (
                                    fnd_file.LOG,
                                       'Updating Printed flag for Error transactions count - '
                                    || SQL%ROWCOUNT);
                              EXCEPTION
                                 WHEN OTHERS
                                 THEN
                                    fnd_file.put_line (
                                       fnd_file.LOG,
                                       'Update printed flag - ' || SQLERRM);
                              END;
                           ELSIF     UPPER (l_dev_phase) = 'COMPLETE'
                                 AND UPPER (l_dev_status) = 'NORMAL'
                           THEN
                              BEGIN
                                 fnd_file.put_line (
                                    fnd_file.LOG,
                                       'Updating customer ID - '
                                    || r_get_cust.customer_id
                                    || 'Request ID - '
                                    || l_request_id);

                                 --UPDATE XXECS_DIST.XXECS_BOLETO_GEN_AD               --Commented as part of R12_1.0 Version by Wipro
                                 UPDATE XXECS_BOLETO_GEN_AD --Added as part of R12_1.0 Version by Wipro
                                    SET status = 'SUCCESS',
                                        request_id = l_request_id,
                                        printed_flag = 'Y'
                                  WHERE     customer_id =
                                               r_get_cust.customer_id
                                        AND printed_flag = 'N'
                                        AND status = 'NEW'
                                        AND parent_request_id =
                                               g_num_request_id;

                                 fnd_file.put_line (
                                    fnd_file.LOG,
                                       'Updating Printed flag for Sucess transactions count - '
                                    || SQL%ROWCOUNT);
                              EXCEPTION
                                 WHEN OTHERS
                                 THEN
                                    fnd_file.put_line (
                                       fnd_file.LOG,
                                       'Update printed flag - ' || SQLERRM);
                              END;
                           END IF;                              -- l_dev_phase
                        END IF;                       --l_burst_request_id > 0
                     END IF;            -- end if for p_gen_inv_kit  flag V1.6
                  END IF;                                      -- lc_dev_phase
               END IF;                                      --l_request_id > 0
            ELSE
               BEGIN
                  fnd_file.put_line (
                     fnd_file.LOG,
                        'Updating customer ID - '
                     || r_get_cust.customer_id
                     || 'Request ID - '
                     || l_request_id);

                  --UPDATE XXECS_DIST.XXECS_BOLETO_GEN_AD               --Commented as part of R12_1.0 Version by Wipro
                  UPDATE XXECS_BOLETO_GEN_AD --Added as part of R12_1.0 Version by Wipro
                     SET status = 'ERROR',
                         error_message =
                            'Email ID not available and Boleto is not generated'
                   WHERE     customer_id = r_get_cust.customer_id
                         AND printed_flag = 'N'
                         AND status = 'NEW'
                         AND parent_request_id = g_num_request_id;

                  fnd_file.put_line (
                     fnd_file.LOG,
                        'Updating Printed flag for Error transactions count - '
                     || SQL%ROWCOUNT);
               EXCEPTION
                  WHEN OTHERS
                  THEN
                     fnd_file.put_line (fnd_file.LOG,
                                        'Update printed flag - ' || SQLERRM);
               END;
            END IF;                                  -- r_get_cust.email_group

            COMMIT;
         END LOOP;
      END IF;                                               -- l_ret_code <> 2

      IF p_gen_inv_kit = 'Y'
      THEN                                                   -- Added for V1.6
         -- Start Calling the Invoice Kit Email Program for V1.6

         FOR c_get_bol_det_rec IN c_get_bol_det (g_num_request_id)
         LOOP
            l_inv_tot_amt :=
               NVL (ecs_number_format (c_get_bol_det_rec.inv_tot_amount),
                    '0,0');                                  -- Added for V1.7

            IF c_get_bol_det_rec.email_group IS NOT NULL
            THEN
               -- Start Added for V1.7
               -- v1.8 commented start
               /*

               BEGIN
                  SELECT DISTINCT NVL (INSTR (attribute3, ',', 1), 0)
                    INTO lv_po_count
                    FROM XXECS_BOLETO_GEN_AD
                   WHERE     attribute2 = c_get_bol_det_rec.order_number
                         AND parent_request_id = g_num_request_id;

                  fnd_file.put_line (fnd_file.LOG,
                                     ' PO Count - ' || lv_po_count);
               EXCEPTION
                  WHEN OTHERS
                  THEN
                     lv_po_count := 0;
                     fnd_file.put_line (
                        fnd_file.LOG,
                        ' Error while get PO Count - ' || lv_po_count);
               END;


               BEGIN
                    -- Added to check the Invoice count within date range V1.7
                    SELECT COUNT (cust_trx_id)
                      INTO lv_inv_count
                      FROM (SELECT DISTINCT attribute1 trx_number, cust_trx_id
                              FROM apps.xxecs_boleto_gen_ad
                             WHERE     1 = 1
                                   AND data_do_documento BETWEEN TO_DATE (
                                                                    p_low_trx_date,
                                                                    'DD-MON-YY')
                                                             AND TO_DATE (
                                                                    p_high_trx_date,
                                                                    'DD-MON-YY')
                                   AND attribute1 =
                                          c_get_bol_det_rec.trx_number
                                   AND parent_request_id = g_num_request_id)
                  GROUP BY trx_number
                    HAVING COUNT (cust_trx_id) > 1;

                  fnd_file.put_line (
                     fnd_file.LOG,
                     'Duplicate Invoice count:' || lv_inv_count);
               EXCEPTION
                  WHEN OTHERS
                  THEN
                     lv_inv_count := 0;
                     fnd_file.put_line (
                        fnd_file.LOG,
                           'Error in Duplicate Invoice count for:'
                        || lv_inv_count);
               END;


               IF lv_inv_count > 1
               THEN
                  BEGIN
                     UPDATE XXECS_BOLETO_GEN_AD
                        SET status = 'ERROR',
                            printed_flag = 'N',
                            error_message =
                               'Invoice kit will not generate as duplicate invoice found for same date range',
                            attribute6 = 'N'
                      WHERE     attribute1 = c_get_bol_det_rec.trx_number
                            AND parent_request_id = g_num_request_id;

                     COMMIT;
                  EXCEPTION
                     WHEN OTHERS
                     THEN
                        fnd_file.put_line (
                           fnd_file.LOG,
                           'Error while updating the Duplicate Invoice Count');
                  END;
               END IF;

               IF lv_po_count > 0
               THEN
                  BEGIN
                     UPDATE XXECS_BOLETO_GEN_AD
                        SET status = 'ERROR',
                            printed_flag = 'N',
                            error_message =
                               'Invoice kit will not generate as multiple PO Numbers found for this Trx Number',
                            attribute6 = 'N'
                      WHERE     attribute2 = c_get_bol_det_rec.order_number
                            AND parent_request_id = g_num_request_id;

                     COMMIT;
                  EXCEPTION
                     WHEN OTHERS
                     THEN
                        fnd_file.put_line (
                           fnd_file.LOG,
                           'Error while updating the multiple PO Count');
                  END;
               END IF;
                */
             --  IF lv_po_count = 0 AND lv_inv_count = 0
             --  THEN                      --   lv_po_count,lv_inv_count    V1.7
               -- v1.8 commented end
               
             -- v1.8 start profile to check, no of days to wait for sending the billing kit.
                  BEGIN
                    SELECT fnd_profile.value('XXECS_INVOICE_KIT_EMAIL_DAYS') 
                      INTO l_num_inv_days
                      FROM dual ;                  
                  EXCEPTION
                  WHEN OTHERS THEN
                       l_num_inv_days := 5;
                  END;
              -- v1.8 end    
                  l_output_req_id :=
                     fnd_request.submit_request (
                        application   => 'XXECS_FIN' -- short name of application under which the called program is registered
                                                    ,
                        program       => 'XXECS_INVOICE_KIT_EMAIL' -- short name of concurrent program
                                                                  ,
                        description   => NULL,
                        start_time    => NULL,
                        sub_request   => FALSE,
                        argument1     => c_get_bol_det_rec.trx_number,
                        argument2     => c_get_bol_det_rec.po_number,
                        argument3     => c_get_bol_det_rec.email_group,
                        argument4     => c_get_bol_det_rec.boleto_red_id,
                        argument5     => c_get_bol_det_rec.template_name,
                        argument6     => c_get_bol_det_rec.customer_name,
                        -- , argument7        => c_get_bol_det_rec.inv_tot_amount    -- Commented for V1.7
                        argument7     => l_inv_tot_amt,       -- Added for V1.7
                        argument8     => c_get_bol_det_rec.inv_org,  -- v1.8
                        argument9     => c_get_bol_det_rec.invoice_type,  -- v1.8               
                        argument10    => c_get_bol_det_rec.order_number, -- v1.8
                        argument11    => c_get_bol_det_rec.boleto_date_diff, -- v1.8
                        argument12    => l_num_inv_days); -- v1.8
                  COMMIT;

                  fnd_file.put_line (
                     fnd_file.LOG,
                        ' ECS Invoice Kit Email Program Request ID - '
                     || l_output_req_id);

                  IF l_output_req_id > 0
                  THEN
                     LOOP
                        l_output_return_status :=
                           fnd_concurrent.wait_for_request (
                              request_id   => l_output_req_id,
                              INTERVAL     => 5 --interval Number of seconds to wait between checks
                                               ,
                              max_wait     => 60 --Maximum number of seconds to wait for the request completion
                                                ,
                              phase        => l_phase,
                              STATUS       => l_status,
                              dev_phase    => l_dev_phase,
                              dev_status   => l_dev_status,
                              MESSAGE      => l_message);

                        EXIT WHEN UPPER (l_dev_phase) = 'COMPLETE';
                     END LOOP;

                     IF     UPPER (l_dev_phase) = 'COMPLETE'
                        AND UPPER (l_dev_status) = 'ERROR'
                     THEN
                        fnd_file.put_line (
                           fnd_file.LOG,
                              'ECS Invoice Kit Email Program Failed - '
                           || l_message);

                        -- Added exception for V1.7
                        BEGIN
                           UPDATE XXECS_BOLETO_GEN_AD
                              SET ATTRIBUTE6 = 'N'             -- Emailed flag
                                                  ,
                                  status = 'ERROR'           -- Added for V1.7
                                                  ,
                                  error_message =
                                        'ECS Invoice Kit Email Program Failed for Request_id'
                                     || l_output_req_id      -- Added for V1.7
                            WHERE     request_id =
                                         c_get_bol_det_rec.boleto_red_id
                                  AND attribute1 =
                                         c_get_bol_det_rec.trx_number
                                  AND parent_request_id = g_num_request_id;
                        EXCEPTION
                           WHEN OTHERS
                           THEN
                              fnd_file.put_line (
                                 fnd_file.LOG,
                                 'Error while update emailed flag');
                        END;

                        COMMIT;
                     ELSIF     UPPER (l_dev_phase) = 'COMPLETE'
                           AND UPPER (l_dev_status) = 'NORMAL'
                     THEN
                        fnd_file.put_line (
                           fnd_file.LOG,
                           ' Invoice Kit program completed normal and sent mail ');

                        -- Added exception for V1.7

                        BEGIN
                           UPDATE XXECS_BOLETO_GEN_AD
                              SET ATTRIBUTE6 = 'Y'             -- Emailed Flag
                                 ,status = decode(status,'ERROR','ERROR','SUCCESS') -- Added for V1.7 -- v1.8
                            WHERE     request_id =  c_get_bol_det_rec.boleto_red_id 
                                  AND attribute1 = c_get_bol_det_rec.trx_number
                                  AND parent_request_id = g_num_request_id;
                        EXCEPTION
                           WHEN OTHERS
                           THEN
                              fnd_file.put_line (
                                 fnd_file.LOG,
                                 'Error while update emailed flag');
                        END;

                        COMMIT;
                     END IF;
                  END IF;                                -- l_output_req_id >0
               END IF;                       --  lv_po_count,lv_inv_count V1.7
           -- END IF;                           -- c_get_bol_det_rec.email_group
         END LOOP;
      -- end Calling the Invoice Kit Email Program V1.6
      END IF;                                                 -- p_gen_inv_kit

      -- procedure to archive the data of the current run. V1.1
      ecs_archive_stg_data (g_num_request_id, l_ret_code, l_ret_err_msg);

      -- Submit the Output Report
      IF l_ret_code = 0 AND l_bol_result = TRUE
      THEN
         -- v1.8 commented
         /* l_output_req_id :=
           fnd_request.submit_request (
               application   => 'XXECS_FIN',
               -- short name of application under which the called program is registered
               program       => 'XXECS_BOLETO_REPORT', -- short name of concurrent program
               description   => NULL,
               start_time    => NULL,
               sub_request   => FALSE,
               argument1     => g_num_request_id -- Request ID of wrapper Program
                                              ); */
         -- v1.8 start
         BEGIN
             SELECT DECODE (USERENV ('LANG'),  'US', 'en',  'PTB', 'pt')
               INTO l_lang
               FROM DUAL;
         EXCEPTION
         WHEN OTHERS
         THEN
            fnd_file.put_line (fnd_file.LOG, 'Session - ' || SQLERRM);
         END;
        -- v1.8 end
         BEGIN
                  SELECT fpv.profile_option_value
                    INTO l_rep_email
                    --FROM apps.fnd_profile_options_vl fpo,apps.fnd_profile_option_values fpv        --Commented as part of R12_1.0 Version by Wipro
                    FROM fnd_profile_options_vl fpo,
                         fnd_profile_option_values fpv --Added as part of R12_1.0 Version by Wipro
                   WHERE     fpo.profile_option_id = fpv.profile_option_id
                         AND fpo.profile_option_name =
                                'XXECS_BOLETO_REP_EMAIL';
               EXCEPTION
                  WHEN OTHERS
                  THEN
                     l_rep_email := NULL;
         END;
         
         -- v1.8 start calling boleto generation report program
         l_layout :=
         fnd_request.add_layout (
            template_appl_name   => 'XXECS_FIN',
            template_code        => 'XXECS_BILLING_KIT_NFE_RPT',
            template_language    => l_lang,
            template_territory   => 'BR',
            output_format        => 'EXCEL');
         fnd_file.put_line (fnd_file.LOG, 'Added layout ');

         l_output_req_id :=
         fnd_request.submit_request (
            application   => 'XXECS_FIN',
            program       => 'XXECS_BILLING_KIT_NFE_RPT',
            description   => 'ECS Boleto Generation Report Program',
            start_time    => SYSDATE,
            sub_request   => FALSE,
            argument1     => g_num_request_id,
            argument2     => g_num_br_id,
            argument3     => l_rep_email);
            
        -- v1.8 end
         COMMIT;
         fnd_file.put_line (
            fnd_file.LOG,
            'ECS Boleto Generation Report Program Request ID - ' || l_output_req_id);

         IF l_output_req_id > 0
         THEN
            LOOP
               l_output_return_status :=
                  fnd_concurrent.wait_for_request (
                     request_id   => l_output_req_id,
                     INTERVAL     => 5 --interval Number of seconds to wait between checks
                                      ,
                     max_wait     => 60 --Maximum number of seconds to wait for the request completion
                                       ,
                     phase        => l_phase,
                     STATUS       => l_status,
                     dev_phase    => l_dev_phase,
                     dev_status   => l_dev_status,
                     MESSAGE      => l_message);
               EXIT WHEN UPPER (l_dev_phase) = 'COMPLETE';
            END LOOP;

            IF     UPPER (l_dev_phase) = 'COMPLETE'
               AND UPPER (l_dev_status) = 'ERROR'
            THEN
               fnd_file.put_line (fnd_file.LOG,
                                  'Report Request Failed - ' || l_message);
            ELSIF     UPPER (l_dev_phase) = 'COMPLETE'
                  AND UPPER (l_dev_status) = 'NORMAL'
            THEN
               fnd_file.put_line (
                  fnd_file.LOG,
                  ' Submit the email program for the Report ');
            -- v1.8 commented
              /* 
               BEGIN
                  SELECT fpv.profile_option_value
                    INTO l_rep_email
                    --FROM apps.fnd_profile_options_vl fpo,apps.fnd_profile_option_values fpv        --Commented as part of R12_1.0 Version by Wipro
                    FROM fnd_profile_options_vl fpo,
                         fnd_profile_option_values fpv --Added as part of R12_1.0 Version by Wipro
                   WHERE     fpo.profile_option_id = fpv.profile_option_id
                         AND fpo.profile_option_name =
                                'XXECS_BOLETO_REP_EMAIL';
               EXCEPTION
                  WHEN OTHERS
                  THEN
                     l_rep_email := NULL;
               END;
               */
               -- v1.8 commented
              /* l_email_req_id :=
                  fnd_request.submit_request (
                     application   => 'XXECS_FIN',
                     -- short name of application under which the called program is registered
                     program       => 'XXECS_BOL_REP_EMAIL', -- short name of concurrent program
                     description   => NULL,
                     start_time    => NULL,
                     sub_request   => FALSE,
                     argument1     => l_output_req_id,
                     argument2     => l_rep_email -- Request ID of wrapper Program
                                                 );
                */
               fnd_file.put_line (fnd_file.LOG, 'Submitting the Bursting program .. ');
               -- v1.8 start calling the bursting program to send boleto generation report
              l_email_req_id :=
                 fnd_request.submit_request (application   => 'XDO',
                                             program       => 'XDOBURSTREP',
                                             argument1     => 'Y',
                                             argument2     => l_output_req_id,
                                             argument3     => 'Y');         -- R12_1.0
                                                               
               COMMIT;
               fnd_file.put_line (
                  fnd_file.LOG,
                     ' ECS Boleto Generation Report Request ID - '
                  || l_email_req_id);

               IF l_email_req_id > 0
               THEN
                  LOOP
                     l_email_return_status :=
                        fnd_concurrent.wait_for_request (
                           request_id   => l_email_req_id,
                           INTERVAL     => 5 --interval Number of seconds to wait between checks
                                            ,
                           max_wait     => 60 --Maximum number of seconds to wait for the request completion
                                             ,
                           phase        => l_phase,
                           STATUS       => l_status,
                           dev_phase    => l_dev_phase,
                           dev_status   => l_dev_status,
                           MESSAGE      => l_message);
                     EXIT WHEN UPPER (l_dev_phase) = 'COMPLETE';
                  END LOOP;

                  IF     UPPER (l_dev_phase) = 'COMPLETE'
                     AND UPPER (l_dev_status) = 'ERROR'
                  THEN
                     fnd_file.put_line (
                        fnd_file.LOG,
                        'Email Request Failed - ' || l_message);
                  ELSIF     UPPER (l_dev_phase) = 'COMPLETE'
                        AND UPPER (l_dev_status) = 'NORMAL'
                  THEN
                     fnd_file.put_line (fnd_file.LOG,
                                        ' Email has been sent ');
                  END IF;                                       -- l_dev_phase
               END IF;                                       -- l_email_req_id
            END IF;                                             -- l_dev_phase
         END IF;                                            -- l_output_req_id
      ELSE
        fnd_file.put_line (
            fnd_file.LOG,
               'No records found for generating the Boleto report.');
      END IF;                                                     --l_ret_code
      
   EXCEPTION
      WHEN OTHERS
      THEN
         fnd_file.put_line (
            fnd_file.LOG,
               'Error While Submitting Concurrent Request '
            || TO_CHAR (SQLCODE)
            || '-'
            || SQLERRM);
         out_num_ret_code := 2;
         out_num_msg_char := 'Error ';
   END main_boleto_process;
END XXECS_BOLETO_WRAPPER_PKG;
/
