SELECT * FROM ewc_noise;
SELECT * FROM ewc_noise_noise_monitoring_location_setup;

-- SELECT * FROM ewc_noise_monitoring_location WHERE country_id = 6 AND site_id = 42;
-- SELECT * FROM ewc_noise_monitoring_location WHERE is_deleted = 0 AND country_id = 6 AND site_id = 42;



SELECT * FROM ewc_noise_monitoring_location WHERE id = 4; 
SELECT * FROM ewc_noise_monitoring_location_parameters WHERE noise_monitoring_location_id = 4;


-- SELECT * FROM ewc_data_config_detail_parameters;
SELECT * FROM ewc_data_config_detail_parameters WHERE id = 1 OR id = 3 OR id = 4;
SELECT * FROM ewc_data_config_detail_parameter_apply_to_corporate WHERE detail_parameter_id = 1 OR detail_parameter_id = 3 OR detail_parameter_id = 4;
SELECT * FROM ewc_data_config_detail_parameter_apply_to_country WHERE detail_parameter_id = 1 OR detail_parameter_id = 3 OR detail_parameter_id = 4;
SELECT * FROM ewc_data_config_detail_parameter_apply_to_site WHERE detail_parameter_id = 1 OR detail_parameter_id = 3 OR detail_parameter_id = 4;
SELECT * FROM ewc_data_config_detail_parameter_apply_to_location_type WHERE detail_parameter_id = 1 OR detail_parameter_id = 3 OR detail_parameter_id = 4;
SELECT * FROM ewc_data_config_detail_parameter_apply_to_location WHERE detail_parameter_id = 1 OR detail_parameter_id = 3 OR detail_parameter_id = 4;

-- SELECT * FROM ewc_data_config_thresholds;