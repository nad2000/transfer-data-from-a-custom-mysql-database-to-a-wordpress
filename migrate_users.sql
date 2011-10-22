REPLACE wp_users (
    ID, 
    user_login, 
    user_pass, 
    user_nicename, 
    user_email, 
    user_url, 
    user_registered, 
    display_name)
SELECT
	UserID+1000,
	Username,
	`Password`,
	Username,
	Email,
  '',
	DateCreated,
  concat(FirstName,' ',LastName)
FROM usr_user;
-- TODO
-- , , description, 
REPLACE wp_usermeta (user_id, meta_key, meta_value)
SELECT
	UserID+1000,
  'first_name',
	FirstName
FROM usr_user
UNION ALL
SELECT
	UserID+1000,
  'last_name',
	LastName
FROM usr_user
UNION ALL
SELECT
	UserID+1000,
  'nickname',
	Username
FROM usr_user
UNION ALL
SELECT
	UserID+1000,
  'rich_editing',
	'true'
FROM usr_user
UNION ALL
SELECT
	UserID+1000,
  'comment_shortcuts',
	'true'
FROM usr_user;

REPLACE wp_usermeta (user_id, meta_key, meta_value)
SELECT
	ID,
  'wp_capabilities',
	'a:1:{s:10:"subscriber";s:1:"1";}'
FROM wp_users WHERE ID > 999
UNION ALL
SELECT
	ID,
  'wp_user_level',
	0
FROM wp_users  WHERE ID > 999;
