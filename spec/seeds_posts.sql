TRUNCATE TABLE posts, comments RESTART IDENTITY;

INSERT INTO posts (title, content) VALUES ('Baby Photos', '6 month baby pics');
INSERT INTO posts (title, content) VALUES ('Cat Pics', '2 year cat pics');

INSERT INTO comments (content, author, post_id) VALUES ('Great baby pics', 'Ray', '1');
INSERT INTO comments (content, author, post_id) VALUES ('Wow great baby', 'Jay', '1');
INSERT INTO comments (content, author, post_id) VALUES ('Wonderful cat pics', 'Jack', '2');