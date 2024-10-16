SELECT * FROM ewc_groundwater_location WHERE id = 2;
SELECT * FROM ewc_groundwater_location_parameters WHERE groundwater_location_id = 2 ;
SELECT * FROM ewc_groundwater_sampling;
SELECT * FROM ewc_groundwater_sampling WHERE id = 16;
SELECT * FROM ewc_groundwater_sampling_sampling_equipment WHERE groundwater_sampling_id = 16;
SELECT * FROM ewc_groundwater_sampling_setup WHERE groundwater_sampling_id = 16;
SELECT * FROM ewc_data_config_detail_parameters;
SELECT * FROM ewc_data_config_parameter_type;
SELECT * FROM ewc_data_config_detail_parameters; -- WHERE  id = 5 OR id = 6 OR id = 7 OR id = 8 OR id = 9 OR id = 10 OR id = 11 OR id = 12 OR id = 13 OR id = 14 OR id = 15;
-- SELECT * FROM ewc_data_config_detail_parameter_apply_to_corporate WHERE detail_parameter_id = 5 OR detail_parameter_id = 6 OR detail_parameter_id = 7;
-- SELECT * FROM ewc_data_config_detail_parameter_apply_to_country WHERE detail_parameter_id = 5 OR detail_parameter_id = 6 OR detail_parameter_id = 7;
-- SELECT * FROM ewc_data_config_detail_parameter_apply_to_site WHERE detail_parameter_id = 5 OR detail_parameter_id = 6 OR detail_parameter_id = 7;
-- SELECT * FROM ewc_data_config_detail_parameter_apply_to_location_type WHERE detail_parameter_id = 5 OR detail_parameter_id = 6 OR detail_parameter_id = 7;
-- SELECT * FROM ewc_data_config_detail_parameter_apply_to_location WHERE detail_parameter_id = 5 OR detail_parameter_id = 6 OR detail_parameter_id = 7;

SELECT
                            n.*,
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
                            FROM ewc_groundwater_location AS n 
                                    INNER JOIN ewc_groundwater_location_parameters AS p ON p.groundwater_location_id = n.id
                                    INNER JOIN ewc_data_config_detail_parameters AS d ON p.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_detail_parameter_apply_to_corporate AS d_a ON d_a.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_detail_parameter_apply_to_country AS d_b ON d_b.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_detail_parameter_apply_to_site AS d_c ON d_c.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_detail_parameter_apply_to_location_type AS d_d ON d_d.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_detail_parameter_apply_to_location AS d_e ON d_e.detail_parameter_id = d.id
                                    LEFT JOIN ewc_data_config_parameter_type AS t ON d.parameter_type_id = t.id
                                    WHERE n.id = 7 AND (d_b.country_id = 6 OR (d_c.country_id = 6 AND d_c.site_id = 40) OR d_a.corporate_max_limit > 0 OR d_a.corporate_min_limit > 0)



/* TABLAS POR SECTION
SELECT * FROM ewc_groundwater_location;
SELECT * FROM ewc_groundwater_location_parameters;
SELECT * FROM ewc_groundwater_sampling;
SELECT * FROM ewc_groundwater_sampling_setup;


-- SELECT * FROM ewc_air_quality_monitoring_locations;
-- SELECT * FROM ewc_air_quality_monitoring_location_parameters;
-- SELECT * FROM ewc_ambient_air_quality_monitoring;
-- SELECT * FROM ewc_ambient_air_quality_monitoring_setup;
*/




/*
SELECT * FROM ewc_data_config_thresholds;
SELECT * FROM ewc_noise WHERE id = 27;
SELECT * FROM ewc_noise_noise_monitoring_location_setup WHERE noise_id = 27;
*/