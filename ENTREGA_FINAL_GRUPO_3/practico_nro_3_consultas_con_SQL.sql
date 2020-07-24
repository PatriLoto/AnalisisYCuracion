--EJERCICIO 1: Canciones de Iron Maiden
SELECT tracks.Name
FROM tracks
inner join albums ON albums.AlbumId = tracks.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
where artists.Name = 'Iron Maiden'
 
--EJERCICIO 2: Discos con más de 25 canciones
SELECT Al.Title, COUNT(Tr.Name) as Total from albums Al, tracks Tr
where  Al.AlbumId = Tr.AlbumId 
GROUP BY Al.AlbumId
HAVING Total > 25
ORDER BY Total 

--EJERCICIO 3: Las 10 canciones más populares
select Tr.Name, count(Pl.trackid) as Cantidad from tracks Tr, playlist_track Pl
where Tr.TrackId = Pl.TrackId
GROUP By Tr.Name
ORDER by  Cantidad DESC
LIMIT 10






