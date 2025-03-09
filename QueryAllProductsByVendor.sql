select distinct orders.Vendor, products.Description, products.Unit
from orders
left join products
on orders.ItemIDOrder = products.ItemID
order by Vendor