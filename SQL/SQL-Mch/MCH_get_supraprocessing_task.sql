SELECT
		 * 
		 FROM mch_supra_processing_tasks AS t
		 	LEFT JOIN mch_supra_processing_task_items AS i ON i.supra_processing_task_id = t.id
		   LEFT JOIN mch_supra_processing_task_pictures AS p ON p.picture_task_id = t.task_id AND p.picture_supra_process_id = t.supra_process_id 
																														  AND p.picture_process_id = t.process_id
																														  AND p.picture_sub_process_id = t.sub_process_id 
																														  AND p.picture_form_id = t.form_id 
																														  AND p.picture_section_id = t.section_id 
																														  AND p.picture_item_id = t.item_id   -- p.supra_processing_task_id = t.id
         -- LEFT JOIN mch_supra_processing_task_pictures AS p ON  p.supra_processing_task_id = t.id
			LEFT JOIN mch_supra_processing_task_draws AS d ON d.supra_processing_task_id = t.id
			LEFT JOIN mch_supra_processing_task_draweds AS dw ON dw.supra_processing_task_id = t.id
		   LEFT JOIN files_store AS f ON d.file_path = f.file_uuid
				WHERE t.task_id = 1;
				                
