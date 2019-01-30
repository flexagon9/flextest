whenever sqlerror exit -1
set echo on
spool CreateFlexDeploySchemas.out
@scripts/CreateFF.sql &1
@scripts/FFOracleXE.sql
@scripts/FDOracleCreateSchema.sql &1
@scripts/GrantFF.sql
@scripts/FDOracleObjects.sql
@scripts/FDOracleGenerateProcedures.sql
@scripts/FDOracleGrant.sql
@scripts/FDOracleADFStateMgt.sql
quit;