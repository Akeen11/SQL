SELECT ArtistName, YearEstablished
FROM Artist
WHERE YearEstablished > 1970
AND YearEstablished < 2000
ORDER BY YearEstablished DESC
;

SELECT a.Title, 
	   a.AlbumLength, 
	   a.Label AS ArtistLabel, 
	   ar.ArtistName, 
	   ar.YearEstablished,
	   g.Label AS GenreLabel
FROM Album a
JOIN Artist ar ON a.ArtistId = ar.ArtistId
JOIN Genre g ON a.GenreId = g.GenreId
;

SELECT *
FROM Song s
JOIN Album al ON al.AlbumId = s.AlbumId
JOIN Artist ar ON ar.ArtistId = s.ArtistId
JOIN Genre g ON g.GenreId = s.GenreId
;

INSERT INTO Artist 
(ArtistName, YearEstablished)
VALUES
("U2",1976)
;

SELECT *
FROM Artist
;

DELETE FROM Artist WHERE ArtistId = 28
;

DELETE FROM Album WHERE AlbumId = 25
;

UPDATE Artist 
SET ArtistName = "U2"
Where ArtistId = 29
;

SELECT *
FROM Artist
;

SELECT *
FROM Album
;

SELECT *
FROM Song
;

INSERT INTO Artist 
(ArtistName, YearEstablished)
VALUES
("Chevelle",1995)
;

INSERT INTO Album 
(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES
("Wonder What's Next", "10/08/2002", 4610, "Epic Records", 30, 2)
;

INSERT INTO Song 
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES
("The Red", 358, "07/22/2002", 2, 30, 26)
;

INSERT INTO Song 
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES
("Send The Pain Below", 3413, "01/28/2003", 2, 30, 26)
;

INSERT INTO Song 
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES
("Closure", 412, "09/01/2003", 2, 30, 26)
;

UPDATE Song 
SET SongLength = "413"
Where SongId = 23
;

SELECT a.Title, 
	   s.Title,
	   ar.ArtistName
FROM Album a 
LEFT JOIN Song s ON s.AlbumId = a.AlbumId
LEFT JOIN Artist ar ON ar.ArtistId = s.ArtistId 
;

SELECT a.Title, 
	   s.Title,
	   ar.ArtistName 
FROM Song s 
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
LEFT JOIN Artist ar ON ar.ArtistId = s.ArtistId
;

SELECT a.Title, COUNT(s.SongId) AS SongCount
FROM Album a
Join Song s ON s.AlbumId = a.AlbumId
GROUP BY a.Title
ORDER BY SongCount DESC
--LIMIT 1
;

SELECT a.ArtistName, COUNT(s.SongId) AS SongCount
FROM Artist a
Join Song s ON s.ArtistId = a.ArtistId
GROUP BY a.ArtistName
ORDER BY SongCount DESC
--LIMIT 1
;

SELECT g.Label, COUNT(s.SongId) AS SongCount
FROM Genre g
Join Song s ON s.GenreId = g.GenreId
GROUP BY g.Label
ORDER BY SongCount DESC
--LIMIT 1
;

SELECT g.Label, COUNT(al.AlbumId) AS AlbumCount
FROM Genre g
Join Album al ON al.GenreId = g.GenreId
GROUP BY g.Label
ORDER BY AlbumCount DESC
--LIMIT 1
;

SELECT al.Title,
	   MAX(al.AlbumLength) AS LongestAlbum
FROM Album al
;

SELECT s.Title,
	   MAX(s.SongLength) AS LongestSong
FROM Song s
;

SELECT s.Title,
	   al.Title,
	   MAX(s.SongLength) AS LongestSong
FROM Song s
JOIN Album al ON al.AlbumId = s.AlbumId
;