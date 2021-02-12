SELECT pid FROM Catalog WHERE cost < 10;
SELECT pname FROM parts P, Catalog C WHERE P.pid = C.pid AND C.cost < 10;
SELECT address FROM Suppliers S, Parts P, Catalog C WHERE S.sid = C.sid AND C.pid = P.pid AND P.pname = 'Fire Hydrant Cap';
---SELECT address FROM Suppliers JOIN Catalog ON Catalog.sid = Suppliers.sid JOIN Parts ON Parts.pid = Catalog.pid AND Parts.pname = 'Fire Hydrant Cap'; another way
 SELECT sname FROM Suppliers JOIN Catalog ON Catalog.sid = Suppliers.sid JOIN Parts ON Parts.pid = Catalog.pi Parts.color = 'Green';
 SELECT sname,pname FROM Suppliers JOIN Catalog ON Catalog.sid = Suppliers.sid JOIN Parts ON Parts.pid = Catalog.pid;
