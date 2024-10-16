SELECT
		                    n.*,
		                -- DATE_FORMAT(n.date,'%d/%m/%Y') AS date,
		                DATE_FORMAT(n.start_date,'%d/%m/%Y') AS start_date,
		                DATE_FORMAT(n.end_date,'%d/%m/%Y') AS end_date,
		                nm.code,
		                nm.name,
		                n.limit_value,
                        n.type_parameter,
                        t.name AS type
		                FROM ewc_ambient_air_quality_monitoring_setup AS n 
			                INNER JOIN ewc_data_config_detail_parameters AS nm ON n.parameter_id = nm.id  -- ewc_noise_monitoring_location
		                    INNER JOIN ewc_data_config_parameter_type AS t ON nm.parameter_type_id = t.id
			                WHERE n.ambient_air_quality_monitoring_id = 16 AND n.air_quality_monitoring_location_id = 10;



SELECT DISTINCT
                            n.*,
                            n.id AS LocationId,
                            n.`code` AS LocationCode,
                            n.`name` AS LocationName, 
                            d.id,
                            d.`code`, -- AS DetailParameterCode,
                            d.`name`, -- AS DetailParameterName,
                            d.threshold_id,
                            d_a.corporate_max_limit, d_a.corporate_min_limit,
                            d_b.country_max_limit, d_b.country_min_limit,
                            d_c.site_max_limit, d_c.site_min_limit,
                            d_d.location_type_max_limit, d_d.location_type_min_limit,
                            d_e.location_max_limit, d_e.location_min_limit,
                            IF(d.threshold_id <> 3 AND d_a.corporate_max_limit > 0, d_a.corporate_max_limit, IF(d.threshold_id <> 3 AND d_a.corporate_min_limit > 0, d_a.corporate_min_limit, 0)) AS corporate_limit,
                            IF(d.threshold_id <> 3 AND d_b.country_max_limit > 0, d_b.country_max_limit, IF(d.threshold_id <> 3 AND d_b.country_min_limit > 0, d_b.country_min_limit, 0)) AS country_limit,
                            IF(d.threshold_id <> 3 AND d_c.site_max_limit > 0, d_c.site_max_limit, IF(d.threshold_id <> 3 AND d_c.site_min_limit > 0, d_c.site_min_limit, 0)) AS site_limit,
                            IF(d.threshold_id <> 3 AND d_d.location_type_max_limit > 0, d_d.location_type_max_limit, IF(d.threshold_id <> 3 AND d_d.location_type_min_limit > 0, d_d.location_type_min_limit, 0)) AS location_type_limit,
                            IF(d.threshold_id <> 3 AND d_e.location_max_limit > 0, d_e.location_max_limit, IF(d.threshold_id <> 3 AND d_e.location_min_limit > 0, d_e.location_min_limit, 0)) AS location_limit,
                            IF(d.threshold_id = 3, CONCAT(d_a.corporate_min_limit,'-',d_a.corporate_max_limit),'') AS range_corporate,
                            IF(d.threshold_id = 3, CONCAT(d_b.country_min_limit,'-',d_b.country_max_limit),'') AS range_country,
                            IF(d.threshold_id = 3, CONCAT(d_c.site_min_limit,'-',d_c.site_max_limit),'') AS range_site,
                            IF(d.threshold_id = 3, CONCAT(d_d.location_type_min_limit,'-',d_d.location_type_max_limit),'') AS range_locate_type,
                            IF(d.threshold_id = 3, CONCAT(d_e.location_min_limit,'-',d_e.location_max_limit),'') AS range_locate,
                            t.`name` AS `type`
                            FROM ewc_air_quality_monitoring_locations AS n 
                                    INNER JOIN ewc_air_quality_monitoring_location_parameters AS p ON p.air_quality_monitoring_location_id = n.id
                                    INNER JOIN ewc_data_config_detail_parameters AS d ON p.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_detail_parameter_apply_to_corporate AS d_a ON d_a.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_detail_parameter_apply_to_country AS d_b ON d_b.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_detail_parameter_apply_to_site AS d_c ON d_c.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_detail_parameter_apply_to_location_type AS d_d ON d_d.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_detail_parameter_apply_to_location AS d_e ON d_e.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_parameter_type AS t ON d.parameter_type_id = t.id
                                    WHERE n.id = 12 AND (d_b.country_id = 6 OR (d_c.country_id = 6 AND d_c.site_id = 40) OR d_a.corporate_max_limit > 0 OR d_a.corporate_min_limit > 0);
                                    
SELECT * FROM ewc_ambient_air_quality_monitoring;
SELECT * FROM ewc_ambient_air_quality_monitoring_sampling_equipment;
SELECT * FROM ewc_ambient_air_quality_monitoring_setup;
SELECT * FROM ewc_air_quality_monitoring_locations;


