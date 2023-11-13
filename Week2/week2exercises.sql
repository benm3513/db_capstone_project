-- Task 1

VIEW `ordersview` AS
    SELECT 
        `orders`.`OrderId` AS `OrderID`,
        `orders`.`OrderQuantity` AS `OrderQuantity`,
        `orders`.`TotalCost` AS `TotalCost`
    FROM
        `orders`
    WHERE
        (`orders`.`OrderQuantity` > 2)
        
-- Task 2
        
SELECT C.CustomerID, C.CustomerName, 
       O.OrderID, O.TotalCost, M.MenuName, MI.CourseName
FROM Customers AS C
INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
INNER JOIN Menu AS M ON O.OrderId = M.MenuId
INNER JOIN MenusItems AS MI ON M.MenuId = MI.menu_id
ORDER BY O.TotalCost;

-- Task 3

SELECT M.MenuName
FROM Menu AS M
WHERE M.MenuId IN (
    SELECT MI.menu_id
    FROM MenusItems AS MI
    WHERE MI.menu_item_id IN (
        SELECT O.MenuId
        FROM Orders AS O
        WHERE O.OrderQuantity > 2
    )
);

-- Task 1: GetMaxQuantity()

BEGIN
    SELECT MAX(OrderQuantity) AS max_quantity_in_order FROM Orders;
END

-- Task 2: GetOrder Detail()

PREPARE GetOrderDetail FROM 'SELECT OrderID, OrderQuantity, TotalCost FROM dblittlelemon.Orders WHERE CustomerId = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;
DEALLOCATE PREPARE GetOrderDetail;

-- Task 3: CancelOrder()

BEGIN
    DECLARE orderExists INT;
    SELECT COUNT(*) INTO orderExists FROM Orders WHERE OrderID = orderIdToDelete;
    IF orderExists > 0 THEN
        DELETE FROM Orders WHERE OrderID = orderIdToDelete;
        SELECT CONCAT('Order ID ', orderIdToDelete, ' has been canceled.') AS Result;
    ELSE
        SELECT 'Order not found. No action taken.' AS Result;
    END IF;
END

-- Task 1

INSERT INTO `dblittlelemon`.`Bookings` (`BookingID`, `Date`, `TableNumber`, `CustomerID`) VALUES
(11, '2022-10-10', 5, 1),
(12, '2022-11-12', 3, 3),
(13, '2022-10-11', 2, 2),
(14, '2022-10-13', 2, 1);

-- Task 2: CheckBooking()

BEGIN
    DECLARE bookingCount INT;
    DECLARE Booking_status VARCHAR(50);

    SELECT COUNT(*) INTO bookingCount
    FROM Bookings
    WHERE BookingDate = bookingDate AND TableNumber = tableNumber;

    IF (@bookingCount > 0) THEN
        SET Booking_status = 'Table is already booked.';
    ELSE
        SET Booking_status = 'Table is available.';
    END IF;

    SELECT Booking_status AS 'Booking Status';

END

-- Task 3: AddValidBooking()

BEGIN
	DECLARE bookingCount INT;
		

		START TRANSACTION;
		

		SELECT COUNT(*) INTO bookingCount
		FROM Bookings
		WHERE BookingDate = Booking_Date AND TableNumber = Table_Number;
		
		IF bookingCount > 0 THEN
			ROLLBACK;
			SELECT 'Table is already booked on the specified date. Booking canceled.' AS Result;
		ELSE
			INSERT INTO Bookings (BookingDate, TableNumber) VALUES (Booking_Date, Table_Number);
			COMMIT;
			SELECT 'Booking successful. Table reserved for the specified date.' AS Result;
		END IF;
END

-- Task 1: AddBooking():

BEGIN
    INSERT INTO Bookings (BookingID, Customer_ID, TableNumber, BookingDate)
    VALUES (Booking_ID, CustomerID, Table_Number, Booking_Date);
    
    SELECT 'New Booking Added' AS Result;
END

-- Task 2: UpdateBooking():

BEGIN
   
    UPDATE Bookings
    SET BookingDate = Booking_Date
    WHERE BookingID = Booking_ID;
    
    SELECT CONCAT('Booking ', Booking_ID, ' updated.') AS Result;
END

-- Task 3: CancelBooking():

BEGIN
 
    DELETE FROM Bookings
    WHERE BookingId = Booking_ID;
    
    SELECT concat('Booking ', Booking_ID, ' cancelled') AS Result;
END

