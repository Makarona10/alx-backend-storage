--script that ranks country origins of bands
--ordered by the number of (non-unique) fans

mysqldump holberton > metal_bands.sql

SELECT DISTINCT origin,
(SELECT SUM(fans) FROM metal_bands m WHERE metal_bands.origin = m.origin)
AS nb_fans FROM metal_bands ORDER BY nb_fans DESC;
