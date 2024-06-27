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
