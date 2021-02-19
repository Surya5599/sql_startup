SELECT sname, count(*) FROM Suppliers JOIN Catalog ON Catalog.sid = Suppliers.sid JOIN Parts ON Parts.pid = Catalog.pid GROUP by sname;

SELECT sname, count(*) as "num of parts" FROM Suppliers JOIN Catalog ON Catalog.sid = Suppliers.sid JOIN Parts ON Parts.pid = Catalog.pid GROUP by sname HAVING count(*) >= 3;

SELECT sname, count(*) FROM Suppliers JOIN Catalog ON Catalog.sid = Suppliers.sid JOIN Parts ON Parts.pid = Catalog.pid WHERE sname = ALL (SELECT sname FROM Suppliers WHERE sid = ALL (SELECT sid FROM Catalog WHERE pid = ALL (SELECT pid FROM PARTS where color = 'Green'))) GROUP by sname;

SELECT sname,max FROM Suppliers JOIN (SELECT sid,Max(cost) From Catalog WHERE sid = ANY (SELECT C.sid From Catalog C, Parts P WHERE C.pid = P.pid and P.color = 'Red' INTERSECT SELECT C1.sid FROM Catalog C1, Parts P1 WHERE C1.pid = P1.pid AND P1.color = 'Green') GROUP BY sid) AS foo ON Suppliers.sid = foo.sid;
