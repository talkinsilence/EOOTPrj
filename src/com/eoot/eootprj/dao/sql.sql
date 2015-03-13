select * from VILPOSTS;
select * from MEMBERS;
SELECT * FROM VilPosts WHERE CODE = 1;
delete from members;

INSERT INTO MEMBERS(MID, PWD, NAME, BIRTHDAY, REGDATE, FAMCODE) VALUES('ddddd', 'ddfd', 'dfasdf', '19910101', GETDATE(), 'tete');

select * from members where Mid = 'ddd';



select * from letters;
select * from letterfiles;

INSERT INTO LETTERS VALUES('letterceode5', 'nami@eoot.com', GETDATE(), 'adsfadsfadf', 'asdfasdfadf', 1, 'cskn2@naver.com', 0);



INSERT INTO VilPosts (Code, Sort, Title, Content, Writer, Regdate, Hit, LikeCnt, ClipCnt, CommentCnt)
VALUES (1, 1, '이웃을 응원합니다.', '내용이들어갈부분', 'nami@eoot.com', getDate(), 0,0,0,0);

INSERT INTO VilPosts (Code, Sort, Title, Content, Writer, Regdate, Hit, LikeCnt, ClipCnt, CommentCnt)
VALUES (2, 1, 'title', 'content', 'nami@eoot.com', getDate(), 0,0,0,0);

INSERT INTO VilPosts (Code, Sort, Title, Content, Writer, Regdate, Hit, LikeCnt, ClipCnt, CommentCnt)
VALUES (3, 1, '제목제목제목', '내용내용내용', 'nami@eoot.com', getDate(), 0,0,0,0);

INSERT INTO VilPosts
VALUES (1, 0, '이웃을응원합니다.', '내용이들어갈부분', '', getDate(), 0,0,0,0);

INSERT INTO VilPosts(code)
VALUES 1;