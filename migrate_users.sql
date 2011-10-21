REPLACE wp_users
    ( ID, user_login, user_pass, user_nicename, user_email, user_url, user_registered, display_name)
SELECT
	UserID+1000,
	Username,
	`Password`,
	Username,
	Email,
  '',
  concat(FirstName,' ',LastName),
	DateCreated
FROM popstaronline.usr_user;
-- TODO
-- , , description, 
REPLACE wp_usermeta (user_id, meta_key, meta_value)
SELECT
	UserID+1000,
  'first_name',
	FirstName
FROM popstaronline.usr_user
UNION ALL
SELECT
	UserID+1000,
  'last_name',
	LastName
FROM popstaronline.usr_user
UNION ALL
SELECT
	UserID+1000,
  'nickname',
	Username
FROM popstaronline.usr_user
UNION ALL
SELECT
	UserID+1000,
  'rich_editing',
	'true'
FROM popstaronline.usr_user
UNION ALL
SELECT
	UserID+1000,
  'comment_shortcuts',
	'true'
FROM popstaronline.usr_user;
