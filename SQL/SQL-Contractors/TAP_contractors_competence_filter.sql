SELECT * FROM comp_competence WHERE `code` = 'CAL183';
SELECT * FROM comp_rel_competence_attributes;

SELECT 
                competence.*,
                GROUP_CONCAT(DISTINCT (CONCAT(course.id, ':', course.name))
                    SEPARATOR ', ') AS list_courses,
                    attr.site_id,
                    
            FROM
                comp_competence competence
                    INNER JOIN
                comp_rel_competence_attributes attr ON competence.id = attr.competence_id
                    INNER JOIN
                company_sites site ON attr.site_id = site.id
                    INNER JOIN
                provider p ON p.id = attr.company_id
            
                    LEFT JOIN
                comp_competence_course rel ON rel.competence_id = competence.id
                    LEFT JOIN
                comp_course course ON rel.course_id = course.id
            WHERE
                attr.company_id = 1
                      AND attr.discipline_id IN (26)
                      AND site.site_id = 28
                      AND attr.role_id = 76
                      AND (competence.revision_status IS NULL OR competence.revision_status NOT IN ('temp'))
            GROUP BY competence.id;


            





            