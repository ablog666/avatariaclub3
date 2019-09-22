-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2014 at 08:24 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `finanacem`
--

-- --------------------------------------------------------

--
-- Table structure for table `sys_accounts`
--

CREATE TABLE IF NOT EXISTS `sys_accounts` (
`id` int(11) NOT NULL,
  `account` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `balance` decimal(18,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `sys_accounts`
--

INSERT INTO `sys_accounts` (`id`, `account`, `description`, `balance`) VALUES
(16, 'Cash at Home', 'Money at Home Cash', '28500.00');

-- --------------------------------------------------------

--
-- Table structure for table `sys_appconfig`
--

CREATE TABLE IF NOT EXISTS `sys_appconfig` (
`id` int(11) NOT NULL,
  `setting` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=63 ;

--
-- Dumping data for table `sys_appconfig`
--

INSERT INTO `sys_appconfig` (`id`, `setting`, `value`) VALUES
(1, 'CompanyName', 'MoneyFlow'),
(29, 'theme', 'ria'),
(37, 'currency_code', ''),
(56, 'language', 'en-us'),
(57, 'show-logo', '1'),
(58, 'nstyle', 'blue'),
(59, 'timezone', 'America/New_York'),
(60, 'dec_point', '.'),
(61, 'thousands_sep', ','),
(62, 'rtl', '0');

-- --------------------------------------------------------

--
-- Table structure for table `sys_cats`
--

CREATE TABLE IF NOT EXISTS `sys_cats` (
`id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('Income','Expense') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sorder` int(11) NOT NULL DEFAULT '0',
  `bt` decimal(20,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `sys_cats`
--

INSERT INTO `sys_cats` (`id`, `name`, `type`, `sorder`, `bt`) VALUES
(14, 'Advertising', 'Expense', 1, '0.00'),
(15, 'Bank and Credit Card Interest', 'Expense', 22, '0.00'),
(16, 'Car and Truck', 'Expense', 23, '0.00'),
(17, 'Commissions and Fees', 'Expense', 24, '0.00'),
(18, 'Contract Labor', 'Expense', 25, '0.00'),
(19, 'Contributions', 'Expense', 26, '0.00'),
(20, 'Cost of Goods Sold', 'Expense', 27, '0.00'),
(21, 'Credit Card Interest', 'Expense', 28, '0.00'),
(22, 'Depreciation', 'Expense', 29, '0.00'),
(23, 'Dividend Payments', 'Expense', 30, '0.00'),
(24, 'Employee Benefit Programs', 'Expense', 31, '0.00'),
(25, 'Entertainment', 'Expense', 32, '0.00'),
(26, 'Gift', 'Expense', 33, '0.00'),
(27, 'Insurance', 'Expense', 34, '0.00'),
(28, 'Legal, Accountant &amp; Other Professional Services', 'Expense', 35, '0.00'),
(29, 'Meals', 'Expense', 36, '0.00'),
(30, 'Mortgage Interest', 'Expense', 37, '0.00'),
(31, 'Non-Deductible Expense', 'Expense', 38, '0.00'),
(32, 'Office', 'Expense', 21, '0.00'),
(33, 'Other Business Property Leasing', 'Expense', 20, '0.00'),
(34, 'Owner Draws', 'Expense', 19, '0.00'),
(35, 'Payroll Taxes', 'Expense', 2, '0.00'),
(36, 'Pension &amp; Profit-Sharing Plans', 'Expense', 3, '0.00'),
(37, 'Phone', 'Expense', 6, '0.00'),
(38, 'Postage', 'Expense', 4, '0.00'),
(39, 'Rent', 'Expense', 5, '0.00'),
(40, 'Repairs &amp; Maintenance', 'Expense', 7, '0.00'),
(41, 'Supplies', 'Expense', 8, '0.00'),
(42, 'Taxes and Licenses', 'Expense', 9, '0.00'),
(43, 'Transfer Funds', 'Expense', 10, '0.00'),
(44, 'Travel', 'Expense', 11, '0.00'),
(45, 'Utilities', 'Expense', 12, '0.00'),
(46, 'Vehicle, Machinery &amp; Equipment Rental or Leasing', 'Expense', 13, '0.00'),
(47, 'Wages', 'Expense', 14, '0.00'),
(48, 'Regular Income', 'Income', 1, '0.00'),
(49, 'Owner Contribution', 'Income', 12, '0.00'),
(50, 'Interest Income', 'Income', 11, '0.00'),
(51, 'Expense Refund', 'Income', 10, '0.00'),
(52, 'Other Income', 'Income', 9, '0.00'),
(53, 'Salary', 'Income', 8, '0.00'),
(54, 'Equities', 'Income', 7, '0.00'),
(55, 'Rent &amp; Royalties', 'Income', 6, '0.00'),
(56, 'Home equity', 'Income', 5, '0.00'),
(57, 'Part Time Work', 'Income', 3, '0.00'),
(58, 'Account Transfer', 'Income', 4, '0.00'),
(59, 'Food', 'Expense', 15, '0.00'),
(60, 'Health Care', 'Expense', 16, '0.00'),
(61, 'Home Office', 'Expense', 17, '0.00'),
(62, 'Household', 'Expense', 18, '0.00'),
(63, 'Loans', 'Expense', 39, '0.00'),
(64, 'Selling Software', 'Income', 2, '0.00'),
(65, 'Software Customization', 'Income', 13, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `sys_payee`
--

CREATE TABLE IF NOT EXISTS `sys_payee` (
`id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sorder` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `sys_payee`
--

INSERT INTO `sys_payee` (`id`, `name`, `sorder`) VALUES
(6, 'Amazon', 0),
(7, 'eBay', 0),
(8, 'Google', 0),
(9, 'Softlayer', 0),
(10, 'Hostgator', 0),
(11, 'Name.com', 0),
(12, 'Employee', 0),
(13, 'Brac University', 0),
(17, 'Gas Station', 0),
(18, 'Government', 0),
(19, 'Other', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sys_payers`
--

CREATE TABLE IF NOT EXISTS `sys_payers` (
`id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sorder` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `sys_payers`
--

INSERT INTO `sys_payers` (`id`, `name`, `sorder`) VALUES
(1, 'Employer', 2),
(2, 'City Bank', 3),
(5, 'Government', 0),
(6, 'Envato', 0),
(7, 'John Doe', 0),
(8, 'Jane Doe', 0),
(9, 'Client X', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sys_pmethods`
--

CREATE TABLE IF NOT EXISTS `sys_pmethods` (
`id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sorder` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `sys_pmethods`
--

INSERT INTO `sys_pmethods` (`id`, `name`, `sorder`) VALUES
(1, 'Cash', 1),
(2, 'Check', 3),
(3, 'Credit Card', 4),
(4, 'Debit', 5),
(5, 'Electronic Transfer', 6),
(9, 'Paypal', 2),
(10, 'ATM Withdrawals', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sys_repeating`
--

CREATE TABLE IF NOT EXISTS `sys_repeating` (
`id` int(11) NOT NULL,
  `account` varchar(200) CHARACTER SET latin1 NOT NULL,
  `type` enum('Income','Expense','Transfer') CHARACTER SET latin1 NOT NULL,
  `category` varchar(200) CHARACTER SET latin1 NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payer` varchar(200) CHARACTER SET latin1 NOT NULL,
  `payee` varchar(200) CHARACTER SET latin1 NOT NULL,
  `method` varchar(200) CHARACTER SET latin1 NOT NULL,
  `ref` varchar(200) CHARACTER SET latin1 NOT NULL,
  `status` enum('Cleared','Uncleared','Reconciled','Void') CHARACTER SET latin1 NOT NULL DEFAULT 'Uncleared',
  `description` text CHARACTER SET latin1 NOT NULL,
  `tag` text CHARACTER SET latin1 NOT NULL,
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL,
  `pdate` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=319 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_sales`
--

CREATE TABLE IF NOT EXISTS `sys_sales` (
`id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `oid` int(11) NOT NULL DEFAULT '0',
  `oname` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `term` varchar(100) NOT NULL,
  `milestone` varchar(100) NOT NULL,
  `p` int(11) NOT NULL,
  `o` int(11) NOT NULL,
  `open` date NOT NULL,
  `close` date NOT NULL,
  `status` enum('New','In Progress','Won','Lost') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_transactions`
--

CREATE TABLE IF NOT EXISTS `sys_transactions` (
`id` int(11) NOT NULL,
  `account` varchar(200) NOT NULL,
  `type` enum('Income','Expense','Transfer') NOT NULL,
  `category` varchar(200) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `payer` varchar(200) NOT NULL,
  `payee` varchar(200) NOT NULL,
  `method` varchar(200) NOT NULL,
  `ref` varchar(200) NOT NULL,
  `status` enum('Cleared','Uncleared','Reconciled','Void') NOT NULL DEFAULT 'Cleared',
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `tax` decimal(18,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL,
  `dr` decimal(18,2) NOT NULL DEFAULT '0.00',
  `cr` decimal(18,2) NOT NULL DEFAULT '0.00',
  `bal` decimal(18,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_users`
--

CREATE TABLE IF NOT EXISTS `sys_users` (
`id` int(10) unsigned NOT NULL,
  `username` varchar(45) NOT NULL DEFAULT '',
  `fullname` varchar(45) NOT NULL DEFAULT '',
  `phonenumber` varchar(20) DEFAULT NULL,
  `password` text NOT NULL,
  `user_type` enum('Admin','Employee') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `last_login` datetime DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `creationdate` datetime NOT NULL,
  `otp` enum('Yes','No') NOT NULL DEFAULT 'No',
  `pin_enabled` enum('Yes','No') NOT NULL DEFAULT 'No',
  `pin` text NOT NULL,
  `api` enum('Yes','No') DEFAULT 'No'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sys_users`
--

INSERT INTO `sys_users` (`id`, `username`, `fullname`, `phonenumber`, `password`, `user_type`, `status`, `last_login`, `email`, `creationdate`, `otp`, `pin_enabled`, `pin`, `api`) VALUES
(1, 'admin', 'Sadia Sharmin', '', '$1$RI4.GC/.$efiNhnsEO8nmgG07WQPqM0', 'Admin', 'Active', '2014-12-16 12:26:47', 'me@sadiasharmin.com', '2014-06-23 01:43:07', 'No', 'No', '$1$ZW/.uF5.$.rwCeLiguoBzYzf3waOnY1', 'No');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sys_accounts`
--
ALTER TABLE `sys_accounts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_appconfig`
--
ALTER TABLE `sys_appconfig`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_cats`
--
ALTER TABLE `sys_cats`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_payee`
--
ALTER TABLE `sys_payee`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_payers`
--
ALTER TABLE `sys_payers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_pmethods`
--
ALTER TABLE `sys_pmethods`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_repeating`
--
ALTER TABLE `sys_repeating`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_sales`
--
ALTER TABLE `sys_sales`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_transactions`
--
ALTER TABLE `sys_transactions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_users`
--
ALTER TABLE `sys_users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sys_accounts`
--
ALTER TABLE `sys_accounts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `sys_appconfig`
--
ALTER TABLE `sys_appconfig`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `sys_cats`
--
ALTER TABLE `sys_cats`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `sys_payee`
--
ALTER TABLE `sys_payee`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `sys_payers`
--
ALTER TABLE `sys_payers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `sys_pmethods`
--
ALTER TABLE `sys_pmethods`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sys_repeating`
--
ALTER TABLE `sys_repeating`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=319;
--
-- AUTO_INCREMENT for table `sys_sales`
--
ALTER TABLE `sys_sales`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_transactions`
--
ALTER TABLE `sys_transactions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `sys_users`
--
ALTER TABLE `sys_users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
