SELECT 
		e.id,
      e.`uuid`,
		e.`code`,
		e.`name`,
		e.`description`
		
		FROM skmp_conf_equipments AS e 
										INNER JOIN skmp_conf_equipment_equipment_types AS eet ON eet.equipment_id = e.id
										INNER JOIN skmp_conf_equipment_types AS et ON et.`uuid` = eet.equipment_type_uuid
		
                                WHERE et.`uuid` IN ('40fbc9ce-fe48-4b4b-b8b0-aef3697ba58f', '2597fb00-40e2-4c2d-8063-2fef91b37837') AND (e.is_deleted = 0 AND e.created_by = 1 AND e.`code` IS NOT NULL AND e.`name` IS NOT NULL) GROUP BY e.id
                                
                                
                                
 -- 2597fb00-40e2-4c2d-8063-2fef91b37837       
 -- 31486b1e-4eba-4cb6-b69e-580211e8c298                        