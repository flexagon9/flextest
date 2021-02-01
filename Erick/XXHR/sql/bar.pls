CREATE OR REPLACE PACKAGE xxhr_bipub_rep_pkg3 AS
-----------------------------------------------------------------------------------------------------
--
--  @rep:some stuff
----------------------------------------------------------------------------------------------------
                         
   PROCEDURE generate_xml(p_errbuf  OUT VARCHAR2
                         ,p_retcode OUT NUMBER);

END xxhr_bipub_rep_pkg3;
/
