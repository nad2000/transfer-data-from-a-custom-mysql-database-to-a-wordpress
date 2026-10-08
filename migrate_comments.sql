REPLACE wp_comments(
	comment_ID,
	comment_post_ID,
	user_id,
	comment_author,
	comment_author_email,
	-- comment_author_url,
	comment_author_IP,
	comment_date,
	comment_date_gmt,
	comment_content,
	comment_karma,
	comment_approved,
	comment_agent,
	-- comment_type,
	comment_parent )
SELECT
	c.CommentID+1000,
	c.EntryID+IF( c.EntryID < 3127, 2000, 3500),
	c.UserID+IF( c.UserID < 222963, 1000, 1001),
	u.Username,
	u.Email,
	c.IP,
	c.DateEntered,
	c.DateEntered,
	c.Message,
	0,
	c.Enabled,
	'MIGRATION',
	0
FROM mba_comment AS c JOIN usr_user AS u
	ON u.UserId = c.UserId
WHERE c.Status='Active';

UPDATE wp_posts AS p JOIN 
( SELECT 
	comment_post_id,
  COUNT(*) AS comment_count
FROM wp_comments
GROUP BY comment_post_id ) cc ON cc.comment_post_id = p.ID
SET p.comment_count = cc.comment_count;
