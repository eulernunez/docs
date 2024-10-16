SELECT * FROM comp_competence WHERE by_whom = 'TAP Personnel';

SELECT COUNT(*), a.country_id, a.site_id FROM comp_rel_competence_attributes AS a WHERE a.competence_id = 430 GROUP BY a.country_id,a.site_id;
-- SELECT COUNT(*), a.country_id, a.site_id FROM comp_rel_competence_attributes AS a WHERE a.competence_id = 404 GROUP BY a.country_id,a.site_id;

