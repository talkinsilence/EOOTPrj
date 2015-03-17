select * from VILPOSTS;
select * from FAMPOSTS;
select * from MEMBERS;
SELECT * FROM VilPosts WHERE CODE = 1;
delete from members;

INSERT INTO MEMBERS(MID, PWD, NAME, BIRTHDAY, PROFILEPIC, REGDATE, FAMCODE) 
VALUES('qq3', 'ddfd', 'dfasdf', '19910101', 'default.jpg', GETDATE(), 'tete');

select * from members where Mid = 'ddd';

SELECT V.* FROM (SELECT (ROW_NUMBER() OVER (ORDER BY REGDATE DESC)) NUM , VilPosts.* FROM NOTICES WHERE #{field} LIKE '%${query}%') V WHERE ;

select * from letters;
select * from letterfiles;

INSERT INTO LETTERS VALUES('letterceode5', 'nami@eoot.com', GETDATE(), 'adsfadsfadf', 'asdfasdfadf', 1, 'cskn2@naver.com', 0);
INSERT INTO FAMPOSTS VALUES(6, '�깲�깲', '�삤�뒛�� 鍮꾨퉼�깋硫�', 'talkinsilence21@eoot.com', GETDATE(), 1, 0, 0, 0, 0, 0);

SELECT * FROM MEMBERS INNER JOIN FAMPOSTS ON MEMBERS."MID"=FAMPOSTS.WRITER ORDER BY FAMPOSTS.REGDATE DESC;

INSERT INTO VilPosts (Code, Sort, Title, Content, Writer, Regdate, Hit, LikeCnt, ClipCnt, CommentCnt)
VALUES (1, 1, '占싱울옙占쏙옙 占쏙옙占쏙옙占쌌니댐옙.', '占쏙옙占쏙옙占싱듸옙載ο옙觀占�', 'nami@eoot.com', getDate(), 0,0,0,0);

INSERT INTO VilPosts (Code, Sort, Title, Content, Writer, Regdate, Hit, LikeCnt, ClipCnt, CommentCnt)
VALUES (2, 1, 'title', 'content', 'nami@eoot.com', getDate(), 0,0,0,0);

INSERT INTO VilPosts (Code, Sort, Title, Content, Writer, Regdate, Hit, LikeCnt, ClipCnt, CommentCnt)
VALUES (3, 1, '占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙', '占쏙옙占쎈내占쎈내占쏙옙', 'nami@eoot.com', getDate(), 0,0,0,0);

INSERT INTO VilPosts
VALUES (1, 0, '占싱울옙占쏙옙占쏙옙占쏙옙占쌌니댐옙.', '占쏙옙占쏙옙占싱듸옙載ο옙觀占�', '', getDate(), 0,0,0,0);

INSERT INTO VilPosts(code)
VALUES 1;

SELECT * FROM MEMBERS INNER JOIN FAMPOSTS ON FAMPOSTS.WRITER=MEMBERS.MID ORDER BY FAMPOSTS.REGDATE DESC;


select * from information_schema.tables --테이블 목록보기

select * from fampostfiles;

INSERT INTO fampostfiles VALUES('3', 'images/bobby1.jpg', 5, 'jpg');

delete from fampostfiles where code = '4';

select * from fampostcomments;
select * from famposts;
select * from fampostfiles;

INSERT INTO fampostcomments VALUES('1', 'zzz', 'viovio@eoot.com','1', getdate());

INSERT INTO fampostcomments VALUES('2', 'xxx', 'nami@eoot.com','1', getdate());

INSERT INTO fampostcomments VALUES('3', 'xxx', 'nami@eoot.com','3', getdate());

select * from members;

SELECT  FamPosts.* FROM FamPostComments INNER JOIN
               Members ON FamPostComments.Writer = Members.Mid RIGHT OUTER JOIN
               FamPosts ON Members.Mid = FamPosts.Writer AND FamPostComments.FamPostCode = FamPosts.Code LEFT OUTER JOIN
               FamPostFiles ON FamPosts.Code = FamPostFiles.FamPostCode;

SELECT  FamPosts.* FROM FamPostComments INNER JOIN Members ON FamPostComments.Writer = Members.Mid;
               
SELECT  FamPosts.*, Members.*, FamPostFiles.*, FamPostComments.*
FROM     FamPostComments INNER JOIN
               Members ON FamPostComments.Writer = Members.Mid RIGHT OUTER JOIN
               FamPosts ON Members.Mid = FamPosts.Writer AND FamPostComments.FamPostCode = FamPosts.Code LEFT OUTER JOIN
               FamPostFiles ON FamPosts.Code = FamPostFiles.FamPostCode

SELECT  Members.*, FamPosts.*, FamPostFiles.*, FamPostComments.*
FROM     FamPostComments INNER JOIN
               Members ON FamPostComments.Writer = Members.Mid RIGHT OUTER JOIN
               FamPosts ON Members.Mid = FamPosts.Writer AND FamPostComments.FamPostCode = FamPosts.Code LEFT OUTER JOIN
               FamPostFiles ON FamPosts.Code = FamPostFiles.FamPostCode
               
SELECT  FamPosts.*,Members.*
FROM     FamPosts INNER JOIN
               Members ON FamPost.Writer = Members.Mid RIGHT OUTER JOIN
               FamPosts ON Members.Mid = FamPosts.Writer AND FamPostComments.FamPostCode = FamPosts.Code LEFT OUTER JOIN
               FamPostFiles ON FamPosts.Code = FamPostFiles.FamPostCode
               
               
SELECT  FamPosts.*,Members.* 
FROM FamPosts INNER JOIN Members ON FamPosts.Writer = Members.Mid INNER JOIN FamPostFiles on          
               
SELECT  Members.*, FamPosts.*, FamPostFiles.*, FamPostComments.*
FROM     FamPostComments INNER JOIN
               FamPostFiles ON FamPostComments.Code = FamPostFiles.Code INNER JOIN
               FamPosts ON FamPostComments.FamPostCode = FamPosts.Code AND FamPostFiles.FamPostCode = FamPosts.Code INNER JOIN
               Members ON FamPostComments.Writer = Members.Mid AND FamPosts.Writer = Members.Mid              
               
SELECT  FamPosts.*, Members.*, FamPostFiles.*, FamPostComments.*
FROM     FamPostComments INNER JOIN
               Members ON FamPostComments.Writer = Members.Mid LEFT OUTER JOIN
               FamPosts ON Members.Mid = FamPosts.Writer AND FamPostComments.FamPostCode = FamPosts.Code RIGHT OUTER JOIN
               FamPostFiles ON FamPosts.Code = FamPostFiles.FamPostCode              
               
SELECT  FamPosts.*,Members.* 
FROM FamPosts INNER JOIN Members ON FamPosts.Writer = Members.Mid INNER JOIN FamPostFiles on FamPosts.code = FamPostfiles.fampostcode;             


SELECT  FamPosts.*, FamPostFiles.*, FamPostComments.*, Members.Name, Members.Address, Members.FamCode, Members.ProfilePic
FROM     FamPostFiles RIGHT OUTER JOIN
               Members INNER JOIN
               FamPosts ON Members.Mid = FamPosts.Writer LEFT OUTER JOIN
               FamPostComments ON FamPosts.Code = FamPostComments.FamPostCode ON FamPostFiles.FamPostCode = FamPosts.Code
