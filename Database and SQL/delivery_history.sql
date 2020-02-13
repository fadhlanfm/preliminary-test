SELECT order_detail.id, user.id, user.name, user.email, user.phone, order_detail.delivery_date, product.name, GROUP_CONCAT(category.name) categories, order_detail.quantity, user_location.address, (SELECT SUM(order_detail_a.quantity) WHERE order_detail.id = order_detail.id) AS progressive_sum
	FROM ku_order_detail order_detail 
    	JOIN ku_order_detail order_detail_a
        	ON order_detail.id = order_detail_a.id 
    	JOIN ku_user_location user_location
        	ON order_detail.user_location_id = user_location.id 
        JOIN ku_user user
        	ON user_location.user_id = user.id
        JOIN ku_user_status user_status
        	ON user.status = user_status.id
        JOIN ku_product product
        	ON order_detail.product_id = product.id
        JOIN ku_product_status product_status
        	ON product.status = product_status.id
        JOIN ku_product_category product_category
        	ON product_category.product_id = product.id
        JOIN ku_category category
        	ON product_category.category_id = category.id
        JOIN ku_order_detail_status order_detail_status
        	ON order_detail.status = order_detail_status.id
        JOIN ku_order orderr
        	ON order_detail.order_id = orderr.status
        JOIN ku_order_status order_status
        	ON orderr.status = order_status.id
     WHERE user_status.name = 'active' 
         AND product_status.name = 'active' 
         AND order_status.name = 'success' 
         AND order_detail_status.name = 'success'
         AND MONTH(order_detail.delivery_date) = 9
         AND MONTH(order_detail.delivery_date) = 2019
     GROUP BY order_detail.id
     ORDER BY order_detail.delivery_date, user.name