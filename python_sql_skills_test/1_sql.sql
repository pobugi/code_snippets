SELECT manufacturer.name, query1.total_cars FROM manufacturer 
	INNER JOIN
		(SELECT manufacturerID, SUM(coalesce(quantity, 0)) total_cars FROM mark 
		LEFT JOIN stock ON stock.markID = mark.id
		GROUP BY manufacturerID
		ORDER BY total_cars DESC) query1
	ON manufacturer.id = query1.manufacturerID;

