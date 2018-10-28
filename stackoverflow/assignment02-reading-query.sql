SELECT 
	C.CategoryName, COUNT(P.CategoryID)
FROM 
	Shippers AS S
INNER JOIN 
	Orders AS O ON O.ShipperID = S.ShipperID
INNER JOIN 
	OrderDetails AS OD ON OD.OrderID = O.OrderID 
INNER JOIN 
	Products AS P ON P.ProductID = OD.ProductID
INNER JOIN 
	Categories AS C ON C.CategoryID = P.CategoryID
WHERE S.ShipperName LIKE 'Speedy Express'

GROUP BY P.CategoryID

ORDER BY COUNT(P.CategoryID) DESC;