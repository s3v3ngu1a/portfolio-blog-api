DROP TABLE IF EXISTS user;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  user_email TEXT UNIQUE NOT NULL,
  user_id TEXT UNIQUE NOT NULL,
  user_secret TEXT UNIQUE NOT NULL,
  show_cred INTEGER NOT NULL DEFAULT 1 CHECK(show_cred IN (0, 1))
);

DROP TABLE IF EXISTS post;

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);

DROP TABLE IF EXISTS comments;

CREATE TABLE comments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  post_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  body TEXT NOT NULL,
  FOREIGN KEY (post_id) REFERENCES post (id),
  FOREIGN KEY (author_id) REFERENCES user (id)
);

DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL
);

DROP TABLE IF EXISTS post_categories;

CREATE TABLE post_categories (
  post_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  PRIMARY KEY (post_id, category_id),
  FOREIGN KEY (post_id) REFERENCES post (id),
  FOREIGN KEY (category_id) REFERENCES categories (id)
);

DROP TABLE IF EXISTS user_profile;

CREATE TABLE user_profile (
  user_id INTEGER PRIMARY KEY,
  fullname TEXT,
  bio TEXT,
  website TEXT,
  FOREIGN KEY (user_id) REFERENCES user (id)
);

DROP TABLE IF EXISTS likes;

CREATE TABLE likes (
  user_id INTEGER NOT NULL,
  post_id INTEGER NOT NULL,
  PRIMARY KEY (user_id, post_id),
  FOREIGN KEY (user_id) REFERENCES user (id),
  FOREIGN KEY (post_id) REFERENCES post (id)
);