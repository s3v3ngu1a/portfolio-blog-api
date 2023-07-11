-- Create Users
INSERT INTO user (username, user_email, user_id, user_secret, show_cred) VALUES ('user1', 'user1@email.com', 'user1_id', 'pbkdf2:sha256:50000$user1$your_hashed_password', 1);
INSERT INTO user (username, user_email, user_id, user_secret, show_cred) VALUES ('user2', 'user2@email.com', 'user2_id', 'pbkdf2:sha256:50000$user2$your_hashed_password', 1);
INSERT INTO user (username, user_email, user_id, user_secret, show_cred) VALUES ('user3', 'user3@email.com', 'user3_id', 'pbkdf2:sha256:50000$user3$your_hashed_password', 1);

-- Create Posts for each user
INSERT INTO post (title, body, author_id, created) VALUES ('Post 1 by User 1', 'Body of Post 1 by User 1', 1, '2023-07-11 00:00:00');
INSERT INTO post (title, body, author_id, created) VALUES ('Post 2 by User 1', 'Body of Post 2 by User 1', 1, '2023-07-11 00:00:00');
INSERT INTO post (title, body, author_id, created) VALUES ('Post 1 by User 2', 'Body of Post 1 by User 2', 2, '2023-07-11 00:00:00');
INSERT INTO post (title, body, author_id, created) VALUES ('Post 2 by User 2', 'Body of Post 2 by User 2', 2, '2023-07-11 00:00:00');
INSERT INTO post (title, body, author_id, created) VALUES ('Post 1 by User 3', 'Body of Post 1 by User 3', 3, '2023-07-11 00:00:00');
INSERT INTO post (title, body, author_id, created) VALUES ('Post 2 by User 3', 'Body of Post 2 by User 3', 3, '2023-07-11 00:00:00');

-- Create Comments for each post
INSERT INTO comments (post_id, author_id, body, created) VALUES (1, 1, 'Comment on Post 1 by User 1', '2023-07-11 00:00:00');
INSERT INTO comments (post_id, author_id, body, created) VALUES (2, 1, 'Comment on Post 2 by User 1', '2023-07-11 00:00:00');
INSERT INTO comments (post_id, author_id, body, created) VALUES (3, 2, 'Comment on Post 1 by User 2', '2023-07-11 00:00:00');
INSERT INTO comments (post_id, author_id, body, created) VALUES (4, 2, 'Comment on Post 2 by User 2', '2023-07-11 00:00:00');
INSERT INTO comments (post_id, author_id, body, created) VALUES (5, 3, 'Comment on Post 1 by User 3', '2023-07-11 00:00:00');
INSERT INTO comments (post_id, author_id, body, created) VALUES (6, 3, 'Comment on Post 2 by User 3', '2023-07-11 00:00:00');

-- Create Likes for each post
INSERT INTO likes (user_id, post_id) VALUES (1, 1);
INSERT INTO likes (user_id, post_id) VALUES (1, 2);
INSERT INTO likes (user_id, post_id) VALUES (1, 3);
INSERT INTO likes (user_id, post_id) VALUES (2, 4);
INSERT INTO likes (user_id, post_id) VALUES (2, 5);
INSERT INTO likes (user_id, post_id) VALUES (2, 6);
INSERT INTO likes (user_id, post_id) VALUES (3, 1);
INSERT INTO likes (user_id, post_id) VALUES (3, 2);
INSERT INTO likes (user_id, post_id) VALUES (3, 3);
