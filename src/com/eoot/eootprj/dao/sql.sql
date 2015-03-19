select * from VILPOSTS;
select * from FAMPOSTS;
select * from FAMPOSTCOMMENTS;
select * from FAMPOSTFILES;
select * from MEMBERS;
select * from LETTERS;
select * from ADMINS;
SELECT * FROM VilPosts WHERE CODE = 1;

INSERT INTO MEMBERS(MID, PWD, NAME, BIRTHDAY, PROFILEPIC, REGDATE, FAMCODE) 
VALUES('qq3', 'ddfd', 'dfasdf', '19910101', 'default.jpg', GETDATE(), 'tete');

INSERT INTO MEMBERS(FAMNAME) VALUES('뉴렉이네집') WHERE FAMCODE='viovio@eoot.com';

select * from members where Mid = 'ddd';

SELECT V.* FROM (SELECT (ROW_NUMBER() OVER (ORDER BY REGDATE DESC)) NUM , VilPosts.* FROM NOTICES WHERE #{field} LIKE '%${query}%') V WHERE ;

select * from letters;
select * from letterfiles;
INSERT INTO LETTERS VALUES('lettercode12', 'cskn2@naver.com', GETDATE(), '누나누나누나누나누나누나누나누나누나누나누나', '남영버그조심좀여남영버그조심좀여남영버그조심좀여남영버그조심좀여남영버그조심좀여남영버그조심좀여', 0, 'viovio@eoot.com', 0);
UPDATE LETTERS SET CONTENT='content' WHERE CONTENT='title';

SELECT * FROM MEMBERS INNER JOIN FAMPOSTS ON MEMBERS."MID"=FAMPOSTS.WRITER ORDER BY FAMPOSTS.REGDATE DESC;
SELECT * FROM MEMBERS INNER JOIN LETTERS ON MEMBERS."MID"=LETTERS.READER ORDER BY LETTERS.SENDDATE DESC;
SELECT * FROM MEMBERS M INNER JOIN LETTERS L ON M."MID"=L.READER WHERE READER = 'viovio@eoot.com' ORDER BY L.SENDDATE DESC;
SELECT * FROM LETTERS L INNER JOIN MEMBERS M ON L.READER=M."MID" WHERE (L.READER = 'viovio@eoot.com') AND (L.TITLE LIKE '%mom%' OR L.CONTENT LIKE '%mom%') ORDER BY L.SENDDATE DESC;
SELECT * FROM LETTERS L INNER JOIN MEMBERS M ON L.WRITER=M."MID" WHERE (L.READER = 'viovio@eoot.com') AND (L.TITLE LIKE '%mom%' OR L.CONTENT LIKE '%mom%') ORDER BY L.SENDDATE DESC;;

SELECT COUNT(*) CNT FROM LETTERS WHERE READER ='viovio@eoot.com';

INSERT INTO VilPosts (Code, Sort, Title, Content, Writer, Regdate, Hit, LikeCnt, ClipCnt, CommentCnt)
VALUES (2, 1, 'title', 'content', 'nami@eoot.com', getDate(), 0,0,0,0);


INSERT INTO VilPosts(code)
VALUES 1;

SELECT * FROM MEMBERS WHERE FAMCODE = 'viovio@eoot.com' ORDER BY BIRTHDAY ASC; 
SELECT * (SELECT * FROM MEMBERS M2 WHERE NOT EXISTS M2.MID='viovio@eoot.com')FROM MEMBERS M1 WHERE FAMCODE = 'viovio@eoot.com' ORDER BY BIRTHDAY ASC;
               
SELECT  FamPosts.*,Members.*,fampostfiles.*,fampostcomments.*
FROM FamPosts INNER JOIN Members ON FamPosts.Writer = Members.Mid 
         left outer JOIN FamPostFiles on FamPosts.code = FamPostfiles.fampostcode
         left outer JOIN fampostcomments on famposts.code = fampostcomments.fampostcode;
         
         
         
         
         
         
         
=======

UPDATE MEMBERS SET PROFILEPIC = '/EOOTPrj/main/images/nami3.jpg' WHERE MID = 'talkinsilence21@gmail.com';
SELECT * FROM (SELECT * FROM MEMBERS WHERE MID <> 'viovio@eoot.com') MEMBERS WHERE FAMCODE = 'viovio@eoot.com' ORDER BY BIRTHDAY ASC;


<<<<<<< HEAD
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


create view fampostview
as
SELECT  F.regdate as Fr, M.regdate as Mr, FF.regdate as FFr, FC.regdate as FCr
FROM FamPosts F INNER JOIN Members M ON F.Writer = M.Mid
         left outer JOIN FamPostFiles FF on F.code = FF.fampostcode
         left outer JOIN fampostcomments FC on F.code = FC.fampostcode;
         
         
SELECT * FROM (SELECT M.NAME , F.* ,(ROW_NUMBER() OVER (ORDER BY F.REGDATE DESC)) NUM FROM MEMBERS M INNER JOIN FAMPOSTS F ON M.MID=F.WRITER WHERE F.title LIKE '%fam%') MJOINF WHERE MJOINF.NUM BETWEEN 1 AND 30
