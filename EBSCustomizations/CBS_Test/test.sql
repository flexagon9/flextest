DECLARE
   v_msg_data        VARCHAR2 (1000);
   v_return_status   VARCHAR2 (10);
   v_doc_type        VARCHAR2 (10)   := 'PO';
   v_doc_subtype     VARCHAR2 (10)   := 'STANDARD';
   v_po_header_id    NUMBER;
   v_action          VARCHAR2 (10)   := 'CANCEL';
   v_action_date     DATE            := SYSDATE;
   v_org_id          NUMBER          := 8574;
   l_conterms_exist_flag   po.po_headers_all.conterms_exist_flag%TYPE;
   l_revision_num          NUMBER;
   l_request_id            NUMBER                                        := 0;
   l_doc_type              VARCHAR2 (30);
   l_doc_subtype           VARCHAR2 (30);
   l_comm_doc_type         VARCHAR2 (30);
   l_document_id           NUMBER;
   l_agent_id              NUMBER;
   l_printflag             VARCHAR2 (1)                                := 'N';
   l_faxflag               VARCHAR2 (1)                                := 'N';
   l_faxnum                VARCHAR2 (30);
   l_emailflag             VARCHAR2 (1)                                := 'N';
   l_emailaddress          apps.po_vendor_sites.email_address%TYPE;
   l_default_method        apps.po_vendor_sites.supplier_notif_method%TYPE;
   l_user_id               apps.po_lines.last_updated_by%TYPE           := -1;
   l_login_id              apps.po_lines.last_update_login%TYPE         := -1;
   x_return_status         VARCHAR2 (1);
   x_msg_data              VARCHAR2 (2000);
   l_doc_num               VARCHAR2 (30);
   l_approval_path_id      NUMBER;
   l_progress              NUMBER;
   --v_po_header_id          NUMBER;
   v_error_flag            NUMBER                                        := 0;
   v_main_error            VARCHAR2 (1000);

   CURSOR c_po_line
   IS
      SELECT pha.segment1 po_number, pha.po_header_id, pla.po_line_id,
             pla.line_num, plla.line_location_id
        FROM apps.po_lines_all pla,
             po_headers_all pha,
             po_line_locations_all plla
       WHERE 1=1
	     and pha.segment1='106939'
	     and pha.po_header_id=5037589
		 AND pla.po_header_id =5037589
	     and pla.po_line_id >=	5758012		
		 and pla.po_line_id <=	5762872
         AND pla.po_header_id = pha.po_header_id
         AND plla.po_line_id = pla.po_line_id 
		 and 	pla.attribute5='PROMO-2';
BEGIN
BEGIN
update xxctn.xxctn_promo_po_header
set vendor_id=74045,
vendor_site_id=1982502,
vendor_name='SONY ATV MUSIC PUBLISHING, LLC',
vendor_site_name='PO BOX 415000,NASHVILLE,TN-37241-0768 | 4-NASHVILLE3'
where po_id=100077;
commit;
END;
   fnd_global.apps_initialize (26137, 51814, 201);
   mo_global.init ('PO');
   mo_global.set_policy_context ('S', v_org_id);
   
   DBMS_OUTPUT.put_line ('Calling API For Cancelling Documents');

   FOR c_po_line_rec IN c_po_line
   LOOP
      po_document_control_pub.control_document
                               (p_api_version           => 1.0,
                                p_init_msg_list         => fnd_api.g_true,
                                p_commit                => fnd_api.g_false,
                                x_return_status         => v_return_status,
                                p_doc_type              => v_doc_type,
                                p_doc_subtype           => v_doc_subtype,
                                p_doc_id                => c_po_line_rec.po_header_id,
                                p_doc_num               => NULL,
                                p_release_id            => NULL,
                                p_release_num           => NULL,
                                p_doc_line_id           => c_po_line_rec.po_line_id,
                                p_doc_line_num          => null,--c_po_line_rec.line_num,
                                p_doc_line_loc_id       => NULL,
                                --c_po_line_rec.line_location_id,
                                p_doc_shipment_num      => NULL,
                                p_action                => v_action,
                                p_action_date           => v_action_date,
                                p_cancel_reason         => NULL,
                                p_cancel_reqs_flag      => 'N',
                                p_print_flag            => NULL,
                                p_note_to_vendor        => NULL,
                                p_use_gldate            => NULL,
                                p_org_id                => v_org_id
                               );
      COMMIT;
      DBMS_OUTPUT.put_line (   'The Return Status of the API : '
                            || v_return_status
                           );

      IF v_return_status = fnd_api.g_ret_sts_success
      THEN
         DBMS_OUTPUT.put_line (   'PO line '
                               || c_po_line_rec.line_num
                               || 'Cancelled for po : '
                               || c_po_line_rec.po_number
                              );
         COMMIT;
      ELSE
         DBMS_OUTPUT.put_line (   'Cancellation of PO Failed for PO line '
                               || c_po_line_rec.line_num
                               || 'Cancelled for po : '
                               || c_po_line_rec.po_number
                              );
         ROLLBACK;

         FOR i IN 1 .. fnd_msg_pub.count_msg
         LOOP
            v_msg_data :=
                         fnd_msg_pub.get (p_msg_index      => i,
                                          p_encoded        => 'F');
            DBMS_OUTPUT.put_line (i || ') ' || v_msg_data);
            fnd_file.put_line (fnd_file.output, i || ') ' || v_msg_data);
         END LOOP;
      END IF;
   END LOOP;
   
   ----------------------Reapprove the PO----------------------
