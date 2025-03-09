select p.ItemID, p.Description, p.Unit, s1.price
from products p
inner join sales s1
on p.ItemID = s1.ItemIDSale
where s1.SellDate = (
	select MAX(s2.SellDate)
    from sales s2
    where s2.ItemIDSale = s1.ItemIDSale
)
group by p.ItemID, s1.price
order by s1.price