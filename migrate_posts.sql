REPLACE INTO wp_posts(
    ID, post_author, post_date, post_date_gmt, post_content, post_title,
    post_status, comment_status, ping_status, 
    post_name, post_excerpt,
    post_modified, post_modified_gmt,
    -- post_content_filtered,
    post_parent, post_type, menu_order, post_mime_type -- ,
    -- guid,
    -- comment_count
    ,to_ping, pinged, post_content_filtered
)
SELECT
	EntryID+IF(EntryID < 3127, 2000, 3500),	
  UserID+IF( UserID< 222963, 1000, 1001),
  DateEntered, DateEntered, Message, Title,
  'publish', 'open', 'open',
	lower(replace(WebTitle, '_','-')), Preview,
	DateLive, DateLive,
  0, 'post', 0, 'text/html',
  '','',''
FROM mba_entry
WHERE NOT (`Status`='Deleted' OR Enabled=0);