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
