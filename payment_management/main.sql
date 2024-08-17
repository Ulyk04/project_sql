SELECT 
    c.client_id,
    c.name,
    SUM(CAST(invoices.amount AS NUMERIC)) AS total_debt
FROM 
    clients c
JOIN 
    invoices ON c.client_id = invoices.client_id
LEFT JOIN 
    payments p ON invoices.invoice_id = p.invoice_id
WHERE 
    invoices.status <> 'Paid'
GROUP BY 
    c.client_id, c.name;
