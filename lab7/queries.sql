SELECT COUNT(*) FROM part_nyc WHERE on_hand > 70;

SELECT SUM(count) FROM
(
SELECT COUNT(*) as count FROM part_nyc PN, color C WHERE PN.color = C.color_id AND C.color_name = 'Red'
UNION ALL
SELECT COUNT(*) as count FROM part_sfo PS, color C WHERE PS.color = C.color_id AND C.color_name = 'Red'
)a;

SELECT * FROM supplier S WHERE
(SELECT SUM(PN.on_hand) FROM part_nyc PN WHERE PN.supplier = S.supplier_id) >
(SELECT SUM(PS.on_hand) FROM part_sfo PS WHERE PS.supplier = S.supplier_id);

SELECT DISTINCT S.supplier_name FROM supplier S, part_nyc PN1 WHERE PN1.part_number IN
(SELECT PN.part_number FROM supplier S, part_nyc PN WHERE S.supplier_id = PN.supplier
EXCEPT
SELECT PS.part_number FROM supplier S, part_sfo PS WHERE S.supplier_id = PS.supplier);

UPDATE part_nyc
SET on_hand = on_hand -10
WHERE on_hand >= 10;

DELETE FROM part_nyc
WHERE on_hand < 30;
