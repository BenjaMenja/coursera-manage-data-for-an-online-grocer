select o.PurchaseDate, format(o.quantity*o.cost, 2) as Amount, p.Description, p.Unit
from orders o
inner join products p
on o.ItemIDOrder = p.ItemID
