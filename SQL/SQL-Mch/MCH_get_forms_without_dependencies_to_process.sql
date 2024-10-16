SELECT
 		p.id AS processId, p.code, p.name AS processName, p.category_id AS CategoryId, c.name AS CategoryName,
 		s.id AS subprocessId, s.name AS subprocessName,
 		sf.id AS subprocessFormId, sf.mandatory_dependent, sf.is_mandatory,
 		f.id AS formId, f.name AS formName
 		FROM mch_configuration_processes AS p
			LEFT JOIN mch_configuration_processes_subprocesses AS s ON s.process_id = p.id
			LEFT JOIN mch_configuration_processes_subprocess_forms AS sf ON sf.process_subprocess_id = s.id
			LEFT JOIN mch_configuration_forms AS f ON sf.form_id = f.id
			LEFT JOIN mch_configuration_feed_process_categories AS c ON p.category_id = c.id
			WHERE p.is_deleted = 0 AND f.is_deleted = 0 AND p.id = 64 
						              AND sf.is_mandatory = 1; -- Without dependencies