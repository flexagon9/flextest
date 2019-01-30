whenever sqlerror exit -1
set echo on
spool LoadFlexDeployMasterData.out
@scripts/LOVData.sql
@scripts/MasterData.sql
quit;
