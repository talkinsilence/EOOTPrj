select * from VILPOSTS;
select * from VilPostFiles;
select * from VilPostComments;
select * from FAMPOSTS;
select * from FAMPOSTCOMMENTS;
select * from FAMPOSTFILES;
select * from MEMBERS;
select * from LETTERS;
select * from ADMINS;
SELECT * FROM VilPosts WHERE CODE = 1;
select * from FamInvitations;



SELECT *
FROM (SELECT * FROM FAMPOSTS F ORDER BY F.REGDATE DESC)
FULL OUTER JOIN VILPOSTS V
ON F.WRITER = V.WRITER
ORDER BY REGDATE DESC;

insert into FamInvitations(askmid, acceptmid, askregdate,askmsg,state)
values('ddd@ddd.dd','cskn2@naver.com',getDate(),'드루dddd와',0);

select * from faminvitations where state = 0
SELECT * FROM FAMINVITATIONS WHERE ASKMID = 'viovio@eoot.com' AND STATE = 0;

SELECT * from (select * from faminvitations where state = 0) faminvitations
where acceptmid = 'cskn2@naver.com';


delete from members;
delete from neighbors;

SELECT V.*, VF.* FROM VilPosts V LEFT OUTER JOIN VilPostFiles VF ON VF.VilPostCode = V.CODE WHERE VF.VilPostCode = '1';

SELECT * FROM VilPostFiles WHERE VilPostCode = '1';

INSERT INTO VILPOSTFILES(CODE, SRC, VILPOSTCODE, TYPE)
VALUES(1, '../village/refimg/img00.jpg', 1, 1);

INSERT INTO VILPOSTCommentS(CODE, content, writer, VilPostCode, Regdate)
VALUES(1, '댓글댓글댓글', 'nami@eoot.com', 1, getDate());

INSERT INTO VILPOSTCommentS(CODE, content, writer, VilPostCode, Regdate)
VALUES(2, '댓글댓글댓글2번째', 'nami@eoot.com', 2, getDate());
INSERT INTO VILPOSTCommentS(CODE, content, writer, VilPostCode, Regdate)
VALUES(3, '댓글댓글댓글3번째', 'nami@eoot.com', 3, getDate());
INSERT INTO VILPOSTCommentS(CODE, content, writer, VilPostCode, Regdate)
VALUES(4, '댓글댓글댓글4번째', 'nami@eoot.com', 1, getDate());

SELECT * FROM (SELECT M.NAME, M.MID, M.PROFILEPIC, M.ADDRESS, V.* ,(ROW_NUMBER() OVER (ORDER BY V.REGDATE DESC)) NUM FROM MEMBERS M INNER JOIN VILPOSTS V ON M.MID=V.WRITER WHERE V.${field} LIKE '%${query}%') MJOINV WHERE MJOINV.NUM BETWEEN 1 AND 30;

UPDATE VilPOSTFILES SET SRC = '../village/refimg/img00.jpg' WHERE code=1;

INSERT INTO MEMBERS(MID, PWD, NAME, BIRTHDAY, PROFILEPIC, REGDATE, FAMCODE) 
VALUES('qq3', 'ddfd', 'dfasdf', '19910101', 'default.jpg', GETDATE(), 'tete');

INSERT INTO MEMBERS(FAMNAME) VALUES('뉴렉이네집') WHERE FAMCODE='viovio@eoot.com';

select * from members where Mid = 'ddd';

