SELECT items.item_id , items.item_name,items.description , 
COALESCE(SUM(shipments.quantity_received) , 0) - COALESCE(SUM(outgoing_shipments.quantity) , 0) AS stock_balance,
items.location
FROM items
LEFT JOIN shipments ON items.item_id = shipments.item_id
LEFT JOIN outgoing_shipments ON items.item_id = outgoing_shipments.outgoing_id
GROUP BY items.item_id , items.item_name , items.description , items.location  