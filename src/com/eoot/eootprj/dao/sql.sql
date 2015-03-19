select * from VILPOSTS;
select * from VilPostFiles;
select * from VilPostComments;
select * from FAMPOSTS;
select * from MEMBERS;
SELECT * FROM VilPosts WHERE CODE = 1;
delete from members;

INSERT INTO VILPOSTFILES(CODE, SRC, VILPOSTCODE, TYPE)
VALUES(1, '../village/refimg/img00.jpg', 1, 1);

INSERT INTO MEMBERS(MID, PWD, NAME, BIRTHDAY, PROFILEPIC, REGDATE, FAMCODE) 
VALUES('qq3', 'ddfd', 'dfasdf', '19910101', 'default.jpg', GETDATE(), 'tete');

select * from members where Mid = 'ddd';

SELECT V.* FROM (SELECT (ROW_NUMBER() OVER (ORDER BY REGDATE DESC)) NUM , VilPosts.* FROM NOTICES WHERE #{field} LIKE '%${query}%') V WHERE ;

select * from letters;
select * from letterfiles;

INSERT INTO LETTERS VALUES('letterceode5', 'nami@eoot.com', GETDATE(), 'adsfadsfadf', 'asdfasdfadf', 1, 'cskn2@naver.com', 0);

SELECT * FROM MEMBERS INNER JOIN FAMPOSTS ON MEMBERS."MID"=FAMPOSTS.WRITER ORDER BY FAMPOSTS.REGDATE DESC;

INSERT INTO VilPosts (Code, Sort, Title, Content, Writer, Regdate, Hit, LikeCnt, ClipCnt, CommentCnt)
VALUES (2, 1, 'title', 'content', 'nami@eoot.com', getDate(), 0,0,0,0);

INSERT INTO VilPosts(code)
VALUES 1;

SELECT * FROM information_schema.tables -- 테이블 목록 보기욤

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name=table2.column_name;
 
SELECT VilPosts.*, Members.*
FROM VilPosts
INNER JOIN Members
ON Members.Mid = VilPosts.writer;

SELECT  VilPosts.*, Members.*, VilPostFiles.*, VilPostComments.*
FROM VilPosts INNER JOIN Members ON VilPosts.Writer = Members.Mid 
         left outer JOIN VilPostFiles on VilPosts.code = VilPostfiles.vilpostcode
         left outer JOIN vilpostcomments on vilposts.code = vilpostcomments.vilpostcode;
         
CREATE VIEW VilPostView
AS
	SELECT  V.*, M.*, VF.*, VC.*
	FROM VilPosts V INNER JOIN Members M ON V.Writer = M.Mid 
    left outer JOIN VilPostFiles VF on V.code = VF.vilpostcode
    left outer JOIN vilpostcomments VC on V.code = VC.vilpostcode;

SELECT * FROM NOTICEVIEW130 WHERE TITLE LIKE~;         