BEGIN
   BEGIN
      SELECT po_header_id
        INTO v_po_header_id
        FROM apps.po_headers_all
       WHERE segment1 = '106939' AND org_id = v_org_id and po_header_id=5037589;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         v_error_flag := 1;
         v_main_error := v_main_error || 'PO does not exist in EBS';
   END;

   IF v_error_flag <> 1
   THEN
      l_document_id := v_po_header_id;
      --------INITIALIZING APPS ENVIRONMENT-------------------------------
      apps.mo_global.init ('PO');
      apps.mo_global.set_policy_context ('S', v_org_id);
      fnd_global.apps_initialize (26137, 51814, 201);
      apps.po_moac_utils_pvt.set_org_context (v_org_id);
-- Set the FND profile option values.
      apps.fnd_profile.put ('AFLOG_ENABLED', 'Y');
      apps.fnd_profile.put ('AFLOG_MODULE', '%');
      apps.fnd_profile.put ('AFLOG_LEVEL', TO_CHAR (1));
      apps.fnd_profile.put ('AFLOG_FILENAME', '');
      -- Refresh the FND cache.
      apps.fnd_log_repository.init ();
      --Get User ID and Login ID
      l_user_id := apps.fnd_global.user_id;
      l_login_id := apps.fnd_global.login_id;

      BEGIN
         SELECT NVL (conterms_exist_flag, 'N'), revision_num,
                DECODE (type_lookup_code,
                        'BLANKET', 'PA',
                        'CONTRACT', 'PA',
                        'PO'
                       ),
                type_lookup_code, agent_id
           INTO l_conterms_exist_flag, l_revision_num,
                l_doc_type,
                l_doc_subtype, l_agent_id
           FROM apps.po_headers_all
          WHERE po_header_id = l_document_id;

         l_comm_doc_type := l_doc_subtype;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            SELECT NVL (poh.conterms_exist_flag, 'N'), por.revision_num,
                   'RELEASE', poh.type_lookup_code, por.agent_id
              INTO l_conterms_exist_flag, l_revision_num,
                   l_doc_type, l_doc_subtype, l_agent_id
              FROM apps.po_releases_all por, apps.po_headers_all poh
             WHERE po_release_id = l_document_id
               AND poh.po_header_id = por.po_header_id;

            l_comm_doc_type := l_doc_type;
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line (   'IN EXCEPTION sqlcode: '
                                  || SQLCODE
                                  || 'sqlerrm: '
                                  || SQLERRM
                                 );
      END;

      SELECT podt.default_approval_path_id
        INTO l_approval_path_id
        FROM apps.po_document_types podt
       WHERE podt.document_type_code = l_doc_type
         AND podt.document_subtype = l_doc_subtype;

      SELECT MAX (log_sequence)
        INTO l_progress
        FROM apps.fnd_log_messages;

      apps.po_document_action_pvt.do_approve
                                    (p_document_id           => l_document_id,
                                     p_document_type         => l_doc_type,
                                     p_document_subtype      => l_doc_subtype,
                                     p_note                  => NULL,
                                     p_approval_path_id      => l_approval_path_id,
                                     x_return_status         => x_return_status,
                                     x_exception_msg         => x_msg_data
                                    );

      SELECT MAX (log_sequence)
        INTO l_progress
        FROM apps.fnd_log_messages;

      IF x_return_status = 'SPP'
      THEN
         -- Communicate to the Supplier
         apps.po_vendor_sites_sv.get_transmission_defaults
                                       (p_document_id             => l_document_id,
                                        p_document_type           => l_doc_type,
                                        p_document_subtype        => l_doc_subtype,
                                        p_preparer_id             => l_agent_id,
                                        x_default_method          => l_default_method,
                                        x_email_address           => l_emailaddress,
                                        x_fax_number              => l_faxnum,
                                        x_document_num            => l_doc_num,
                                        p_retrieve_only_flag      => 'Y'
                                       );

         IF (l_default_method = 'EMAIL') AND (l_emailaddress IS NOT NULL)
         THEN
            l_faxnum := NULL;
         ELSIF (l_default_method = 'FAX') AND (l_faxnum IS NOT NULL)
         THEN
            l_emailaddress := NULL;
         ELSIF (l_default_method = 'PRINT')
         THEN
            l_emailaddress := NULL;
            l_faxnum := NULL;
         ELSE
            l_default_method := 'PRINT';
            l_emailaddress := NULL;
            l_faxnum := NULL;
         END IF;

         apps.po_communication_pvt.communicate
            (p_authorization_status      => apps.po_document_action_pvt.g_doc_status_approved,
             p_with_terms                => l_conterms_exist_flag,
             p_language_code             => apps.fnd_global.current_language,
             p_mode                      => l_default_method,
             p_document_id               => l_document_id,
             p_revision_number           => l_revision_num,
             p_document_type             => l_comm_doc_type,
             p_fax_number                => l_faxnum,
             p_email_address             => l_emailaddress,
             p_request_id                => l_request_id
            );

         SELECT MAX (log_sequence)
           INTO l_progress
           FROM apps.fnd_log_messages;

         apps.fnd_file.put_line (apps.fnd_file.LOG,
                                 ' LOG SEQUENCE ' || l_progress
                                );
      END IF;

      COMMIT;
   ELSE
      DBMS_OUTPUT.put_line ('Error' || v_main_error);
   END IF;
EXCEPTION
   WHEN OTHERS
   THEN
      SELECT MAX (log_sequence)
        INTO l_progress
        FROM apps.fnd_log_messages;

      apps.fnd_file.put_line (apps.fnd_file.LOG,
                              ' LOG SEQUENCE ' || l_progress
                             );
END;
END;
/