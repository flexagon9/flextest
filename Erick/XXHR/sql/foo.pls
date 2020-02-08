CREATE OR REPLACE PACKAGE xxhr_bipub_rep_pkg2 AS
-----------------------------------------------------------------------------------------------------
--
--  @rep:some stuff
--  @flexdeploy-rep:alias myservicealias
--  @flexdeploy-rep:type SOAP
----------------------------------------------------------------------------------------------------
                         
   PROCEDURE generate_xml(p_errbuf  OUT VARCHAR2
                         ,p_retcode OUT NUMBER);

END xxhr_bipub_rep_pkg2;
/
