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
INSERT INTO FAMPOSTS VALUES(6, '냠냠', '오늘은 비빔냉면', 'talkinsilence21@eoot.com', GETDATE(), 1, 0, 0, 0, 0, 0);

SELECT * FROM MEMBERS INNER JOIN FAMPOSTS ON MEMBERS."MID"=FAMPOSTS.WRITER ORDER BY FAMPOSTS.REGDATE DESC;

INSERT INTO VilPosts (Code, Sort, Title, Content, Writer, Regdate, Hit, LikeCnt, ClipCnt, CommentCnt)
VALUES (1, 1, '�̿��� �����մϴ�.', '�����̵��κ�', 'nami@eoot.com', getDate(), 0,0,0,0);

INSERT INTO VilPosts (Code, Sort, Title, Content, Writer, Regdate, Hit, LikeCnt, ClipCnt, CommentCnt)
VALUES (2, 1, 'title', 'content', 'nami@eoot.com', getDate(), 0,0,0,0);

INSERT INTO VilPosts (Code, Sort, Title, Content, Writer, Regdate, Hit, LikeCnt, ClipCnt, CommentCnt)
VALUES (3, 1, '������������', '���볻�볻��', 'nami@eoot.com', getDate(), 0,0,0,0);

INSERT INTO VilPosts
VALUES (1, 0, '�̿��������մϴ�.', '�����̵��κ�', '', getDate(), 0,0,0,0);

INSERT INTO VilPosts(code)
VALUES 1;
