-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 22, 2026 at 09:10 AM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlthucung`
--

-- --------------------------------------------------------

--
-- Table structure for table `backuplogs`
--

DROP TABLE IF EXISTS `backuplogs`;
CREATE TABLE IF NOT EXISTS `backuplogs` (
  `BackupID` int NOT NULL AUTO_INCREMENT,
  `BackupDate` datetime DEFAULT NULL,
  `FilePath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`BackupID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backuplogs`
--

INSERT INTO `backuplogs` (`BackupID`, `BackupDate`, `FilePath`, `Status`) VALUES
(1, '2026-04-03 20:52:02', 'backup1.sql', 'Success'),
(2, '2026-04-03 20:52:02', 'backup2.sql', 'Success'),
(3, '2026-04-03 20:52:02', 'backup3.sql', 'Fail'),
(4, '2026-04-03 20:52:02', 'backup4.sql', 'Success'),
(5, '2026-04-03 20:52:02', 'backup5.sql', 'Success'),
(6, '2026-04-03 20:52:02', 'backup6.sql', 'Success'),
(7, '2026-04-03 20:52:02', 'backup7.sql', 'Fail'),
(8, '2026-04-03 20:52:02', 'backup8.sql', 'Success'),
(9, '2026-04-03 20:52:02', 'backup9.sql', 'Success'),
(10, '2026-04-03 20:52:02', 'backup10.sql', 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CartID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`CartID`, `UserID`, `CreatedAt`) VALUES
(1, 1, '2026-04-03 20:52:02'),
(2, 2, '2026-04-03 20:52:02'),
(3, 3, '2026-04-03 20:52:02'),
(4, 4, '2026-04-03 20:52:02'),
(5, 5, '2026-04-03 20:52:02'),
(6, 6, '2026-04-03 20:52:02'),
(7, 7, '2026-04-03 20:52:02'),
(8, 8, '2026-04-03 20:52:02'),
(9, 9, '2026-04-03 20:52:02'),
(10, 10, '2026-04-03 20:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `cartitems`
--

DROP TABLE IF EXISTS `cartitems`;
CREATE TABLE IF NOT EXISTS `cartitems` (
  `CartItemID` int NOT NULL AUTO_INCREMENT,
  `CartID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`CartItemID`),
  KEY `CartID` (`CartID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cartitems`
--

INSERT INTO `cartitems` (`CartItemID`, `CartID`, `ProductID`, `Quantity`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 2),
(4, 4, 4, 3),
(5, 5, 5, 1),
(6, 6, 6, 2),
(7, 7, 7, 1),
(8, 8, 8, 2),
(9, 9, 9, 1),
(10, 10, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`) VALUES
(1, 'Chó'),
(2, 'Mèo'),
(3, 'Thức ăn'),
(4, 'Phụ kiện'),
(5, 'Chuồng'),
(6, 'Đồ chơi'),
(7, 'Thuốc'),
(8, 'Vệ sinh'),
(9, 'Huấn luyện'),
(10, 'Khác');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `CommentID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Content` text COLLATE utf8mb4_unicode_ci,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CommentID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`CommentID`, `UserID`, `ProductID`, `Content`, `CreatedAt`) VALUES
(1, 1, 1, 'Nice', '2026-04-03 20:52:02'),
(2, 2, 2, 'Good', '2026-04-03 20:52:02'),
(3, 3, 3, 'OK', '2026-04-03 20:52:02'),
(4, 4, 4, 'Like', '2026-04-03 20:52:02'),
(5, 5, 5, 'Cool', '2026-04-03 20:52:02'),
(6, 6, 6, 'Nice', '2026-04-03 20:52:02'),
(7, 7, 7, 'Good', '2026-04-03 20:52:02'),
(8, 8, 8, 'OK', '2026-04-03 20:52:02'),
(9, 9, 9, 'Like', '2026-04-03 20:52:02'),
(10, 10, 10, 'Cool', '2026-04-03 20:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
CREATE TABLE IF NOT EXISTS `favorites` (
  `FavoriteID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  PRIMARY KEY (`FavoriteID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`FavoriteID`, `UserID`, `ProductID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `loginhistory`
--

DROP TABLE IF EXISTS `loginhistory`;
CREATE TABLE IF NOT EXISTS `loginhistory` (
  `LoginID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `LoginTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `IPAddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LoginID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loginhistory`
--

INSERT INTO `loginhistory` (`LoginID`, `UserID`, `LoginTime`, `IPAddress`, `Status`) VALUES
(1, 1, '2026-04-03 20:52:02', '127.0.0.1', 'Success'),
(2, 2, '2026-04-03 20:52:02', '127.0.0.1', 'Success'),
(3, 3, '2026-04-03 20:52:02', '127.0.0.1', 'Fail'),
(4, 4, '2026-04-03 20:52:02', '127.0.0.1', 'Success'),
(5, 5, '2026-04-03 20:52:02', '127.0.0.1', 'Success'),
(6, 6, '2026-04-03 20:52:02', '127.0.0.1', 'Success'),
(7, 7, '2026-04-03 20:52:02', '127.0.0.1', 'Fail'),
(8, 8, '2026-04-03 20:52:02', '127.0.0.1', 'Success'),
(9, 9, '2026-04-03 20:52:02', '127.0.0.1', 'Success'),
(10, 10, '2026-04-03 20:52:02', '127.0.0.1', 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `Price`) VALUES
(1, 1, 1, 1, 5000000.00),
(2, 2, 2, 1, 4000000.00),
(3, 3, 3, 2, 200000.00),
(4, 4, 4, 1, 50000.00),
(5, 5, 5, 1, 800000.00),
(6, 6, 6, 1, 30000.00),
(7, 7, 7, 1, 100000.00),
(8, 8, 8, 1, 150000.00),
(9, 9, 9, 1, 120000.00),
(10, 10, 10, 1, 900000.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `OrderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `Status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `OrderDate`, `TotalAmount`, `Status`) VALUES
(1, 1, '2026-04-03 20:52:02', 5000000.00, 'Done'),
(2, 2, '2026-04-03 20:52:02', 4000000.00, 'Done'),
(3, 3, '2026-04-03 20:52:02', 200000.00, 'Pending'),
(4, 4, '2026-04-03 20:52:02', 50000.00, 'Done'),
(5, 5, '2026-04-03 20:52:02', 800000.00, 'Done'),
(6, 6, '2026-04-03 20:52:02', 30000.00, 'Pending'),
(7, 7, '2026-04-03 20:52:02', 100000.00, 'Done'),
(8, 8, '2026-04-03 20:52:02', 150000.00, 'Done'),
(9, 9, '2026-04-03 20:52:02', 120000.00, 'Done'),
(10, 10, '2026-04-03 20:52:02', 900000.00, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `passwordreset`
--

DROP TABLE IF EXISTS `passwordreset`;
CREATE TABLE IF NOT EXISTS `passwordreset` (
  `ResetID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExpireTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ResetID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `passwordreset`
--

INSERT INTO `passwordreset` (`ResetID`, `Email`, `Token`, `ExpireTime`) VALUES
(1, 'a@gmail.com', 'token1', '2026-04-03 20:52:02'),
(2, 'b@gmail.com', 'token2', '2026-04-03 20:52:02'),
(3, 'c@gmail.com', 'token3', '2026-04-03 20:52:02'),
(4, 'd@gmail.com', 'token4', '2026-04-03 20:52:02'),
(5, 'e@gmail.com', 'token5', '2026-04-03 20:52:02'),
(6, 'f@gmail.com', 'token6', '2026-04-03 20:52:02'),
(7, 'g@gmail.com', 'token7', '2026-04-03 20:52:02'),
(8, 'h@gmail.com', 'token8', '2026-04-03 20:52:02'),
(9, 'i@gmail.com', 'token9', '2026-04-03 20:52:02'),
(10, 'k@gmail.com', 'token10', '2026-04-03 20:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `PaymentMethod` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentStatus` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentDate` datetime DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`PaymentID`, `OrderID`, `PaymentMethod`, `PaymentStatus`, `PaymentDate`) VALUES
(1, 1, 'COD', 'Paid', '2026-04-03 20:52:02'),
(2, 2, 'Bank', 'Paid', '2026-04-03 20:52:02'),
(3, 3, 'COD', 'Pending', '2026-04-03 20:52:02'),
(4, 4, 'Momo', 'Paid', '2026-04-03 20:52:02'),
(5, 5, 'Bank', 'Paid', '2026-04-03 20:52:02'),
(6, 6, 'COD', 'Pending', '2026-04-03 20:52:02'),
(7, 7, 'Momo', 'Paid', '2026-04-03 20:52:02'),
(8, 8, 'COD', 'Paid', '2026-04-03 20:52:02'),
(9, 9, 'Bank', 'Paid', '2026-04-03 20:52:02'),
(10, 10, 'COD', 'Pending', '2026-04-03 20:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `productimages`
--

DROP TABLE IF EXISTS `productimages`;
CREATE TABLE IF NOT EXISTS `productimages` (
  `ImageID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int DEFAULT NULL,
  `ImageURL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsMain` tinyint(1) DEFAULT '0',
  `SortOrder` int DEFAULT '0',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ImageID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productimages`
--

INSERT INTO `productimages` (`ImageID`, `ProductID`, `ImageURL`, `IsMain`, `SortOrder`, `CreatedAt`) VALUES
(1, 1, 'doghusky.jpg', 1, 1, '2026-04-03 20:52:02'),
(2, 2, 'catlongngan.jpg', 1, 1, '2026-04-03 20:52:02'),
(11, 3, 'Pedigree.jpg', 1, 1, '2026-04-03 20:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Price` decimal(10,2) DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `IsPromotion` tinyint(1) DEFAULT '0',
  `DiscountPercent` int DEFAULT '0',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `Name`, `Description`, `Price`, `Stock`, `CategoryID`, `IsPromotion`, `DiscountPercent`, `CreatedAt`) VALUES
(1, 'Chó Husky', 'Mô tả', 5000000.00, 10, 1, 0, 0, '2026-04-03 20:52:02'),
(2, 'Mèo Anh lông ngắn', 'Mô tả', 4000000.00, 8, 2, 1, 10, '2026-04-03 20:52:02'),
(3, 'Thức ăn Pedigree', 'Mô tả', 200000.00, 50, 3, 1, 5, '2026-04-03 20:52:02'),
(4, 'Vòng cổ', 'Mô tả', 50000.00, 100, 4, 0, 0, '2026-04-03 20:52:02'),
(5, 'Chuồng chó', 'Mô tả', 800000.00, 20, 5, 0, 0, '2026-04-03 20:52:02'),
(6, 'Đồ chơi bóng', 'Mô tả', 30000.00, 200, 6, 0, 0, '2026-04-03 20:52:02'),
(7, 'Thuốc tẩy giun', 'Mô tả', 100000.00, 40, 7, 0, 0, '2026-04-03 20:52:02'),
(8, 'Sữa tắm', 'Mô tả', 150000.00, 30, 8, 0, 0, '2026-04-03 20:52:02'),
(9, 'Dây dắt', 'Mô tả', 120000.00, 60, 4, 0, 0, '2026-04-03 20:52:02'),
(10, 'Nhà mèo', 'Mô tả', 900000.00, 15, 5, 1, 15, '2026-04-03 20:52:02'),
(11, 'Chó Poodle', 'Chó cảnh thông minh, dễ nuôi', 4500000.00, 12, 1, 1, 10, '2026-04-15 17:56:04'),
(12, 'Chó Corgi', 'Chân ngắn đáng yêu', 7000000.00, 6, 1, 0, 0, '2026-04-15 17:56:04'),
(13, 'Mèo Ba Tư', 'Lông dài sang trọng', 6000000.00, 5, 2, 1, 15, '2026-04-15 17:56:04'),
(14, 'Mèo Scottish Fold', 'Tai cụp dễ thương', 6500000.00, 4, 2, 0, 0, '2026-04-15 17:56:04'),
(15, 'Thức ăn Royal Canin', 'Dành cho chó cao cấp', 350000.00, 40, 3, 1, 5, '2026-04-15 17:56:04'),
(16, 'Thức ăn Whiskas', 'Dành cho mèo', 180000.00, 60, 3, 0, 0, '2026-04-15 17:56:04'),
(17, 'Bát ăn inox', 'Bát ăn cho thú cưng', 80000.00, 100, 4, 0, 0, '2026-04-15 17:56:04'),
(18, 'Áo cho chó', 'Quần áo giữ ấm', 120000.00, 50, 4, 1, 10, '2026-04-15 17:56:04'),
(19, 'Chuồng mèo 2 tầng', 'Chuồng rộng rãi', 1200000.00, 10, 5, 0, 0, '2026-04-15 17:56:04'),
(20, 'Nhà chó gỗ', 'Chống nước tốt', 1500000.00, 8, 5, 0, 0, '2026-04-15 17:56:04'),
(21, 'Đồ chơi dây thừng', 'Giúp chó vận động', 50000.00, 120, 6, 0, 0, '2026-04-15 17:56:04'),
(22, 'Bóng cao su', 'Đồ chơi bền', 40000.00, 150, 6, 0, 0, '2026-04-15 17:56:04'),
(23, 'Thuốc trị ve rận', 'Hiệu quả cao', 90000.00, 70, 7, 1, 5, '2026-04-15 17:56:04'),
(24, 'Vitamin tổng hợp', 'Tăng sức đề kháng', 150000.00, 60, 7, 0, 0, '2026-04-15 17:56:04'),
(25, 'Cát vệ sinh mèo', 'Khử mùi tốt', 200000.00, 80, 8, 0, 0, '2026-04-15 17:56:04'),
(26, 'Khay vệ sinh', 'Dành cho mèo', 250000.00, 40, 8, 0, 0, '2026-04-15 17:56:04'),
(27, 'Clicker huấn luyện', 'Dạy thú cưng hiệu quả', 70000.00, 30, 9, 0, 0, '2026-04-15 17:56:04'),
(28, 'Dây huấn luyện', 'Kiểm soát thú cưng', 110000.00, 35, 9, 0, 0, '2026-04-15 17:56:04'),
(29, 'Balo thú cưng', 'Tiện mang đi xa', 500000.00, 20, 10, 1, 10, '2026-04-15 17:56:04'),
(30, 'Xe đẩy thú cưng', 'Dành cho thú nhỏ', 1800000.00, 10, 10, 0, 0, '2026-04-15 17:56:04'),
(31, 'Chó Golden Retriever', 'Thân thiện, dễ huấn luyện', 8000000.00, 7, 1, 1, 10, '2026-04-15 17:56:35'),
(32, 'Chó Shiba Inu', 'Giống chó Nhật nổi tiếng', 9000000.00, 5, 1, 0, 0, '2026-04-15 17:56:35'),
(33, 'Mèo Ragdoll', 'Hiền lành, thích ôm', 7000000.00, 6, 2, 1, 12, '2026-04-15 17:56:35'),
(34, 'Mèo Bengal', 'Hoang dã, năng động', 8500000.00, 4, 2, 0, 0, '2026-04-15 17:56:35'),
(35, 'Thức ăn hạt SmartHeart', 'Dinh dưỡng đầy đủ', 220000.00, 70, 3, 0, 0, '2026-04-15 17:56:35'),
(36, 'Pate cho mèo', 'Thức ăn mềm dễ ăn', 30000.00, 150, 3, 1, 5, '2026-04-15 17:56:35'),
(37, 'Vòng cổ chống ve', 'Bảo vệ thú cưng', 130000.00, 40, 4, 0, 0, '2026-04-15 17:56:35'),
(38, 'Lồng vận chuyển', 'Tiện mang đi xa', 400000.00, 25, 5, 0, 0, '2026-04-15 17:56:35'),
(39, 'Đồ chơi phát tiếng', 'Kích thích vận động', 60000.00, 90, 6, 0, 0, '2026-04-15 17:56:35'),
(40, 'Sữa dinh dưỡng cho chó mèo', 'Bổ sung canxi', 180000.00, 50, 7, 1, 10, '2026-04-15 17:56:35');

-- --------------------------------------------------------

--
-- Table structure for table `relatedproducts`
--

DROP TABLE IF EXISTS `relatedproducts`;
CREATE TABLE IF NOT EXISTS `relatedproducts` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int DEFAULT NULL,
  `RelatedProductID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ProductID` (`ProductID`),
  KEY `RelatedProductID` (`RelatedProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `relatedproducts`
--

INSERT INTO `relatedproducts` (`ID`, `ProductID`, `RelatedProductID`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 4),
(4, 4, 5),
(5, 5, 6),
(6, 6, 7),
(7, 7, 8),
(8, 8, 9),
(9, 9, 10),
(10, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `Comment` text COLLATE utf8mb4_unicode_ci,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReviewID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`)
) ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`ReviewID`, `UserID`, `ProductID`, `Rating`, `Comment`, `CreatedAt`) VALUES
(1, 1, 1, 5, 'Tốt', '2026-04-03 20:52:02'),
(2, 2, 2, 4, 'Ổn', '2026-04-03 20:52:02'),
(3, 3, 3, 5, 'Rất tốt', '2026-04-03 20:52:02'),
(4, 4, 4, 3, 'Bình thường', '2026-04-03 20:52:02'),
(5, 5, 5, 5, 'OK', '2026-04-03 20:52:02'),
(6, 6, 6, 4, 'Tốt', '2026-04-03 20:52:02'),
(7, 7, 7, 5, 'Tuyệt', '2026-04-03 20:52:02'),
(8, 8, 8, 4, 'Ổn', '2026-04-03 20:52:02'),
(9, 9, 9, 5, 'Hài lòng', '2026-04-03 20:52:02'),
(10, 10, 10, 3, 'Tạm', '2026-04-03 20:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PasswordHash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` text COLLATE utf8mb4_unicode_ci,
  `Avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Customer',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FullName`, `Email`, `PasswordHash`, `Phone`, `Address`, `Avatar`, `Role`, `CreatedAt`) VALUES
(1, 'Nguyen Van A', 'a@gmail.com', '123', '0901', 'HCM', 'a.jpg', 'Customer', '2026-04-03 20:52:02'),
(2, 'Tran Van B', 'b@gmail.com', '123', '0902', 'HCM', 'b.jpg', 'Customer', '2026-04-03 20:52:02'),
(3, 'Le Van C', 'c@gmail.com', '123', '0903', 'HCM', 'c.jpg', 'Admin', '2026-04-03 20:52:02'),
(4, 'Pham Van D', 'd@gmail.com', '123', '0904', 'HN', 'd.jpg', 'Customer', '2026-04-03 20:52:02'),
(5, 'Hoang Van E', 'e@gmail.com', '123', '0905', 'HN', 'e.jpg', 'Customer', '2026-04-03 20:52:02'),
(6, 'Vo Van F', 'f@gmail.com', '123', '0906', 'DN', 'f.jpg', 'Customer', '2026-04-03 20:52:02'),
(7, 'Dang Van G', 'g@gmail.com', '123', '0907', 'DN', 'g.jpg', 'Customer', '2026-04-03 20:52:02'),
(8, 'Bui Van H', 'h@gmail.com', '123', '0908', 'CT', 'h.jpg', 'Customer', '2026-04-03 20:52:02'),
(9, 'Do Van I', 'i@gmail.com', '123', '0909', 'CT', 'i.jpg', 'Customer', '2026-04-03 20:52:02'),
(10, 'Nguyen Van K', 'k@gmail.com', '123', '0910', 'HCM', 'k.jpg', 'Customer', '2026-04-03 20:52:02');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `loginhistory`
--
ALTER TABLE `loginhistory`
  ADD CONSTRAINT `loginhistory_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE;

--
-- Constraints for table `productimages`
--
ALTER TABLE `productimages`
  ADD CONSTRAINT `productimages_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);

--
-- Constraints for table `relatedproducts`
--
ALTER TABLE `relatedproducts`
  ADD CONSTRAINT `relatedproducts_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE,
  ADD CONSTRAINT `relatedproducts_ibfk_2` FOREIGN KEY (`RelatedProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
