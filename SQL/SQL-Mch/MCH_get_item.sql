SELECT
		                i.id, i.code, i.name, i.group_id, 
		                -- ONLY FOR s.critical, s.allow_pictures, s.allow_na, ONLY FOR mch_configuration_item_standards
		                o.option_to_select_id AS option_to_select,
		                d.id AS DETAIL_ID,
		                d.configuration_item_option_to_select_id, d.free_text_description, d.enhansed, 
		                d.yes_no_answer, d.yes_no_item_id, items_yes_no_item_id.name AS yes_no_item_name, 
		                d.yes_no_na_answer, d.yes_no_na_item_id, items_yes_no_na_item_id.name AS yes_no_na_item_name,  
		                d.multiple_n_answer, d.multiple_n_item_id, items_multiple_n_item_id.name AS multiple_n_item_name, 
		                d.multiple_one_answer, d.multiple_one_item_id, items_multiple_one_item_id.name AS multiple_one_item_name,
		                d.time_period_id, d.time_item_id, items_time_item_id.name AS time_item_name,
						d.dosage_recurrence, d.dosage_quantity_id, d.dosage_item_id, items_dosage_item_id.name AS dosage_item_name, 
						d.dosage_intermittent_period_every_id, d.dosage_intermittent_period_lasting_id,
						d.associate_to,	 
		                g.id AS groupId, g.name AS groupName,fo.value AS feedOptionsToSelectId, fo.name AS feedOptionsToSelectName,        
		                -- items.id AS itemId, items.name AS itemName,
		                -- items_a.id AS item_aId, items_a.name AS item_aName,
		                -- items_b.id AS item_bId, items_b.name AS item_bName,
		                -- items_c.id AS item_cId, items_c.name AS item_cName,
		                -- items_e.id AS item_eId, items_e.name AS item_eName,
		                -- items_f.id AS item_fId, items_f.name AS item_fName,
		                
		                p.id AS timePeriodId, p.name AS timePeriodName,
		                d1.id AS periodEveryId, d1.name AS periodEveryName,
		                d2.id AS periodLastingId, d2.name AS periodLastingName,
		                q.id AS dosageId, q.name AS dosageName,
		                
						col.table_id AS tableId, col.`field`, col.data_type_bbdd_id AS typeData, col.`length`, col.preview_style, col.how_many_columns, t.name AS tableName, dt.name AS fieldName,
						sel.id AS selectedId, sel.answer, sel.associate_to AS associateToSelecteds, sel.item_id AS selector_item_id, items_selector_item_id.name AS selector_item_name,
						gr.`type`, gr.min, gr.max,
						grv.var,
						im.variable, im.min AS minIm, im.max AS maxIm 
						-- items_s.id AS items_sId, items_s.name AS items_sName 
                      
		 	            FROM mch_configuration_items AS i
		 	            	LEFT JOIN mch_configuration_feed_groups AS g ON i.group_id = g.id
			                 INNER JOIN mch_configuration_item_standards AS s ON s.configuration_item_id = i.id
			                -- INNER JOIN mch_configuration_item_examinations AS s ON s.configuration_item_id = i.id
			                
		 	                INNER JOIN mch_configuration_item_options_to_select AS o ON o.configuration_item_id = i.id 
								  INNER JOIN mch_configuration_feed_options_to_select AS fo ON fo.value = o.option_to_select_id 
								  LEFT JOIN mch_configuration_item_options_to_select_detail AS d ON d.configuration_item_option_to_select_id = o.id
			                -- LEFT JOIN mch_configuration_feed_items_childrens AS items ON d.yes_no_item_id = items.id
		 	                -- LEFT JOIN mch_configuration_feed_items_childrens AS items_a ON d.yes_no_na_item_id = items_a.id
		 	                -- LEFT JOIN mch_configuration_feed_items_childrens AS items_b ON d.multiple_n_item_id = items_b.id
		 	                -- LEFT JOIN mch_configuration_feed_items_childrens AS items_c ON d.multiple_one_item_id = items_c.id
		 	                -- LEFT JOIN mch_configuration_feed_items_childrens AS items_e ON d.time_item_id = items_e.id
		 	                LEFT JOIN mch_configuration_feed_periods AS p ON d.time_period_id = p.id
		 	                -- LEFT JOIN mch_configuration_feed_items_childrens AS items_f ON d.dosage_item_id = items_f.id
		 	                LEFT JOIN mch_configuration_feed_periods AS d1 ON d.dosage_intermittent_period_every_id = d1.id
		 	                LEFT JOIN mch_configuration_feed_periods AS d2 ON d.dosage_intermittent_period_lasting_id = d2.id
		 	                LEFT JOIN mch_configuration_feed_quantities AS q ON d.dosage_quantity_id = q.id
		 	                
								 LEFT JOIN mch_configuration_item_options_to_select_columns AS col ON col.configuration_item_option_to_select_id = o.id
		 	                LEFT JOIN mch_configuration_item_options_to_select_selecteds AS sel ON sel.configuration_item_option_to_select_id = o.id
		 	                
		 	                LEFT JOIN mch_configuration_feed_load_tables AS t ON col.table_id = t.id
		 	                LEFT JOIN mch_configuration_feed_data_types_bbdd AS dt ON col.data_type_bbdd_id = dt.id
		 	                
		 	                -- LEFT JOIN mch_configuration_feed_items_childrens AS items_s ON sel.item_id = items_s.id
		 	            
		 	                LEFT JOIN mch_configuration_items AS items_yes_no_item_id ON items_yes_no_item_id.id = d.yes_no_item_id
		 	                LEFT JOIN mch_configuration_items AS items_yes_no_na_item_id ON items_yes_no_na_item_id.id = d.yes_no_na_item_id
		 	                LEFT JOIN mch_configuration_items AS items_multiple_n_item_id ON items_multiple_n_item_id.id = d.multiple_n_item_id
		 	                LEFT JOIN mch_configuration_items AS items_multiple_one_item_id ON items_multiple_one_item_id.id = d.multiple_one_item_id
		 	                LEFT JOIN mch_configuration_items AS items_time_item_id ON items_time_item_id.id = d.time_item_id
		 	                LEFT JOIN mch_configuration_items AS items_dosage_item_id ON items_dosage_item_id.id = d.dosage_item_id
		 	                LEFT JOIN mch_configuration_items AS items_selector_item_id ON items_selector_item_id.id = sel.item_id
		 	            
		 	            	 LEFT JOIN mch_configuration_item_options_to_select_graphics AS gr ON gr.configuration_item_option_to_select_id = o.id
							    LEFT JOIN mch_configuration_item_options_to_select_graphics_variables AS grv ON grv.select_graphic_id = gr.id  
		 	                LEFT JOIN mch_configuration_item_options_to_select_information_matrixes AS im ON im.configuration_item_option_to_select_id = o.id
			                		WHERE i.type_item = 1 AND i.is_deleted = 0 AND i.id = 80;
			                

SELECT * FROM mch_configuration_item_options_to_select WHERE configuration_item_id = 55;
SELECT * FROM mch_configuration_item_options_to_select_detail WHERE configuration_item_option_to_select_id = 95; 
			                
			                
SELECT * FROM mch_configuration_items;
SELECT * FROM mch_configuration_item_options_to_select;
SELECT * FROM mch_configuration_item_options_to_select_detail
			                
			                
			                
			                