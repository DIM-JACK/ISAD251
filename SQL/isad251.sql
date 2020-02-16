-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-02-16 16:00:09
-- 伺服器版本： 10.4.11-MariaDB
-- PHP 版本： 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `isad251`
--

DELIMITER $$
--
-- 程序
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Item` (IN `ItemID` VARCHAR(11), IN `ItemName` VARCHAR(20), IN `ItemDescription` VARCHAR(80), IN `Price` VARCHAR(11))  NO SQL
INSERT INTO `Items` (`Item_ID`, `Item_Name`, `Item_Description`, `Price`)
VALUES (`ItemID`, `ItemName`, `ItemDescription`,`Price`)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Order` (IN `OrderID` VARCHAR(11), IN `Items_ID_Items` VARCHAR(11), IN `Quantity` INT)  NO SQL
INSERT INTO `Order_Items` (`Order_ID_Items`, `Items_ID_Items`, `Quantity`)
VALUES(`OrderID`, `Items_ID_Items`, `Quantity`)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Item` (IN `ItemID` VARCHAR(11))  NO SQL
DELETE FROM `Items`
WHERE `Item_ID` = `ItemID`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Order` (IN `OrderID` INT)  MODIFIES SQL DATA
Begin 
DELETE FROM `Order_Items`
WHERE `Order_ID_Items` = `OrderID`;
DELETE FROM `Orderss`
WHERE `Order_ID` = `OrderID`;     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Edit_Item` (IN `ItemID` VARCHAR(11), IN `ItemName` VARCHAR(20), IN `ItemDescription` VARCHAR(80), IN `ItemPrice` VARCHAR(11))  NO SQL
Begin 
UPDATE `items`
SET `Item_ID` = `ItemID`, `Item_Name` = `ItemName`,`Item_Description` = `ItemDescription`,`Price` = `ItemPrice`
WHERE `ItemID` = `Item_ID`;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Make_Order` (IN `Order_ID` VARCHAR(11), IN `Table_Number` INT, IN `First_Name` VARCHAR(20), IN `Order_Description` VARCHAR(80), IN `Order_Date` VARCHAR(11), IN `Item` VARCHAR(11), IN `Quantity` INT)  NO SQL
Begin 
INSERT INTO `Orderss` (`Order_ID`, `Table_Number`, `Order_Description`, `First_Name`, `Order_Date`)
VALUES (`Order_ID`, `Table_Number`, `Order_Description`, `First_Name`, `Order_date`);
            
INSERT INTO `order_items` (`Order_ID_Items`, `Items_ID_Items`, `Quantity`)
VALUES (`Order_ID`, `Item`, `Quantity`);
END$$

CREATE DEFINER=`isad251`@`%` PROCEDURE `View_Customer_Orders` (IN `OrderID` VARCHAR(11))  READS SQL DATA
    COMMENT 'View Customer Table'
SELECT `Order_ID`, `Table_Number`, `First_Name`, `Order_Date`,`Item_Name`, `Quantity`, `Order_Description`
FROM `Order_Items`, `Orderss`, `Items`
WHERE` Orderss.Order_ID` = `Order_Items.Order_ID_Items`
AND `Items_ID_Items` = `Item_ID`
AND `Order_ID` = `OrderID`$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `all_orders`
-- (請參考以下實際畫面)
--
CREATE TABLE `all_orders` (
`Order_ID` varchar(11)
,`Table_Number` int(11)
,`First_Name` varchar(20)
,`Order_Date` varchar(20)
,`Items_ID_Items` varchar(11)
,`Quantity` int(11)
,`Order_Description` varchar(80)
);

-- --------------------------------------------------------

--
-- 資料表結構 `items`
--

