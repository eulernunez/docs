SELECT * FROM acc_groups;
SELECT * FROM acc_group_user WHERE user_id = 1100013078;

-- 1100013101 milda.gjini NR										NR
-- 1100013097 nikolaos.tsigkas IIL, RW, RR, NR, NW   		NW
-- 1100013078 peter.francis LLA, AR, NA, RR					NA

-- 1100013096 suela.dauti@tap-ag.com IIL

-- 1100013097 nikolaos.tsigkas IIL, RW, RR, NR, NW   		RW
-- 1100013087 alfred.memocela@tap-ag.com                 RR
-- 1100013096 suela.dauti@tap-ag.com

-- SELECT * FROM acc_users;

-- UPDATE acc_users SET `password` = '220466675e31b9d20c051d5e57974150'


-- 23 x 1100013045


-- Notification Writer
SELECT * FROM acc_users WHERE id IN (SELECT user_id FROM acc_group_user WHERE group_id = 1000000201);
 
-- Notification Reviewer
SELECT * FROM acc_users WHERE id IN (SELECT user_id FROM acc_group_user WHERE group_id = 1000000203);
 
-- Notification Approver
SELECT * FROM acc_users WHERE id IN (SELECT user_id FROM acc_group_user WHERE group_id = 1000000204);

-- Investigation Lead
SELECT * FROM acc_users WHERE id IN (SELECT user_id FROM acc_group_user WHERE group_id = 1000000208);

-- Report Writer
SELECT * FROM acc_users WHERE id IN (SELECT user_id FROM acc_group_user WHERE group_id = 1000000202);

-- Reviewer Report
SELECT * FROM acc_users WHERE id IN (SELECT user_id FROM acc_group_user WHERE group_id = 1000000206);

-- Approver Report
SELECT * FROM acc_users WHERE id IN (SELECT user_id FROM acc_group_user WHERE group_id = 1000000207);

-- LL Writer
-- SELECT * FROM acc_users WHERE id IN (SELECT user_id FROM acc_group_user WHERE group_id = 1000000209);

-- LL Approver
-- SELECT * FROM acc_users WHERE id IN (SELECT user_id FROM acc_group_user WHERE group_id = 1000000210);

