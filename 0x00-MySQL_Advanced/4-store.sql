-- creates a trigger that decreases the quantity of an item
-- 555555555555
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

