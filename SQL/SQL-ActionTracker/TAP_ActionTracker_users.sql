SELECT * FROM gat_groups;
SELECT * FROM gat_group_user WHERE user_id = 5;
SELECT * FROM gat_users;

-- UPDATE gat_users SET `password` = '220466675e31b9d20c051d5e57974150'

-- Global Writer 		sueladauti
SELECT * FROM gat_users WHERE id IN (SELECT user_id FROM gat_group_user WHERE group_id = 6);

-- Global Approver 	elson.gusho
SELECT * FROM gat_users WHERE id IN (SELECT user_id FROM gat_group_user WHERE group_id = 5);
-- user 5 obs_approver
-- 



-- Responsible CA 	n.sfounis
SELECT * FROM gat_users WHERE id IN (SELECT user_id FROM gat_group_user WHERE group_id = 9);

-- Approver_CA  		eliasbardi
SELECT * FROM gat_users WHERE id IN (SELECT user_id FROM gat_group_user WHERE group_id = 8);

SELECT * FROM gat_users WHERE id IN (SELECT user_id FROM gat_group_user WHERE group_id = 11);

SELECT * FROM gat_users WHERE id IN (SELECT user_id FROM gat_group_user WHERE group_id = 1);