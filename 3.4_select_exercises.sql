use albums_db;

SELECT name FROM albums WHERE artist = 'Pink Floyd';
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
SELECT genre FROM albums WHERE name = 'Nevermind';
SELECT name FROM albums WHERE release_date < 2000 AND release_date > 1989;
SELECT name FROM albums WHERE sales < 20.0;
SELECT name FROM albums WHERE genre = 'Rock';
