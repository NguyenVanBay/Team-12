-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2018 at 06:38 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book`
--

-- --------------------------------------------------------

--
-- Table structure for table `billdetails`
--

CREATE TABLE `billdetails` (
  `id` int(11) NOT NULL,
  `id_bill` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `billdetails`
--

INSERT INTO `billdetails` (`id`, `id_bill`, `id_product`, `count`, `price`) VALUES
(1, 1, 1, 1, 123123123),
(2, 1, 4, 2, 1231232),
(3, 6, 1, 3, 150000),
(4, 6, 4, 2, 1500000);

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `customer` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sumMoney` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `customer`, `address`, `phone`, `sumMoney`, `status`, `create_by`) VALUES
(1, 'a', 'a', 'a', 1231231231, 0, 3),
(2, 'b', 'b', 'b', 123123123, 1, 3),
(3, 'c', 'c', 'c', 1231231231, 3, 3),
(4, 'd', 'd', 'd', 1231231231, 0, 3),
(5, 'e', 'e', 'e', 231231231, 3, 3),
(6, 'dung van hung', 'ha noi hoai duc ha noi', '0962199793', 3450000, 0, 29);

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `create_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `create_by`) VALUES
(1, 'Tiểu thuyết', 2),
(3, 'Sách bình luận văn học‎ ', 2),
(4, 'Sách chính trị‎ ', 2),
(5, 'Sách địa lý‎', 2),
(6, 'Sách giáo khoa‎', 2),
(7, 'Sách lịch sử', 2),
(8, 'Sách phi hư cấu‎ ', 2),
(9, 'Sách khoa học‎ ', 2),
(10, 'Sách kinh doanh‎ ', 2),
(11, 'Sách thiếu nhi‎ ', 2),
(12, 'Sách thiếu niên‎ ', 2),
(13, 'Sách khoa học viễn tưởng‎ ', 2);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`, `id_product`, `type`) VALUES
(1, 'image15408826105501.png', 1, 1),
(2, 'image15408826105502.png', 1, 2),
(3, 'image15408826105503.png', 1, 2),
(4, 'image15408826105504.png', 1, 2),
(13, 'image15409961271721.png', 4, 1),
(14, 'image15409961271722.png', 4, 2),
(15, 'image15409961271723.png', 4, 2),
(16, 'image15409961271724.png', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public` date DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `create_by` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `author`, `public`, `count`, `price`, `title`, `description`, `create_by`, `type`, `id_category`) VALUES
(1, 'Những ngày thơ bé', 'Nguyễn Văn Bảy', '2018-11-03', 100, 150000, 'Đồng bệnh tương lân!', 'Trong khoảng 2 tiếng, tôi đã đọc xong quyển LN tiếng Việt đầu tiên mình mua, Chào mừng đến với N.H.K. Thú thật là với tác phẩm này tôi có biết nhưng không có quen, biết đã lâu nhưng vì lâu quá tôi cũng đã quên hẳn nội dung của nó. Khi nghe đến N.H.K...', 2, 'sellMultiple', 1),
(4, 'chú bé pocoro', 'bay ka ', '2018-10-01', 20, 1500000, 'Tác phẩm này tôi có biết nhưng không có quen.', 'Trong khoảng 2 tiếng, tôi đã đọc xong quyển LN tiếng Việt đầu tiên mình mua, Chào mừng đến với N.H.K. Thú thật là với tác phẩm này tôi có biết nhưng không có quen, biết đã lâu nhưng vì lâu quá tôi cũng đã quên hẳn nội dung của nó. Khi nghe đến N.H.K...', 2, 'new', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `role` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `address`, `phone`, `create_by`, `role`) VALUES
(2, 'nguyen van bay', 'bay@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'ha noi', '0962199791', NULL, 4),
(3, 'thien', 'thien@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'Ha noi', '0962199791', NULL, 3),
(26, 'dung 12', 'dung@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'ha noi.', '0962199791', NULL, 2),
(27, 'hai', 'hai@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'ha noi', '0962199791', NULL, 1),
(29, 'trinh quoc hai', 'duong@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'ha noi', '0962199791', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bill` (`id_bill`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `create_by` (`create_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billdetails`
--
ALTER TABLE `billdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD CONSTRAINT `billdetails_ibfk_1` FOREIGN KEY (`id_bill`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `billdetails_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `categorys`
--
ALTER TABLE `categorys`
  ADD CONSTRAINT `categorys_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categorys` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
