CREATE DATABASE book_db;

USE book_db;

CREATE TABLE author
(
    id     int AUTO_INCREMENT PRIMARY KEY,
    author varchar(50)
);
CREATE TABLE books
(
    id         int AUTO_INCREMENT PRIMARY KEY,
    author_id  int,
    title      varchar(50),
    word_count int,
    views      int,
        FOREIGN KEY (author_id) REFERENCES author (id)
);

INSERT INTO author(id, author)
    VALUES
        (1,'Maria Charlotte'),
        (2,'Juan Perez'),
        (3,'Gemma Alcocer')
;

INSERT INTO books(id, author_id, title, word_count, views)
    VALUES
        (1,1,'Best Paint Colors',814,14),
        (2,2,'Small Space Decorating Tips',1146,221),
        (3,1,'Hot Accessories',986,105),
        (4,1,'Mixing Textures',765,22),
        (5,1,'Homemade Art Hacks',1002,193),
        (6,3,'Refinishing Wood Floors',1571,7542)

