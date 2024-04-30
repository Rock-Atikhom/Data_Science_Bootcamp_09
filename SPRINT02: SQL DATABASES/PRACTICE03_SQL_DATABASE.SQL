-- Join Clause

SELECT
	firstname, 
    lastname, 
    country
FROM customers as c
inner join invoices as i
ON c.CustomerId = i.InvoiceId;

-- Join Clause

SELECT
	customerid,
    sum(total),
 from invoices
 join customers
 on customers.CustomerId = invoices.InvoiceId
 group by 1 orderby 2 desc;

-- Join Clause

select 
	customerid,
    sum(total),
	case when sum(total) >= 40 then 'high'
	else 'low'
end as segment
from invoices
group by 1;
