SELECT ('���: �������� �����');
-- ������ ������
SELECT * FROM ratings LIMIT 10;

-- ������ ������
SELECT userId, COUNT(*) FROM ratings GROUP BY 1 ORDER BY 2 DESC LIMIT 10;

-- 1.1. SELECT , LIMIT - ������� 10 ������� �� ������� ratings (��� ���� ���������� �������� �������� �� 10 �������, ���� �� ������� ����)
SELECT * FROM ratings LIMIT 10;

-- 1.2. WHERE, LIKE - ������� �� ������� links �� ������, � ������� imdbid ������������ �� "42", � ���� movieid ����� 100 � 1000
(
    SELECT *
    FROM links
    WHERE
    imdbid LIKE '%45'
    and movieid > '100'
    ) INTERSECT (
    SELECT *
    FROM links
    WHERE
    imdbid LIKE '%45'
    and movieid < '1000'
    )
    LIMIT 10;

-- 2.1. INNER JOIN ������� �� ������� links ��� imdbId, ������� ������� ������� 5
SELECT *
    FROM public.links
    INNER JOIN public.ratings
        ON links.movieid=ratings.movieid
    WHERE rating = '5'
LIMIT 10;

-- 3.1. COUNT() ��������� ����� ������� ��� ������
SELECT
    COUNT (movieid) as count
FROM ratings
WHERE rating IS null;

-- 3.2 GROUP BY, HAVING ������� top-10 �������������, � ������� ������� ������� ���� 3.5
SELECT
    DISTINCT userid,
    AVG (rating) AS avg_rating
FROM ratings
GROUP BY userid
HAVING AVG (rating) > 3.5
ORDER BY avg_rating DESC
LIMIT 10;

-- 4.1 ����������: ������� ����� 10 imbdId �� links � ������� ������� ������� ������ 3.5
WITH help_table
AS (
    SELECT *
    FROM links
    LEFT JOIN ratings
        ON links.movieid=ratings.movieid
)
SELECT
    imdbid,
    cast (AVG (rating) AS numeric (3, 2)) AS avg_rat
    FROM help_table
GROUP BY imdbid
HAVING
    AVG (rating) > 3.5
LIMIT 10;

SELECT
    imdbid,
    movieid
FROM
    links
WHERE
    movieid in (
SELECT movieid
FROM ratings
GROUP BY ratings.movieid
HAVING
    AVG (rating) > 3.5
)
LIMIT 10;

-- 4.2 Common Table Expressions: ��������� ������� ������� �� �������������, � ������� ����� 10 ������.
-- ����� ���������� ������� ������� �� ��� �������������, ������� ������ ��� ������� - �� ���� � ������ ������ ���� ���� �����.

WITH tmp_table
AS (
    SELECT
        userid,
        rating,
        COUNT (rating) as mentions
    FROM ratings
    GROUP BY userid, rating
    HAVING COUNT (rating) > 10
    )
SELECT
    CAST (AVG (rating) as numeric (3,2)) as avg_rating
FROM tmp_table;