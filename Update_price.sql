
SET SERVEROUTPUT ON;
SET VERIFY OFF;

Accept X CHAR prompt "ISP NAME="
Accept Y CHAR prompt "PAckage="
Accept Z CHAR prompt "Price="

BEgin
	NULL;
END;
/



CREATE OR REPLACE PACKAGE mypacks AS

   PROCEDURE Updates(B1 IN IspName.ISPNAME%TYPE,B2 IN Packagee.Packagee%type,B3 IN varchar2);
   
END mypacks;
/



CREATE OR REPLACE PACKAGE BODY mypacks AS

	

	PROCEDURE Updates(B1 IN IspName.ISPNAME%TYPE,B2 IN Packagee.Packagee%type,B3 IN varchar2)
	IS
	
	A int;
	B int;
	
Begin

	select distinct a.ispid,b.PackageID into A,B from ispname a inner join packagee b on a.ispid=b.ispid
			where a.ispname=B1 and b.packagee=b2;
	
	update price @site1 set price=B3 where packageid=B and Ispid=A;
	commit;

	
	
	end Updates;
	
	

END mypacks;
/

DECLARE
	
	C VARCHAR2(20);
	D VARCHAR2(20);
	E VARCHAR2(20);
	F VARCHAR2(20);
	A int;
	
BEGIN
	
	C:='&X';
	D:='&y';
	E:= '&z';
	select distinct ispname into F  from ispname where ispname=c;
	
	mypacks.Updates(C,D,E);

Exception
	When NO_DATA_Found then
	DBMS_OUTPUT.PUT_LINE('NO Such PRovider.');
	 	
	
	
END;
/
