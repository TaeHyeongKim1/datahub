SELECT * FROM assets;

SELECT 
    cons.constraint_name,
    cons.constraint_type,
    cols.table_name,
    cols.column_name
FROM 
    all_constraints cons
    JOIN all_cons_columns cols ON cons.constraint_name = cols.constraint_name
WHERE 
    cons.table_name = assets;

/*UPDATE assets SET name = '',
            + " type = '', 
            + "status = '', 
            purchase_date = to_date('', 'YYYY-MM-DD') 
             "maintenance_schedule =to_date('', 'YYYY-MM-DD') 
             "location = '', 
             "ip_address = '', 
             "mac_address ='' 
             "WHERE id = ''
             --*/

SELECT count(*) FROM assets WHERE status = '운영';


DELETE FROM assets WHERE id = 11;

INSERT INTO assets(name, type, status, purchase_date, maintenance_schedule, location, ip_address, mac_address)
VALUES ('Server22', 'Server', '운영' ,to_date('2024-06-24', 'YYYY-MM-DD'), 
    		to_date('2028-12-01','YYYY-MM-DD'), 'D/C 3 Sec', '192.168.1.124', '00:1A:2B:3C:4D:12');
    		
    	
 CREATE TABLE CUSTOMER (
    username VARCHAR2(50) PRIMARY KEY,
    password VARCHAR2(100) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    company_number VARCHAR2(20) NOT NULL,
    role VARCHAR2(20) DEFAULT 'CUSTOMER'
);

CREATE TABLE ADMIN (
    username VARCHAR2(50) PRIMARY KEY,
    password VARCHAR2(100) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    employee_number VARCHAR2(20) NOT NULL,
    position VARCHAR2(50) NOT NULL,
    role VARCHAR2(20) DEFAULT 'ADMIN'
);

SELECT * FROM CUSTOMER;
SELECT * FROM admin;

CREATE TABLE member01(
   id varchar2(50),
   pwd varchar2(20),
   name varchar(50),
   auth varchar(10),
   point number
);
/*
public class Member{
   private String id;
   private String pwd;
   private String name;
   private String auth;
   private int point;
}
*/
