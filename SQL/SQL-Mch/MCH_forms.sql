-- FORM 50
/*
SELECT * FROM mch_configuration_forms WHERE id = 50;
SELECT * FROM mch_configuration_forms_sections WHERE form_id = 50;
SELECT * FROM mch_configuration_forms_section_items WHERE form_id = 50;
SELECT * FROM mch_configuration_forms_section_item_dependent_elements WHERE form_section_item_id = 79;
SELECT * FROM mch_configuration_forms_section_item_dependencies WHERE form_section_item_id = 79;
SELECT * FROM mch_configuration_forms_section_item_dependency_selecteds WHERE form_section_item_dependency_id IN (SELECT id FROM mch_configuration_forms_section_item_dependencies WHERE form_section_item_id = 79);
*/

-- FORM 54
/*
SELECT * FROM mch_configuration_forms WHERE id = 54;
SELECT * FROM mch_configuration_forms_sections WHERE form_id = 54;
SELECT * FROM mch_configuration_forms_section_items WHERE form_id = 54;
SELECT * FROM mch_configuration_forms_section_item_dependent_elements WHERE form_section_item_id = 94;
SELECT * FROM mch_configuration_forms_section_item_dependencies WHERE form_section_item_id = 94;
SELECT * FROM mch_configuration_forms_section_item_dependency_selecteds WHERE form_section_item_dependency_id IN (SELECT id FROM mch_configuration_forms_section_item_dependencies WHERE form_section_item_id = 94);
*/


-- FORM 55

SELECT * FROM mch_configuration_forms WHERE id = 55;
SELECT * FROM mch_configuration_forms_sections WHERE form_id = 55;
SELECT * FROM mch_configuration_forms_section_items WHERE form_id = 55 AND form_section_id = 59;
SELECT * FROM mch_configuration_forms_section_item_dependent_elements WHERE form_section_item_id = 100;
SELECT * FROM mch_configuration_forms_section_item_dependencies WHERE form_section_item_id = 100;
SELECT * FROM mch_configuration_forms_section_item_dependency_selecteds WHERE form_section_item_dependency_id IN (SELECT id FROM mch_configuration_forms_section_item_dependencies WHERE form_section_item_id = 100);


