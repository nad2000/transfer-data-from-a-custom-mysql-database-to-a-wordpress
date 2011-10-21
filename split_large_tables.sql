CREATE TABLE mba_comment_0 AS SELECT * FROM mba_comment WHERE CommentID % 6 = 0;
CREATE TABLE mba_comment_1 AS SELECT * FROM mba_comment WHERE CommentID % 6 = 1;
CREATE TABLE mba_comment_2 AS SELECT * FROM mba_comment WHERE CommentID % 6 = 2;
CREATE TABLE mba_comment_3 AS SELECT * FROM mba_comment WHERE CommentID % 6 = 3;
CREATE TABLE mba_comment_4 AS SELECT * FROM mba_comment WHERE CommentID % 6 = 4;
CREATE TABLE mba_comment_5 AS SELECT * FROM mba_comment WHERE CommentID % 6 = 5;

CREATE TABLE usr_user_0 AS SELECT * FROM usr_user WHERE UserID % 2 = 0;
CREATE TABLE usr_user_1 AS SELECT * FROM usr_user WHERE UserID % 2 = 1;
