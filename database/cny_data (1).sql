-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 24, 2018 at 04:47 PM
-- Server version: 5.7.12-log
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cny_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` varchar(10) NOT NULL COMMENT 'รหัสแบรนยาง',
  `brand_name` varchar(20) NOT NULL COMMENT 'ชื่อแบรนยาง'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`) VALUES
('BS', 'Bridgestone'),
('CN', 'Continental'),
('CP', 'Cooper'),
('CT', 'Continental'),
('DP', 'DUNLOP'),
('GY', 'Goodyear'),
('ML', 'Michelin'),
('PL', 'Pirelli'),
('SM', 'Sumitomo');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL COMMENT 'รหัสประเภทสินค้า',
  `cat_name` varchar(100) NOT NULL COMMENT 'ชื่อประเภทสินค้า'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'ยางอัดเย็น'),
(2, 'ยางอัดร้อน'),
(3, 'ยางเปอร์เซนตร์'),
(4, 'ยางแกะดอก'),
(6, 'ยางรถไถ');

-- --------------------------------------------------------

--
-- Table structure for table `img_index`
--

CREATE TABLE `img_index` (
  `img_id` int(11) NOT NULL COMMENT 'รหัสรูปหน้าindex',
  `img_name` varchar(100) NOT NULL COMMENT 'ชื่อรูปหน้าindex',
  `explanation` varchar(100) NOT NULL COMMENT 'ลายละเอียดหน้าindex	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `img_index`
--

INSERT INTO `img_index` (`img_id`, `img_name`, `explanation`) VALUES
(1, '001.jpg', 'ยางเปอร์เซน'),
(2, '09.jpg', 'ยางพร้อมกระทะและแม็กซ์'),
(3, '003.jpg', 'ยางพร้อมกระทะและแม็กซ์'),
(4, '05_5.jpg', 'ยางพร้อมกระทะและแม็กซ์ 4 เส้น'),
(5, '04.jpg', 'ยางพร้อมกระทะและแม็กซ์ 4 เส้น'),
(6, '06.jpg', 'ยางใหม่ 4 เส้น'),
(7, '07.jpg', 'ยางรถบดถนน 4 เส้น'),
(8, '08.jpg', 'ยางรถยกใหญ่'),
(9, '08.jpg', 'ยางรถยกใหญ่'),
(10, '09.jpg', 'ยางพร้อมกระทะและแม็กซ์');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `mem_id` int(11) NOT NULL COMMENT 'รหัสสมาชิก',
  `fname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อสมาชิก',
  `lname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'นามสกุลสมาชิก',
  `sex` varchar(6) NOT NULL COMMENT 'เพศสมาชิก',
  `telephone` varchar(10) NOT NULL COMMENT 'เบอร์โทรศัพท์สมชิก',
  `line_id` varchar(30) NOT NULL COMMENT 'ไลน์ไอดีสมาชิก',
  `facebook` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'เฟสบุ๊คสมาชิก',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ที่อยู่สมาชิก',
  `brithday` varchar(12) NOT NULL COMMENT 'วันเกิดสมาชิก'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mem_id`, `fname`, `lname`, `sex`, `telephone`, `line_id`, `facebook`, `address`, `brithday`) VALUES
(1, 'กิดาการ', 'อินทัปญญา', 'ชาย', '1212', 'l', 'f', '					บ้านบึง\r\n	\r\n	\r\n	\r\n	\r\n	', '2018-01-12'),
(2, 'ตึ๋งเอง', 'ฉายานะจ๊ะ', 'null', '1', '11', '11', '1	', '2018-01-11'),
(14, 'มนตรี', 'ใจมา', 'ชาย', '987654321', 'kid2541', 'มนตรี', 'บ้านบึง', '2018-02-07'),
(15, 'KIDAKARN', 'INTAPANYA', 'ชาย', '987654321', 'kid2541', 'KIDAKARN', '	987654321', '2018-02-23'),
(16, '666', '6', 'null', '666', '66', '66', 'บ้านบึง	', '2018-02-16');

-- --------------------------------------------------------

--
-- Table structure for table `order_cny`
--

CREATE TABLE `order_cny` (
  `pro_id` varchar(11) NOT NULL COMMENT 'รหัสสินค้า',
  `order_id` int(11) NOT NULL COMMENT 'รหัสออร์เดอร์',
  `brand` varchar(10) NOT NULL COMMENT 'รหัสแบรนยาง',
  `number` int(11) NOT NULL COMMENT 'จำนวนยาง',
  `price_sum` int(11) NOT NULL COMMENT 'ราคารวม',
  `mem_id` varchar(50) NOT NULL COMMENT 'รหัสสมาชิก',
  `order_date` varchar(12) NOT NULL COMMENT 'วันที่สั่งสินค้า',
  `order_status` varchar(100) NOT NULL COMMENT 'สถานะการสั่งซื้อ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_cny`
--

INSERT INTO `order_cny` (`pro_id`, `order_id`, `brand`, `number`, `price_sum`, `mem_id`, `order_date`, `order_status`) VALUES
('B1', 3, 'BS', 12, 60000, '2', '2018-01-13', 'ชำระเงินแล้ว'),
('C2', 4, 'CT', 10, 40000, '0898913329', '2018-02-23', 'ชำระเงินแล้ว'),
('S3', 4, 'GY', 4, 18000, '0898913329', '2018-02-23', 'ชำระเงินแล้ว');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_id` varchar(11) NOT NULL COMMENT 'รหัสสินค้า',
  `pro_name` varchar(50) NOT NULL COMMENT 'ชื่อสินค้า',
  `cat_id` int(11) NOT NULL COMMENT 'รหัสประเภทสินค้า',
  `rub_id` varchar(10) NOT NULL COMMENT 'รหัสประเภทหน้ายาง',
  `price` int(11) NOT NULL COMMENT 'ราคา',
  `image` varchar(300) NOT NULL COMMENT 'รูปสินค้า',
  `status` varchar(20) NOT NULL COMMENT 'สถานะสินค้า'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_name`, `cat_id`, `rub_id`, `price`, `image`, `status`) VALUES
