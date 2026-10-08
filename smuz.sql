-- CREATE DATABASE wordpress;

-- SELECT * FROM `popstaronline`.`tps_page_2010_03_10`;
SHOW TABLE STATUS IN popstaronline;

SELECT SUM(DATA_LENGTH_MB) from (
select
    TABLE_NAME,
    (DATA_LENGTH/1024/1024) AS DATA_LENGTH_MB
from INFORMATION_SCHEMA.TABLES
where table_schema='popstaronline' 
    AND TABLE_NAME NOT LIKE 'tps_page%'
ORDER BY 2 DESC) AS t;

-- 9284 MB
-- 2258 MB

select
    TABLE_NAME,
    ROUND( (DATA_LENGTH/1024/1024), 0) AS DATA_LENGTH_MB
from INFORMATION_SCHEMA.TABLES
where table_schema='popstaronline' 
    AND TABLE_NAME NOT LIKE 'tps_page%'
    AND ROUND( (DATA_LENGTH/1024/1024), 0) > 0
ORDER BY 2 DESC;

select * from mba_comment limit 600;
select * from usr_user limit 600;
select * from tps_report limit 600;
select length('6fab034efe82b1aa05a07d3cb6bbd6cc'),length(md5('6fab034efe82b1aa05a07d3cb6bbd6cc'));


SELECT * FROM `wordpress`.`wp_users`;
select length('$P$Be88.JdrYfuZoBhIwa8phG/qYEmgZm/'), length(md5('xxx')), md5('xxx');
UPDATE wordpress.wp_users SET user_pass = MD5('xxx123') WHERE user_login='admin' LIMIT 1;
UPDATE wordpress.wp_users SET user_pass = '$P$Be88.JdrYfuZoBhIwa8phG/qYEmgZm/' WHERE user_login='admin' LIMIT 1;

-- SELECT * FROM `popstaronline.usr_user;

select concat('DROP TABLE IF EXISTS ',TABLE_NAME,' CASCADE;')
from INFORMATION_SCHEMA.TABLES
where table_schema='popstaronline' 
    AND ( TABLE_NAME LIKE 'tps_page%' OR TABLE_ROWS=0 );