SELECT V.* FROM (SELECT (ROW_NUMBER() OVER (ORDER BY REGDATE DESC)) NUM , VilPosts.* FROM NOTICES WHERE #{field} LIKE '%${query}%') V WHERE ;

select * from letters;
select * from letterfiles;
INSERT INTO LETTERS VALUES('lettercode12', 'cskn2@naver.com', GETDATE(), '누나누나누나누나누나누나누나누나누나누나누나', '남영버그조심좀여남영버그조심좀여남영버그조심좀여남영버그조심좀여남영버그조심좀여남영버그조심좀여', 0, 'viovio@eoot.com', 0);
UPDATE LETTERS SET CONTENT='content' WHERE CONTENT='title';
UPDATE LETTERS SET "READ"=0;
DELETE LETTERS WHERE CODE = 'letterceode5';

SELECT * FROM FAMINVITATIONS F INNER JOIN MEMBERS M ON F.ASKMID = M.MID WHERE F.ACCEPTMID = 'viovio@eoot.com' AND state = 0;
SELECT * FROM FAMINVITATIONS F INNER JOIN MEMBERS M ON F.ASKMID = M.MID WHERE F.ASKMID = 'viovio@eoot.com' AND state = 0;

SELECT * FROM FAMINVITATIONS F INNER JOIN MEMBERS M ON F.ASKMID = M.MID WHERE F.ASKMID = 'viovio@eoot.com';
SELECT * FROM MEMBERS INNER JOIN FAMPOSTS ON MEMBERS."MID"=FAMPOSTS.WRITER ORDER BY FAMPOSTS.REGDATE DESC;
SELECT * FROM MEMBERS INNER JOIN LETTERS ON MEMBERS."MID"=LETTERS.READER ORDER BY LETTERS.SENDDATE DESC;
SELECT * FROM MEMBERS M INNER JOIN LETTERS L ON M."MID"=L.READER WHERE READER = 'viovio@eoot.com' ORDER BY L.SENDDATE DESC;
SELECT * FROM LETTERS L INNER JOIN MEMBERS M ON L.READER=M."MID" WHERE (L.READER = 'viovio@eoot.com') AND (L.TITLE LIKE '%mom%' OR L.CONTENT LIKE '%mom%') ORDER BY L.SENDDATE DESC;
SELECT * FROM LETTERS L INNER JOIN MEMBERS M ON L.WRITER=M."MID" WHERE (L.READER = 'viovio@eoot.com') AND (L.TITLE LIKE '%mom%' OR L.CONTENT LIKE '%mom%') ORDER BY L.SENDDATE DESC;
SELECT COUNT(*) CNT FROM LETTERS L INNER JOIN MEMBERS M ON L.READER=M."MID" WHERE (L.READER = 'viovio@eoot.com') AND (L."READ" = 0);
SELECT COUNT(*) CNT FROM LETTERS WHERE READER ='viovio@eoot.com';



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
         
SELECT  VilPosts.*, Members.*, VilPostFiles.*
FROM VilPosts INNER JOIN Members ON VilPosts.Writer = Members.Mid 
left outer JOIN VilPostFiles on VilPosts.code = VilPostfiles.vilpostcode;
         
CREATE VIEW VilPostView
AS
   SELECT  V.*, M.*, VF.*, VC.*
   FROM VilPosts V INNER JOIN Members M ON V.Writer = M.Mid 
    left outer JOIN VilPostFiles VF on V.code = VF.vilpostcode
    left outer JOIN vilpostcomments VC on V.code = VC.vilpostcode;

SELECT * FROM NOTICEVIEW130 WHERE TITLE LIKE~;         

SELECT * FROM MEMBERS WHERE FAMCODE = 'viovio@eoot.com' ORDER BY BIRTHDAY ASC; 
SELECT * (SELECT * FROM MEMBERS M2 WHERE NOT EXISTS M2.MID='viovio@eoot.com')FROM MEMBERS M1 WHERE FAMCODE = 'viovio@eoot.com' ORDER BY BIRTHDAY ASC;
               
SELECT  FamPosts.*,Members.*,fampostfiles.*,fampostcomments.*
FROM FamPosts INNER JOIN Members ON FamPosts.Writer = Members.Mid 
         left outer JOIN FamPostFiles on FamPosts.code = FamPostfiles.fampostcode
         left outer JOIN fampostcomments on famposts.code = fampostcomments.fampostcode;   

UPDATE FAMPOSTFILES SET src = 'images/kim3.jpg' WHERE code='11';

UPDATE MEMBERS SET PROFILEPIC = '/EOOTPrj/main/images/nami3.jpg' WHERE MID = 'talkinsilence21@gmail.com';


SELECT * FROM (SELECT * FROM MEMBERS WHERE MID <> 'viovio@eoot.com') MEMBERS WHERE FAMCODE = 'viovio@eoot.com' ORDER BY BIRTHDAY ASC;

SELECT * FROM MEMBERS INNER JOIN FAMPOSTS ON FAMPOSTS.WRITER=MEMBERS.MID ORDER BY FAMPOSTS.REGDATE DESC;


select * from information_schema.tables --테이블 목록보기

select * from fampostfiles;

INSERT INTO fampostfiles VALUES('3', 'images/bobby1.jpg', 5, 'jpg');

delete from fampostfiles where code = '3';

delete from fampostfiles where code = '4';

select * from fampostcomments;
select * from famposts;
select * from fampostfiles;

INSERT INTO fampostcomments VALUES('1', 'zzz', 'viovio@eoot.com','1', getdate());

INSERT INTO fampostcomments VALUES('2', 'xxx', 'nami@eoot.com','1', getdate());

INSERT INTO fampostcomments VALUES('3', 'xxx', 'nami@eoot.com','3', getdate());

INSERT INTO fampostfiles VALUES('12', 'images/suzy1.jpg','7', 'jpg',getdate());

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

SELECT M.NAME, M.PROFILEPIC, V.* ,(ROW_NUMBER() OVER (ORDER BY V.REGDATE DESC)) NUM FROM MEMBERS M INNER JOIN VILPOSTcomments V ON M.MID=V.WRITER;

SELECT * FROM FamPostfiles order by code desc;

SELECT * FROM FamPostfiles 

UPDATE FAMPOSTFILES SET regdate = getdate() WHERE code='6';

SELECT * FROM (SELECT M.NAME , F.* ,(ROW_NUMBER() OVER (ORDER BY F.REGDATE DESC)) NUM 
FROM MEMBERS M INNER JOIN FAMPOSTS F ON M.MID=F.WRITER WHERE F.title LIKE '%fam%') MJOINF WHERE MJOINF.NUM BETWEEN 1 AND 30


UPDATE famPOSTs SET clipcnt = '1' WHERE code=2;

SELECT * FROM FamPostfiles order by regdate asc

SELECT * FROM FamPosts

SELECT * FROM members
delete from fampost;

INSERT INTO fampostfiles VALUES('9', 'images/kim3.jpg','9', 'jpg',getdate());

SELECT f.hit, f.likecnt, f.commentcnt, f.clipcnt, fpf.*
FROM famposts f
left outer join fampostfiles fpf
on f.code = fpf.fampostcode

INSERT INTO famposts VALUES('9', 'kkk','kkkkkk', 'viovio@eoot.com',getdate(),'0','0','0','0','0','0','0');

SELECT F.*, M.NAME, M.PROFILEPIC, (ROW_NUMBER() OVER (ORDER BY F.REGDATE DESC)) NUM FROM FAMPOSTS F INNER JOIN MEMBERS M ON F.WRITER = M.MID WHERE F.CODE = '1';

SELECT FC.*, M.NAME, M.PROFILEPIC, (ROW_NUMBER() OVER (ORDER BY Fc.REGDATE DESC)) NUM FROM FAMPOSTCOMMENTS FC INNER JOIN MEMBERS M ON FC.WRITER = M.MID WHERE Fc.fampostCODE = '1';


SELECT F.*, M.NAME, M.PROFILEPIC, (ROW_NUMBER() OVER (ORDER BY F.REGDATE DESC)) NUM FROM FAMPOSTS F INNER JOIN MEMBERS M ON F.WRITER = M.MID WHERE F.CODE = 'code'