('B2', 'CT', 1, 'rib', 5500, '8.jpg', ''),
('B3', 'GY', 1, 'rib', 4000, '3.jpg', ''),
('B4', 'ML', 1, 'rib', 6000, '11.jpg', ''),
('B5', 'SM', 1, 'rib', 3500, '2.jpg', ''),
('B6', 'YH', 1, 'rib', 3000, '3.jpg', ''),
('C1', 'BS', 2, 'rib', 5000, '10.jpg', ''),
('C2', 'CT', 2, 'rib', 4000, '8.jpg', ''),
('C3', 'GY', 2, 'rib', 4500, '3.jpg', ''),
('C4', 'ML', 2, 'rib', 6000, '8.jpg', ''),
('C5', 'SM', 2, 'rib', 3500, '11.jpg', ''),
('C6', 'YH', 2, 'rib', 4500, '3.jpg', ''),
('D1', 'BS', 3, 'rib', 3000, '2.jpg', ''),
('D2', 'CT', 3, 'rib', 2000, '8.jpg', ''),
('D3', 'GY', 3, 'rib', 2500, '15.jpg', ''),
('D4', 'ML', 3, 'rib', 3000, '16.jpg', ''),
('D5', 'SM', 3, 'rib', 1500, '17.jpg', ''),
('D6', 'YH', 3, 'rib', 1500, '18.jpg', ''),
('S1', 'BS', 4, 'rib', 4000, '3.jpg', ''),
('S2', 'CT', 4, 'rib', 4500, '8.jpg', ''),
('S3', 'GY', 4, 'rib', 4500, '11.jpg', ''),
('S4', 'ML', 4, 'rib', 5000, '2.jpg', ''),
('S5', 'SM', 4, 'rib', 5500, '17.jpg', ''),
('S6', 'YH', 4, 'rib', 6000, '18.jpg', ''),
('T1', 'BS', 5, 'rib', 4500, '15.jpg', ''),
('T2', 'CT', 5, 'rib', 4500, '2.jpg', ''),
('T3', 'GY', 5, 'rib', 4000, '8.jpg', ''),
('T4', 'ML', 5, 'rib', 3500, '3.jpg', ''),
('T5', 'SM', 5, 'rib', 3500, '11.jpg', ''),
('T6', 'YH', 5, 'rib', 3000, '8.jpg', ''),
('U1', 'BS', 6, 'rib', 16000, '25.jpg', ''),
('U2', 'CT', 6, 'rib', 10000, '20.jpg', ''),
('U3', 'GY', 6, 'rib', 10000, '23.jpg', ''),
('U4', 'ML', 6, 'rib', 14000, '27.jpg', ''),
('U5', 'SM', 6, 'rib', 12000, '22.jpg', ''),
('U6', 'YH', 6, 'rib', 12000, '28.jpg', ''),
('Z1', 'BS', 7, 'rib', 7500, '11.jpg', ''),
('Z2', 'CT', 7, 'rib', 6000, '3.jpg', ''),
('Z3', 'GY', 7, 'rib', 6000, '8.jpg', ''),
('Z4', 'ML', 7, 'rib', 5500, '18.jpg', ''),
('Z5', 'SM', 7, 'rib', 5500, '2.jpg', ''),
('Z6', 'YH', 7, 'rib', 4500, '17.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `rubber_face`
--

CREATE TABLE `rubber_face` (
  `rub_id` varchar(10) NOT NULL COMMENT 'รหัสประเภทหน้ายาง',
  `rub_name` varchar(100) NOT NULL COMMENT 'ชื่อประเภทหน้ายาง',
  `detail` varchar(300) NOT NULL COMMENT 'ลายละเอียด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rubber_face`
--

INSERT INTO `rubber_face` (`rub_id`, `rub_name`, `detail`) VALUES
('lug', 'lug pattern', 'ดอกยางและร่องยางเป็นแนวขวาง กับเส้นรอบวงของยาง ซึ่งการออกแบบยางเช่นนี้ต้องการประสิทธ์ภาพในการตะกุย อีกทั้งร่องยางมีความลึก ทำให้มีอายุการใช้งานที่ยาวนาน เหมาะสำหรับใช้งานบนถนนที่ขรุขระ และทางเรียบในความเร็วต่ำ และปานกลาง'),
('rib', 'rib pattern', 'มีดอกยางและร่องยางเป็นแนวแถวเส้นรอบวงของยาง และมีรูแบบเรียงตัวของร่องยาง ตามการออกแบบของบริษัทผู้ผลิต โดยทั่วไปแล้ว เน้นให้ยางใช้งานได้ดีในสภาพถนนเรียบ');

-- --------------------------------------------------------

--
-- Table structure for table `slide_index`
--

CREATE TABLE `slide_index` (
  `slide_id` int(11) NOT NULL COMMENT 'รหัสสไลด์หน้าindex',
  `slide_img` varchar(200) NOT NULL COMMENT 'ชื่อสไลด์หน้าindex'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide_index`
--

INSERT INTO `slide_index` (`slide_id`, `slide_img`) VALUES
(1, '1.jpg'),
(2, '2.jpg'),
(3, '3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL COMMENT 'รหัสพนักงาน',
  `fname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อพนักงาน',
  `lname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ยามสกุลพนักงาน',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ที่อยู่พนักงาน',
  `telephone` varchar(10) NOT NULL COMMENT 'เบอร์โทรศัพท์พนักงาน',
  `sex` varchar(6) NOT NULL COMMENT 'เพศพนักงาน',
  `education` varchar(50) NOT NULL COMMENT 'การศึษา',
  `Salary` int(11) NOT NULL COMMENT 'เงินเดือนพนักงาน',
  `staff_Startdate` date NOT NULL COMMENT 'วันที่สมัครเข้าทำงาน'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `fname`, `lname`, `address`, `telephone`, `sex`, `education`, `Salary`, `staff_Startdate`) VALUES
(9, 'admin', 'admin', '		admin	\r\n	\r\n	', 'admin', 'ชาย', 'DR', 1000000, '2018-01-18');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL COMMENT 'รหัสผู้ใช้',
  `username` varchar(50) NOT NULL COMMENT 'ชื่อผู้ใช้',
  `password` varchar(50) NOT NULL COMMENT 'รหัสผ่าน',
  `status` varchar(50) NOT NULL COMMENT 'สถานะผู้ใช้'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `status`) VALUES
(1, '1234567890', '1234567890', 'user'),
(7, '2', '2', 'user'),
(8, '5', '5', 'user'),
(10, 'admin', 'admin', 'admin'),
(13, '8', '8', 'user'),
(14, '1234567890', '1234567890', 'user'),
(15, '1234567890', '1234567890', 'admin'),
(18, '333', '333', 'admin'),
(19, '22222222', '22222222', 'admin'),
(20, '987654321', '987654321', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `img_index`
--
ALTER TABLE `img_index`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mem_id`);

--
-- Indexes for table `order_cny`
--
ALTER TABLE `order_cny`
  ADD PRIMARY KEY (`pro_id`,`order_id`,`mem_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `pro_name` (`pro_name`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `rub_id` (`rub_id`);

--
-- Indexes for table `rubber_face`
--
ALTER TABLE `rubber_face`
  ADD PRIMARY KEY (`rub_id`);

--
-- Indexes for table `slide_index`
--
ALTER TABLE `slide_index`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
