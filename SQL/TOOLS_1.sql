SELECT * FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME LIKE '%children%' OR SCHEMA_NAME LIKE '%mch%';

-- dev_mch
SELECT TABLE_NAME, create_time FROM INFORMATION_SCHEMA. TABLES WHERE table_schema = 'dev_mch' ORDER BY create_time ;
-- dev_mch_sandbox
-- SELECT TABLE_NAME, create_time FROM INFORMATION_SCHEMA. TABLES WHERE table_schema = 'dev_mch_sandbox' ORDER BY create_time ;
-- dev_thechildren
SELECT TABLE_NAME, create_time FROM INFORMATION_SCHEMA. TABLES WHERE table_schema = 'dev_thechildren' ORDER BY create_time ;
-- dev_montreal_childrens_hospital
SELECT TABLE_NAME, create_time FROM INFORMATION_SCHEMA. TABLES WHERE table_schema = 'dev_montreal_childrens_hospital' ORDER BY create_time ;
-- dev_sandbox_thechildren
SELECT TABLE_NAME, create_time FROM INFORMATION_SCHEMA. TABLES WHERE table_schema = 'dev_sandbox_thechildren' ORDER BY create_time ; -- AND table_name = 'NOMBRE-Tabla';

-- ==================================================================
-- ==================================================================

SELECT 
		COUNT(*) 
		FROM Information_Schema.TABLES 
		WHERE 
				table_type = 'BASE TABLE' AND 
				table_schema = 'dev_montreal_childrens_hospital' AND 
				table_name LIKE '%sk_pd%';
 