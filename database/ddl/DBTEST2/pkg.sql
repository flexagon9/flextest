--------------------------------------------------------
--  DDL for Package XXSSI_WS_MAINT_ADMIN_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "DBTEST2"."XXSSI_WS_MAINT_ADMIN_PKG" AUTHID DEFINER
AS



  --******************************************************************************
  --  Application Name  : School Specialty, Inc.
  --
  --  Module Name       : XXSSI_WS_MAINT_ADMIN_PKG.pkh
  --
  --  Function          : This script will create the package
  --                      specification for XXSSI_WS_MAINT_ADMIN_PKG
  --
  --  ORIGINAL CONTROL #: CAR 11201512 ACE 34311 #505
  --
  --  AUTHOR: Jack Reynebeau (Jack.Reynebeau@flexagon.com) Jim Hardtke (jim.hardtke@flexagon.com)
  --
  --  LATEST REVISION DETAILS:
  --
  --  HISTORY:
  --******************************************************************************
  
  gv_vcPackageName VARCHAR2(30) := 'XXSSI_WS_MAINT_ADMIN_PKG';

  PROCEDURE CREATE_ADMIN (
      pi_log_level            IN NUMBER DEFAULT 2,
      pi_org_admin_id         IN NUMBER,
      pi_admin_email          IN VARCHAR2,
      pi_parent_org_dtl_id    IN NUMBER,
      pi_org_sourced_id       IN VARCHAR2,
      
      pi_start_date           IN DATE,
      pi_end_date             IN DATE,
      pi_is_primary           IN VARCHAR2,
      pi_created_by           IN VARCHAR2,
      po_org_admin_id         OUT NOCOPY NUMBER,
      po_records_changed      OUT NOCOPY NUMBER,
      po_records_action       OUT NOCOPY VARCHAR2,
      po_return_status        OUT NOCOPY VARCHAR2,
      po_return_mesg          OUT NOCOPY VARCHAR2);

  PROCEDURE UPDATE_ADMIN (
      pi_log_level            IN NUMBER DEFAULT 2,
      pi_org_admin_id         IN NUMBER,
      pi_org_dtl_id           IN NUMBER,
      pi_start_date           IN DATE,
      pi_end_date             IN DATE,
      pi_is_primary           IN VARCHAR2,
      pi_inactive             IN VARCHAR2,
     
      pi_updated_by           IN VARCHAR2,
      po_records_changed      OUT NOCOPY NUMBER,
      po_records_action       OUT NOCOPY VARCHAR2,
      po_return_status        OUT NOCOPY VARCHAR2,
      po_return_mesg          OUT NOCOPY VARCHAR2);

  PROCEDURE DELETE_ADMIN (
      pi_log_level            IN NUMBER DEFAULT 2,
      pi_org_admin_id         IN NUMBER,
      pi_updated_by           IN VARCHAR2,
      po_records_changed      OUT NOCOPY NUMBER,
      po_records_action       OUT NOCOPY VARCHAR2,
      po_return_status        OUT NOCOPY VARCHAR2,
      po_return_mesg          OUT NOCOPY VARCHAR2);

END XXSSI_WS_MAINT_ADMIN_PKG;

/
