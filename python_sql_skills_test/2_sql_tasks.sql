/*a.*/	
SELECT shop.name, SUM(coalesce(quantity, 0)) total_jap_qty FROM shop LEFT JOIN stock ON stock.shopID = shop.id
	WHERE markID IN (SELECT mark.id FROM mark	INNER JOIN manufacturer ON mark.manufacturerID = manufacturer.id WHERE manufacturer.country = 'JAP')
	GROUP BY shop.name
	ORDER BY total_jap_qty DESC;

/*b.*/	
SELECT mark.id, mark.name, mark.manufacturerID, manufacturer.name FROM mark LEFT JOIN stock ON stock.markID = mark.id 
	INNER JOIN manufacturer ON mark.manufacturerID = manufacturer.id
	WHERE stock.quantity IS NULL;

/*c.*/	
SELECT shop.name, manufacturer.name, mark.name, stock.quantity FROM mark LEFT JOIN stock ON stock.markID = mark.id 
	INNER JOIN manufacturer ON mark.manufacturerID = manufacturer.id
	INNER JOIN shop ON stock.shopID = shop.id;
