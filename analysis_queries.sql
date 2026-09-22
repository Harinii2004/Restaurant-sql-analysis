	Use restaurant_db;

	-- 01. Item Sales Quantity and Revenue Analysis

	Select i.item_name,Sum(o.quantity) AS total_quantity
	,sum(i.item_price) AS total_price FROM items i JOIN orderitems o WHERE i.item_id=o.item_id
	group by i.item_name;

	-- 02. Order-wise Total Amount Analysis

	Select o.order_id as orderid,
	SUM(i.quantity * i.item_price) AS totalamount
	FROM orders o JOIN orderitems i on o.order_id=i.order_id
	GROUP BY orderid order by totalamount desc;

	-- 03. Maximum Item Price by Category

	select item_category,Max(item_price) as price FROM items group by item_category order by price desc;

	-- 04. Item Ingredient Cost Analysis

	select i.item_id,i.item_name,i.item_size, SUM(ing.ingredient_price* ii.quantity_required)  AS total_price
	from items i join itemingredients ii on i.item_id=ii.item_id join ingredients ing on ii.ingredient_id=ing.ingredient_id
	group by i.item_id,i.item_name,i.item_size;

	-- 05. Top 5 Best-Selling Items

	select i.item_name,SUM(o.quantity*o.item_price) AS price  FROM items i join orderitems o on i.item_id=o.item_id GROUP by item_name order by price desc limit 5 ;

	-- 06. Recent Order Item Count Analysis

	select o.order_id,Count(o.order_item_id) AS quantity
	FROM orderitems o join orders i on o.order_id=i.order_id WHERE i.placement_date >= "2024-08-01"-interval 30 day
	GROUP BY o.order_id;

	-- 07. Unordered Items Analysis

	select i.item_id,i.item_name From items i Left join orderitems o on i.item_id=o.item_id where o.item_id is null;

	-- 08. Frequently Used Ingredients Analysis

	SELECT ing.ingredient_id,ing.ingredient_name,count(*) FROM ingredients ing join itemingredients ii on ing.ingredient_id=ii.ingredient_id
	group by ing.ingredient_id,ing.ingredient_name Having count(*)>3;

	-- 09. Average Item Price by Category

	SELECT item_category,Round(avg(item_price),2) AS avg FROM items group by item_category;

	-- 10. Low Inventory Item Analysis

	select i.item_id,i.item_name,sum(n.quantity) as qty FROM items i left join  inventory n on i.item_id=n.item_id GROUP by i.item_id,i.item_name Having
	sum(n.quantity)<100 ;