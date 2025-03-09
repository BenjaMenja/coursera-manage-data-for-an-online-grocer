select sales.SellDate, SUM(sales.price*sales.quantity) as TotalSales
from sales
group by SellDate