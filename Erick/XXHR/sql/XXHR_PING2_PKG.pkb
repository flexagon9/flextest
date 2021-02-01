--------------------------------------------------------
--  DDL for Package Body XXHR_PING2_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "APPS"."XXHR_PING2_PKG" AS

  PROCEDURE Ping2
( p_in     IN VARCHAR2,
  x_out    OUT VARCHAR2
) AS
  BEGIN
    x_out := 'PING: '|| p_in || ' .  PONG!';
  END Ping2;

  PROCEDURE GET_DATETIME
( x_out    OUT DATE
) AS
BEGIN
    SELECT sysdate into x_out from dual;
END GET_DATETIME;

END XXHR_PING2_PKG;

/
