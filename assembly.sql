-- Active: 1682927233860@@162.105.146.37@43306@stu2000012965
CREATE TABLE Assembly(
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    part char(20),
    subpart char(20)
);

INSERT INTO
    Assembly
VALUES
    (1, 'trike', 'wheel'),
    (2, 'trike', 'frame'),
    (3, 'frame', 'seat'),
    (4, 'frame', 'pedal'),
    (5, 'wheel', 'spoke'),
    (6, 'wheel', 'tire'),
    (7, 'tire', 'rim'),
    (8, 'tire', 'tube');

SELECT
    *
FROM
    Assembly;

WITH recursive Components (part, subpart) AS (
    SELECT
        part,
        subpart
    FROM
        Assembly
    UNION
    ALL
    SELECT
        A.part,
        C.subpart
    FROM
        Assembly A,
        Components C
    WHERE
        A.subpart = C.part
)
SELECT
    *
FROM
    Components
WHERE
    part = ' trike ';

WITH RECURSIVE cte (part, subpart, LEVEL) AS (
    SELECT
        part,
        subpart,
        1
    FROM
        Assembly
    WHERE
        part = 'trike'
    UNION
    ALL
    SELECT
        a.part,
        a.subpart,
        cte.level + 1
    FROM
        Assembly a
        INNER JOIN cte ON a.part = cte.subpart
)
SELECT
    *
FROM
    cte;