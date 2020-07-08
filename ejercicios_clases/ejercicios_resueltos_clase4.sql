-- otra herramienta para ejecutar sql online https://www.sqlitetutorial.net/tryit/
-- MODLEO RELACIONAL DEL EJEMPLO: https://cdn.sqlitetutorial.net/wp-content/uploads/2018/03/sqlite-sample-database-diagram-color.pdf
--EJERCICIO 1
SELECT tracks.Name
FROM tracks
inner join albums ON albums.AlbumId = tracks.AlbumId
INNER JOIN  artists ON albums.ArtistId = artists.ArtistId
where artists.Name = 'Iron Maiden' 

--EJERCICIO 2 Discos con más de 25 canciones
SELECT Name from albums
inner join tracks on tracks.albumid = albums.albumid
where (SELECT TrackId, count(TrackId) AS cant from tracks
GROUP BY Albumid
HAVING cant =25
ORDER BY cant desc)

-- revisar
SELECT TrackId, count(TrackId) AS cant from tracks
GROUP BY Albumid
HAVING cant =25
ORDER BY cant desc
       
       
--Ejercicio 3 Las 10 canciones más populares

-- de otro compañero
Canciones de Iron Maiden
select tr.*
from tracks tr,
albums al,
artists art
where tr.AlbumId = al.AlbumId
and al.ArtistId = art.ArtistId
and art.name = 'Iron Maiden';
--Discos con mas de 25 canciones
select al.Title,
count(tr.Name) as tot
from albums al,
tracks tr
where al.AlbumId = tr.AlbumId
group by al.Title
having tot >= 25
order by tot desc
--10 canciones mas populares
select tr.Name,
count(tr.TrackId)
from tracks tr,
playlist_track pt
where tr.TrackId = pt.TrackId
group by tr.Name
order by count(tr.TrackId) desc
Limit 10;
 