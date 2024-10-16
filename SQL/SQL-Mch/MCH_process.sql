SELECT * FROM mch_configuration_processes WHERE id = 64;
SELECT * FROM mch_configuration_processes_subprocesses WHERE process_id = 64;

SELECT * FROM mch_configuration_processes_subprocess_forms WHERE process_id = 64 AND process_subprocess_id = 62;
SELECT * FROM mch_configuration_processes_subprocess_form_dependent_elements WHERE process_subprocess_form_id = 105;
SELECT * FROM mch_configuration_processes_subprocess_form_dependencies WHERE process_subprocess_form_id = 105;
SELECT * FROM mch_configuration_processes_subprocess_form_dependency_selecteds WHERE process_subprocess_form_dependency_id IN (SELECT id FROM mch_configuration_processes_subprocess_form_dependencies WHERE process_subprocess_form_id = 105);

SELECT
      sf.id AS ProcessesSubprocessFormId, sf.process_id, sf.process_subprocess_id,
		sf.mandatory_dependent, sf.is_mandatory,
 		f.id AS formId, f.name AS formName,
 	   ele.dependent_element_id AS dependent,
 		d.id AS dependencyId, d.active,
 		sel.id AS selectedId, sel.children, sel.color, sel.conditional, sel.counter, sel.parent, sel.form_id, sel.value
      FROM mch_configuration_processes_subprocess_forms AS sf
      	LEFT JOIN mch_configuration_forms AS f ON sf.form_id = f.id
         LEFT JOIN mch_configuration_processes_subprocess_form_dependent_elements AS ele ON ele.process_subprocess_form_id = sf.id
         LEFT JOIN mch_configuration_processes_subprocess_form_dependencies AS d ON d.process_subprocess_form_id = sf.id
         LEFT JOIN mch_configuration_processes_subprocess_form_dependency_selecteds AS sel ON sel.process_subprocess_form_dependency_id = d.id  
         	WHERE sf.process_id = 64 AND sf.process_subprocess_id = 62 AND sf.is_mandatory = 2;
         	
      	