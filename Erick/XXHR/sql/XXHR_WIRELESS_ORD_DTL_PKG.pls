CREATE OR REPLACE PACKAGE        "XXHR_WIRELESS_ORD_DTL_PKG" 
AS
  /* $Header: XXHR_WIRELESS_ORD_DTL_PKG.pls */
  /*#
  * Cox Wireless Sales Order Info Publish Package
  * @rep:scope public
  * @rep:product ONT
  * @rep:lifecycle active
  * @rep:displayname Cox Wireless Sales Order Info Publish
  * @rep:compatibility S
  * @rep:category BUSINESS_ENTITY ONT
  */

--***********************************************************************************************
-- File Name: XXHR_WIRELESS_ORD_DTL_PKG.pks
--************************************************************************************************
-- Object Type:         Package Spec
-- Object Name:         XXHR_WIRELESS_ORD_DTL_PKG
-- Program Description: This package is used to fetch the SO info from the DB view 
--                      "XXHR_WIRELESS_ORD_STATUS_V" for the given Orders.
-- Parameters:          Order Number (Table Type)
-- Program Execution:
--************************************************************************************************
--  Modification  Log:
--   Date        Version     Author               Description
--   ----------  ---------  ----------------  ----------------------------------------------------
--   09/03/2021   1.0        Bollam Chowdari    Package to fetch data from the DB view
--                                              XXHR_WIRELESS_ORD_STATUS_V for the Orders passed
--                                              as IN parameters (Table Type)
--  05/03/2022   2.0          Varsha G          Added order category and delivery id
--************************************************************************************************

   TYPE Ordernum_rec       IS RECORD (
        order_number       XXHR_WIRELESS_ORD_STATUS_V.ORDER_NUMBER%TYPE);

   TYPE Ordernum_tbl_type  IS TABLE OF Ordernum_rec;
   
   TYPE Orderdtls_rec_type       IS RECORD (
             ORDER_NUMBER		NUMBER
	     ,ORDERED_DATE		DATE
	     ,ORDER_CREATION_DATE	DATE
	     ,LINE_NUMBER		NUMBER
	     ,ORDERED_QUANTITY	NUMBER
	     ,ORDER_SOURCE		VARCHAR2(240)
	     ,ORDER_CATEGORY            VARCHAR2(50)
	     ,ORIG_SYS_REFERENCE	VARCHAR2(50)
	     ,ORIG_SYS_LINE_REF	VARCHAR2(50)
	     ,ORDER_TYPE		VARCHAR2(30)
	     ,LINE_STATUS_CODE	VARCHAR2(30)
	     ,ITEM_NUMBER		VARCHAR2(81)
	     ,ATTRIBUTE9		VARCHAR2(240)
	     ,SERIAL_NUMBER_CONTROL_CODE	NUMBER
	     ,DELIVERY_DETAIL_STATUS	VARCHAR2(80)
	     ,ORG_CODE		VARCHAR2(3)
	     ,HEADER_ID		NUMBER
	     ,LINE_ID			NUMBER
	     ,INVENTORY_ITEM_ID	NUMBER
	     ,ORGANIZATION_ID		NUMBER
	     ,DELIVERY_ID     	NUMBER
	     ,DELIVERY_DETAIL_ID	NUMBER
	     ,MTL_TRANSACTION_ID	NUMBER
	     ,SERIAL_NUMBER		VARCHAR2(30)
	     ,return_status        VARCHAR2(30)
	     ,error_msg            VARCHAR2(250) );
   
   TYPE Orderdtls_tbl_type  IS TABLE OF Orderdtls_rec_type;    
  

   ----Orderdtls_rec_type       XXHR_WIRELESS_ORD_STATUS_V%ROWTYPE;   
   ---TYPE Orderdtls_tbl_type  IS TABLE OF XXHR_WIRELESS_ORD_STATUS_V%ROWTYPE;    

   PROCEDURE getOrderDtls (p_in_status      IN   VARCHAR2
                          ,p_order_num_tbl  IN   Ordernum_tbl_type
                          ,x_order_dtls_tbl OUT  XXHR_WIRELESS_ORD_DTL_PKG.Orderdtls_tbl_type   
                          ,x_return_status  OUT  VARCHAR2
                          ,x_error_msg      OUT  VARCHAR2)
    /*#
    * This procedure Fetches and Publish Wireless sales orders info from Oracle
    * @param p_in_status                 IN  VARCHAR2
    * @param p_order_num_tbl             IN  Ordernum_tbl_type
    * @param x_order_dtls_tbl            OUT XXHR_WIRELESS_ORD_DTL_PKG.Orderdtls_tbl_type   
    * @param x_return_status             OUT VARCHAR2
    * @param x_error_msg                 OUT VARCHAR2
    * @rep:scope public
    * @rep:lifecycle active    
    * @rep:displayname Publish Wireless Sales Order Info
    * @rep:compatibility S
    * @rep:category BUSINESS_ENTITY ONT    
    */ 
    ;

END XXHR_WIRELESS_ORD_DTL_PKG;
/

