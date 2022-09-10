
SET SERVEROUTPUT ON;
SET VERIFY OFF;

Accept X CHAR prompt "ISP NAME="
Accept Y CHAR prompt "New Ispname="

BEgin
	NULL;
END;
/

CREATE OR REPLACE TRIGGER trig 
AFTER UPDATE 
ON Ispname
For each row

DECLARE

BEGIN
	Null;
END;
/


CREATE OR REPLACE PACKAGE updatepack AS

   PROCEDURE UpdateName(B1 IN IspName.ISPNAME%TYPE,B2 IN IspName.ISPNAME%TYPE);
   
END updatepack;
/



CREATE OR REPLACE PACKAGE BODY updatepack AS

	

	PROCEDURE UpdateName(B1 IN IspName.ISPNAME%TYPE,B2 IN IspName.ISPNAME%TYPE)
	IS
	
	
	
Begin

	update Ispname a set a.ispname=B2 where a.Ispname=B1;
		

	commit;
	
	end UpdateName;
	
	

END updatepack;
/

DECLARE
	
	C VARCHAR2(20);
	D VARCHAR2(20);
	F VARCHAR2(20);
	A int;
	
BEGIN
	
	C:='&X';
	D:='&y';
	select distinct ispname into F  from ispname where ispname=c;
	
	updatepack.UpdateName(C,D);

Exception
	When NO_DATA_Found then
	DBMS_OUTPUT.PUT_LINE('NO Such PRovider.');
	 	
	
	
END;
/