CREATE TABLE `items` (
  `Item_ID` varchar(11) COLLATE utf8_bin NOT NULL,
  `Item_Name` varchar(20) COLLATE utf8_bin NOT NULL,
  `Item_Description` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 傾印資料表的資料 `items`
--

INSERT INTO `items` (`Item_ID`, `Item_Name`, `Item_Description`, `Price`) VALUES
('401', 'Change Vodka', 'New update', 11),
('412', 'Devon Whiskey', 'Very Pure', 45),
('423', 'Rum edit', 'New value', 11),
('434', 'Coke', 'Coca Cola', 15),
('489', 'Pork Scratching', 'Quite Crunchy', 12),
('543', 'Sprite', 'Sprite', 15),
('44333', 'Candy', 'SUPER SWEET', 1),
('4455', 'Chips', 'Honey favorite', 20),
('12', 'Lemon Tea', 'Fresh lemon juice', 22),
('333', 'GREEN TEA', 'TES', 12);

-- --------------------------------------------------------

--
-- 資料表結構 `orderss`
--

CREATE TABLE `orderss` (
  `Order_ID` varchar(11) COLLATE utf8_bin NOT NULL,
  `Table_Number` int(11) NOT NULL,
  `Order_Description` varchar(80) COLLATE utf8_bin NOT NULL,
  `First_Name` varchar(20) COLLATE utf8_bin NOT NULL,
  `Order_Date` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 傾印資料表的資料 `orderss`
--

INSERT INTO `orderss` (`Order_ID`, `Table_Number`, `Order_Description`, `First_Name`, `Order_Date`) VALUES
('23366', 2, 'Birthday', 'Ellen', '12/11/2019'),
('23289', 3, 'Weddiing', 'Daisy', '11/6/2020'),
('24677', 4, 'Null', 'Jacob', '31/8/2020'),
('24678', 12, 'Celebration', 'Dior', '21/7/2020'),
('32321', 26, 'Party', 'Jack', '1/10/2020'),
('32452', 9, 'Meeting', 'Betty', '21/12/2020'),
('', 0, '', '', ''),
('', 0, '', '', ''),
('', 0, '', '', ''),
('', 0, '', '', ''),
('', 0, '', '', ''),
('', 0, '', '', ''),
('', 0, '', '', ''),
('', 0, '', '', ''),
('', 0, '', '', ''),
('', 0, '', '', ''),
('', 0, '', '', ''),
('', 0, '', '', ''),
('112233', 1122, 'Celebration', 'Jack', '2020-02-03'),
('', 0, '', '', ''),
('789', 66, '', 'Wayne', '2020-02-03'),
('567', 55, '', 'Rayan', '2020-04-09');

-- --------------------------------------------------------

--
-- 資料表結構 `order_items`
--

CREATE TABLE `order_items` (
  `Order_ID_Items` varchar(11) COLLATE utf8_bin NOT NULL,
  `Items_ID_Items` varchar(11) COLLATE utf8_bin NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 傾印資料表的資料 `order_items`
--

INSERT INTO `order_items` (`Order_ID_Items`, `Items_ID_Items`, `Quantity`) VALUES
('301', '401', 1),
('313', '412', 1),
('332', '489', 2),
('334', '643', 5),
('356', '423', 2),
('378', '643', 3),
('396', '412', 1),
('3', '5', 2),
('4', '2', 3),
('22112', '22', 2),
('22112', '22', 2),
('23287', '401', 3),
('23287', '401', 3),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('112233', '', 2),
('', '', 0),
('', '', 0),
('', '', 0),
('', '', 0),
('789', '', 0),
('567', '', 0),
('23444', '401', 2);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `test_orders`
-- (請參考以下實際畫面)
--
CREATE TABLE `test_orders` (
`Order_ID` varchar(11)
,`Table_Number` int(11)
,`First_Name` varchar(20)
,`Order_Date` varchar(20)
,`Items_ID_Items` varchar(11)
,`Quantity` int(11)
,`Order_Description` varchar(80)
);

-- --------------------------------------------------------

--
-- 檢視表結構 `all_orders`
--
DROP TABLE IF EXISTS `all_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_orders`  AS  select `orderss`.`Order_ID` AS `Order_ID`,`orderss`.`Table_Number` AS `Table_Number`,`orderss`.`First_Name` AS `First_Name`,`orderss`.`Order_Date` AS `Order_Date`,`order_items`.`Items_ID_Items` AS `Items_ID_Items`,`order_items`.`Quantity` AS `Quantity`,`orderss`.`Order_Description` AS `Order_Description` from (`order_items` join `orderss`) where `orderss`.`Order_ID` = `order_items`.`Order_ID_Items` ;

-- --------------------------------------------------------

--
-- 檢視表結構 `test_orders`
--
DROP TABLE IF EXISTS `test_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `test_orders`  AS  select `orderss`.`Order_ID` AS `Order_ID`,`orderss`.`Table_Number` AS `Table_Number`,`orderss`.`First_Name` AS `First_Name`,`orderss`.`Order_Date` AS `Order_Date`,`order_items`.`Items_ID_Items` AS `Items_ID_Items`,`order_items`.`Quantity` AS `Quantity`,`orderss`.`Order_Description` AS `Order_Description` from (`order_items` join `orderss`) where `orderss`.`Order_ID` = `order_items`.`Order_ID_Items` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
