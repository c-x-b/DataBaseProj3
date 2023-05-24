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

WITH recursive Components (part, subpart, LEVEL) AS (
    SELECT
        part,
        subpart,
        1
    FROM
        Assembly
    UNION
    ALL
    SELECT
        A.part,
        C.subpart,
        C.level + 1
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
    part = 'trike';

DELIMITER $ $ CREATE PROCEDURE buildTree(IN root char(20), OUT tree json) BEGIN DECLARE subpart_ CHAR(20) DEFAULT NULL;

DECLARE subTree JSON DEFAULT NULL;

SELECT
    subpart
FROM
    `Assembly`
WHERE
    part = root INTO subpart_;

IF subpart_ IS NULL THEN
SET
    tree = subTree;

ELSE CALL calctotal(subpart_, subTree);

SET
    tree = JSON_ARRAY (root, subTree)
END IF;

END $ $ DELIMITER;