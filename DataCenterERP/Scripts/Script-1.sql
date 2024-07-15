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
exp KTHpro/741963@localhost:1521/xe file='C:\Users\taehe\git\Datahub\backup\backup.dmp' full=y;


--기본 테이블


DROP TABLE board;
create table board(
 no number(5) primary key,
 refno number(5),
 subject varchar2(100),
 content varchar2(1000), 
 writer varchar2(50),
 readcnt number(3),
 regdte date,
 uptdte date
);
SELECT * FROM board;

create sequence board_seq
  start with 1
  maxvalue 9999;
insert into board values(board_seq.nextval,0,'첫번째글',
'내용', '홍길동',0,sysdate,sysdate);
select * from board
where subject like '%%'
and writer like '%%';

SELECT * FROM board;
UPDATE board 
  SET SUBJECT = '변경',
      CONTENT= '변경(내용)', --content
      UPTDTE = SYSDATE
WHERE NO = 1;    
DROP 
DELETE FROM board 
WHERE NO = 2;
/*
SELECT * FROM board;
UPDATE board 
  SET SUBJECT = #{SUBJECT},
      CONTENT = #{CONTENT},
      UPTDTE = SYSDATE
WHERE NO = #{NO}    

DELETE FROM board 
WHERE NO = #{NO}  
*/


       select rewnum cnt, level, b.* 
       from board b
       where subject like '%%'          
       and writer like '%%'
       start with refno = 0
       connect by prior no = refno
       order siblings by no desc;
/*

  select rewnum cnt, level, b.* 
       from board b
       where subject like '%%'          
       and writer like '%%'
       start with refno = 0
       connect by prior no = refno
       order siblings by no desc; 
*/      
      
SELECT (*)
FROM board;
WHERE subject LIKE '%%'
AND writer LIKE '%%';
SELECT *
FROM (
   select rownum cnt, level, b.*  
   from board b
   where subject like '%'||''||'%'
   and writer like '%'||''||'%'
   start with refno = 0
   connect by prior no = refno
   order siblings by no DESC )
WHERE cnt BETWEEN 1 AND 5;
/*
SELECT *
FROM (
   select rownum cnt, level, b.*  
   from board b
   where subject like '%'||#{subject}||'%'
   and writer like '%'||#{writer}||'%'
   start with refno = 0
   connect by prior no = refno
   order siblings by no DESC )
WHERE cnt BETWEEN #{start} AND #{end}
*/
Select COUNT(*) from assets where type = 'Router';

