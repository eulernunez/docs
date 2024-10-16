-- Locations: Albania - Korce - Pipeline O&M Center
SELECT * FROM ewc_noise_monitoring_location WHERE country_id = 6 AND site_id = 42;
-- SELECT * FROM ewc_noise_monitoring_location_parameters WHERE noise_monitoring_location_id IN (SELECT id FROM ewc_noise_monitoring_location WHERE country_id = 6 AND site_id = 42);
SELECT * FROM ewc_noise_monitoring_location_parameters WHERE noise_monitoring_location_id = 4;

SELECT DISTINCT
        n.*,
        d.id,
        d.`name`,
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
        IF(d.threshold_id = 3, CONCAT(d_a.corporate_max_limit,'-',d_a.corporate_min_limit),'') AS range_corporate,
        IF(d.threshold_id = 3, CONCAT(d_b.country_max_limit,'-',d_b.country_min_limit),'') AS range_country,
        IF(d.threshold_id = 3, CONCAT(d_c.site_max_limit,'-',d_c.site_min_limit),'') AS range_site,
        IF(d.threshold_id = 3, CONCAT(d_d.location_type_max_limit,'-',d_d.location_type_min_limit),'') AS range_locate_type,
        IF(d.threshold_id = 3, CONCAT(d_e.location_max_limit,'-',d_e.location_min_limit),'') AS range_locate
        
        FROM ewc_noise_monitoring_location AS n 
				INNER JOIN ewc_noise_monitoring_location_parameters AS p ON p.noise_monitoring_location_id = n.id
				INNER JOIN ewc_data_config_detail_parameters AS d ON p.detail_parameter_id = d.id
				LEFT JOIN ewc_data_config_detail_parameter_apply_to_corporate AS d_a ON d_a.detail_parameter_id = d.id
				LEFT JOIN ewc_data_config_detail_parameter_apply_to_country AS d_b ON d_b.detail_parameter_id = d.id
				LEFT JOIN ewc_data_config_detail_parameter_apply_to_site AS d_c ON d_c.detail_parameter_id = d.id
				LEFT JOIN ewc_data_config_detail_parameter_apply_to_location_type AS d_d ON d_d.detail_parameter_id = d.id
				LEFT JOIN ewc_data_config_detail_parameter_apply_to_location AS d_e ON d_e.detail_parameter_id = d.id
        -- WHERE n.country_id = 6 AND n.site_id = 38 AND(d_b.country_id = 6 OR (d_c.country_id = 6 AND d_c.site_id = 38))
				WHERE n.id = 4 AND (d_b.country_id = 6 OR (d_c.country_id = 6 AND d_c.site_id = 42) OR d_a.corporate_max_limit > 0 OR d_a.corporate_min_limit > 0);

SELECT * FROM ewc_noise WHERE id = 42;
SELECT * FROM ewc_noise_noise_monitoring_location_setup WHERE noise_id = 42;

-- SELECT * FROM gat_observations AS o WHERE o.id = 308 OR o.id = 309 OR o.id = 310;  -- WHERE o.environmental_emissions_id = 0; --  AND o.source_id = 111;
-- SELECT * FROM gat_corrective_actions WHERE observation_id = 308 OR observation_id = 309 OR observation_id = 310;


-- TRUNCATE TABLE ewc_noise_noise_monitoring_location_setup;
-- TRUNCATE TABLE ewc_noise