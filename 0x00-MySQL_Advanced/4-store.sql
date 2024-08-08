--SQL script that creates a trigger that decreases
--the quantity of an item after adding a new order.


DELIMITER $$
CREATE TRIGGER decrease_items
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE qnt INT;

    SELECT NEW.number INTO qnt;

    UPDATE items SET quantity = quantity - qnt 
    WHERE name = NEW.item_name;

END$$

DELIMITER ;
