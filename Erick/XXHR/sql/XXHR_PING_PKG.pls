create or replace PACKAGE XXHR_PING_PKG AS
/* $Header: $ */
/*#
  * Sample Ping Package, testing annotations
  * @rep:scope public
  * @rep:product POS
  * @rep:lifecycle active
  * @rep:displayname Ping Test
  * @rep:category BUSINESS_ENTITY AP_SUPPLIER
  */

/*#
 * This is a test ping process.  It just returns the input with some text around it
 * @param p_in Input value, can be anything, will be echoed back
 * @param x_out Returned value from Ping
 * @rep:displayname Ping Database
 */
PROCEDURE Ping
( p_in     IN VARCHAR2,
  x_out    OUT VARCHAR2
);

/*#
 * This simple procedure gets the current datetime
 * @param x_out Returned current datetime
 * @rep:displayname Get current datetime
 */
PROCEDURE GET_DATETIME
( x_out    OUT DATE
);


END XXHR_PING_PKG;
/
