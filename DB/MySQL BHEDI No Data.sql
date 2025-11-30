-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 30, 2025 at 04:05 PM
-- Server version: 8.0.44-0ubuntu0.24.04.1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BHEDI`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblEDISegment`
--

CREATE TABLE `tblEDISegment` (
  `SegmentNo` int NOT NULL,
  `SegmentCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

--
-- Dumping data for table `tblEDISegment`
--

INSERT INTO `tblEDISegment` (`SegmentNo`, `SegmentCode`) VALUES
(1, 'LH4'),
(2, 'CID'),
(3, 'LIN'),
(4, 'GF'),
(5, 'PKG'),
(6, 'TXI'),
(7, 'IT3'),
(8, 'PAL'),
(9, 'QTY'),
(10, 'AT'),
(11, 'TSD'),
(12, 'CRC'),
(13, 'LX'),
(14, 'NTE'),
(15, 'CAD'),
(16, 'MEA'),
(17, 'CTX'),
(18, 'P4'),
(19, 'ADX'),
(20, 'PO3'),
(21, 'PRT'),
(22, 'MSG'),
(23, 'NAD'),
(24, 'BPR'),
(25, 'ATH'),
(26, 'LS'),
(27, 'DED'),
(28, 'SSS'),
(29, 'EMS'),
(30, 'AK1'),
(31, 'G53'),
(32, 'ISA'),
(33, 'V1'),
(34, 'LQ'),
(35, 'BEG'),
(36, 'UIT'),
(37, 'FA1'),
(38, 'G93'),
(39, 'LFG'),
(40, 'YNQ'),
(41, 'VEH'),
(42, 'RPA'),
(43, 'DD'),
(44, 'AK2'),
(45, 'TAX'),
(46, 'TD5'),
(47, 'PRI'),
(48, 'TRN'),
(49, 'G61'),
(50, 'fa2'),
(51, 'PRR'),
(52, 'ITA'),
(53, 'ATN'),
(54, 'CTA'),
(55, 'CNT'),
(56, 'AK3'),
(57, 'RDM'),
(58, 'PCT'),
(59, 'PCI'),
(60, 'N9'),
(61, 'UCM'),
(62, 'CUR'),
(63, 'NM1'),
(64, 'AAA'),
(65, 'K1'),
(66, 'PID'),
(67, 'PKL'),
(68, 'R4'),
(69, 'DIS'),
(70, 'IMD'),
(71, 'SAC'),
(72, 'RED'),
(73, 'POC'),
(74, 'SDP'),
(75, 'TMD'),
(76, 'G36'),
(77, 'ADV'),
(78, 'G39'),
(79, 'LOC'),
(80, 'IT1'),
(81, 'BGN'),
(82, 'LHE'),
(83, 'UNS'),
(84, 'ITD'),
(85, 'SE'),
(86, 'UNT'),
(87, 'LM'),
(88, 'MAN'),
(89, 'TXP'),
(90, 'DTP'),
(91, 'SLN'),
(92, 'TD3'),
(93, 'RC'),
(94, 'LHT'),
(95, 'PAC'),
(96, 'CTT'),
(97, 'GIR'),
(98, 'X4'),
(99, 'BMG'),
(100, 'LE'),
(101, 'TC2'),
(102, 'PSC'),
(103, 'PO4'),
(104, 'SI'),
(105, 'AK5'),
(106, 'GS'),
(107, 'L7'),
(108, 'FST'),
(109, 'ENT'),
(110, 'SPI'),
(111, 'SDQ'),
(112, 'CSH'),
(113, 'LH1'),
(114, 'M10'),
(115, 'HL'),
(116, 'BCH'),
(117, 'RYL'),
(118, 'BFR'),
(119, 'SEQ'),
(120, 'AK4'),
(121, 'N1'),
(122, 'JIT'),
(123, 'RMR'),
(124, 'ISS'),
(125, 'G54'),
(126, 'PIA'),
(127, 'LDT'),
(128, 'ETD'),
(129, 'ALI'),
(130, 'BGM'),
(131, 'MTX'),
(132, 'INC'),
(133, 'XPO'),
(134, 'ST'),
(135, 'LH2'),
(136, 'BIG'),
(137, 'V9'),
(138, 'TDS'),
(139, 'SN1'),
(140, 'UNH'),
(141, 'DMG'),
(142, 'EFI'),
(143, 'MIT'),
(144, 'TD1'),
(145, 'BCT'),
(146, 'GIN'),
(147, 'BSN'),
(148, 'CUX'),
(149, 'COM'),
(150, 'PAM'),
(151, 'LEP'),
(152, 'PWK'),
(153, 'G40'),
(154, 'FTX'),
(155, 'RFF'),
(156, 'OTI'),
(157, 'UNB'),
(158, 'FOB'),
(159, 'REP'),
(160, 'BSS'),
(161, 'GIS'),
(162, 'REF'),
(163, 'TD4'),
(164, 'N2'),
(165, 'GEI'),
(166, 'UCI'),
(167, 'CN1'),
(168, 'NX2'),
(169, 'N3'),
(170, 'N7'),
(171, 'LFH'),
(172, 'INV'),
(173, 'G43'),
(174, 'LH3'),
(175, 'PRS'),
(176, 'CTB'),
(177, 'PRF'),
(178, 'SCH'),
(179, 'CLD'),
(180, 'SR'),
(181, 'AIN'),
(182, 'LHR'),
(183, 'GE'),
(184, 'CB1'),
(185, 'AMT'),
(186, 'AK9'),
(187, 'TDT'),
(188, 'PEN'),
(189, 'SCC'),
(190, 'TED'),
(191, 'IEA'),
(192, 'G55'),
(193, 'N4'),
(194, 'QVA'),
(195, 'PER'),
(196, 'G26'),
(197, 'QVR'),
(198, 'IN2'),
(199, 'SHP'),
(200, 'IT8'),
(201, 'PO1'),
(202, 'UNZ'),
(203, 'BAL'),
(204, 'DOC'),
(205, 'CTP'),
(206, 'AT9'),
(207, 'CRD'),
(208, 'PYD'),
(209, 'ASM'),
(210, 'DTM'),
(211, 'BRA'),
(212, 'RCD'),
(213, 'LH4'),
(214, 'CID'),
(215, 'LIN'),
(216, 'GF'),
(217, 'PKG'),
(218, 'TXI'),
(219, 'IT3'),
(220, 'PAL'),
(221, 'QTY'),
(222, 'AT'),
(223, 'TSD'),
(224, 'CRC'),
(225, 'LX'),
(226, 'NTE'),
(227, 'CAD'),
(228, 'MEA'),
(229, 'CTX'),
(230, 'P4'),
(231, 'ADX'),
(232, 'PO3'),
(233, 'PRT'),
(234, 'MSG'),
(235, 'NAD'),
(236, 'BPR'),
(237, 'ATH'),
(238, 'LS'),
(239, 'DED'),
(240, 'SSS'),
(241, 'EMS'),
(242, 'AK1'),
(243, 'G53'),
(244, 'ISA'),
(245, 'V1'),
(246, 'CED'),
(247, 'LQ'),
(248, 'BEG'),
(249, 'UIT'),
(250, 'FA1'),
(251, 'EQD'),
(252, 'G93'),
(253, 'LFG'),
(254, 'YNQ'),
(255, 'VEH'),
(256, 'RPA'),
(257, 'DD'),
(258, 'AK2'),
(259, 'TAX'),
(260, 'TD5'),
(261, 'PRI'),
(262, 'TRN'),
(263, 'G61'),
(264, 'fa2'),
(265, 'PRR'),
(266, 'ITA'),
(267, 'ATN'),
(268, 'CTA'),
(269, 'CNT'),
(270, 'AK3'),
(271, 'RDM'),
(272, 'PCT'),
(273, 'PCI'),
(274, 'N9'),
(275, 'UCM'),
(276, 'CUR'),
(277, 'NM1'),
(278, 'AAA'),
(279, 'K1'),
(280, 'PID'),
(281, 'PKL'),
(282, 'R4'),
(283, 'DIS'),
(284, 'IMD'),
(285, 'DLM'),
(286, 'SAC'),
(287, 'RED'),
(288, 'BRA'),
(289, 'POC'),
(290, 'SDP'),
(291, 'TMD'),
(292, 'G36'),
(293, 'ADV'),
(294, 'G39'),
(295, 'LOC'),
(296, 'IT1'),
(297, 'BGN'),
(298, 'LHE'),
(299, 'UNS'),
(300, 'ITD'),
(301, 'SE'),
(302, 'UNT'),
(303, 'LM'),
(304, 'MAN'),
(305, 'TXP'),
(306, 'DTP'),
(307, 'SLN'),
(308, 'TD3'),
(309, 'RC'),
(310, 'LHT'),
(311, 'RCD'),
(312, 'DGS'),
(313, 'PAC'),
(314, 'CTT'),
(315, 'GIR'),
(316, 'X4'),
(317, 'BMG'),
(318, 'LE'),
(319, 'TC2'),
(320, 'PSC'),
(321, 'PO4'),
(322, 'CPS'),
(323, 'SI'),
(324, 'AK5'),
(325, 'GS'),
(326, 'L7'),
(327, 'FST'),
(328, 'ENT'),
(329, 'SPI'),
(330, 'SDQ'),
(331, 'CSH'),
(332, 'COD'),
(333, 'SGP'),
(334, 'LH1'),
(335, 'M10'),
(336, 'HL'),
(337, 'BCH'),
(338, 'RYL'),
(339, 'BFR'),
(340, 'SEQ'),
(341, 'AK4'),
(342, 'N1'),
(343, 'JIT'),
(344, 'SEL'),
(345, 'RMR'),
(346, 'ISS'),
(347, 'G54'),
(348, 'PIA'),
(349, 'LDT'),
(350, 'ETD'),
(351, 'ALI'),
(352, 'BGM'),
(353, 'MTX'),
(354, 'INC'),
(355, 'XPO'),
(356, 'ST'),
(357, 'LH2'),
(358, 'BIG'),
(359, 'V9'),
(360, 'TDS'),
(361, 'SN1'),
(362, 'UNH'),
(363, 'DMG'),
(364, 'EFI'),
(365, 'MIT'),
(366, 'TD1'),
(367, 'BCT'),
(368, 'GIN'),
(369, 'BSN'),
(370, 'CUX'),
(371, 'PCD'),
(372, 'COM'),
(373, 'PAM'),
(374, 'LEP'),
(375, 'PWK'),
(376, 'G40'),
(377, 'FTX'),
(378, 'RFF'),
(379, 'OTI'),
(380, 'UNB'),
(381, 'FOB'),
(382, 'REP'),
(383, 'BSS'),
(384, 'GIS'),
(385, 'REF'),
(386, 'TD4'),
(387, 'N2'),
(388, 'GEI'),
(389, 'UCI'),
(390, 'CN1'),
(391, 'MOA'),
(392, 'NX2'),
(393, 'N3'),
(394, 'N7'),
(395, 'LFH'),
(396, 'INV'),
(397, 'G43'),
(398, 'LH3'),
(399, 'PRS'),
(400, 'CTB'),
(401, 'TOD'),
(402, 'PRF'),
(403, 'SCH'),
(404, 'CLD'),
(405, 'SR'),
(406, 'AIN'),
(407, 'LHR'),
(408, 'GE'),
(409, 'CB1'),
(410, 'AMT'),
(411, 'AK9'),
(412, 'TDT'),
(413, 'PEN'),
(414, 'SCC'),
(415, 'TED'),
(416, 'IEA'),
(417, 'G55'),
(418, 'N4'),
(419, 'QVA'),
(420, 'PER'),
(421, 'G26'),
(422, 'QVR'),
(423, 'HAN'),
(424, 'IN2'),
(425, 'SHP'),
(426, 'IT8'),
(427, 'PO1'),
(428, 'UNZ'),
(429, 'BAL'),
(430, 'DOC'),
(431, 'CTP'),
(432, 'AT9'),
(433, 'EQA'),
(434, 'CRD'),
(435, 'PYD'),
(436, 'ASM'),
(437, 'DTM'),
(438, 'ALC'),
(439, 'CDI'),
(440, 'INP'),
(441, 'J2X'),
(442, 'BPS'),
(443, 'ERC'),
(444, 'RMT'),
(445, 'BCD'),
(446, 'CDD'),
(447, 'N11'),
(448, 'SHD'),
(449, 'PYT'),
(450, 'RTE'),
(451, 'API'),
(452, 'MTD'),
(453, 'STG'),
(454, 'PAT'),
(455, 'RCS'),
(456, 'STS'),
(457, 'RJL'),
(458, 'PAI'),
(459, 'APR'),
(460, 'FII'),
(461, 'CCI'),
(462, 'CAV'),
(463, 'RNG'),
(464, '512'),
(465, '518'),
(466, '715'),
(467, '511'),
(468, '515'),
(469, '713'),
(470, '514'),
(471, '718'),
(472, '716'),
(473, '719'),
(474, '712'),
(475, '519'),
(476, '513'),
(477, '517'),
(478, '711'),
(479, '717'),
(480, '714'),
(481, 'CS'),
(482, 'BIA'),
(483, 'ACK'),
(484, 'BAK');

-- --------------------------------------------------------

--
-- Table structure for table `tblEDITransactionSet`
--

CREATE TABLE `tblEDITransactionSet` (
  `TransactionSetNo` int NOT NULL,
  `TransactionSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `InOut` tinyint(1) NOT NULL,
  `EDITypeNo_FK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

--
-- Dumping data for table `tblEDITransactionSet`
--

INSERT INTO `tblEDITransactionSet` (`TransactionSetNo`, `TransactionSetID`, `Description`, `InOut`, `EDITypeNo_FK`) VALUES
(1, '142', 'Product Service Claim', 0, 1),
(2, '810', 'Invoice', 1, 1),
(3, '820', 'Payment Order/Remittance Advice', 0, 1),
(4, '824', 'Application Advice', 0, 1),
(5, '830', 'Planning Schedule with Release Capability', 0, 1),
(6, '832', 'Price/Sales Catalog', 0, 1),
(7, '850', 'Purchase Order', 0, 1),
(8, '856', 'Ship Notice/Manifest', 1, 1),
(9, '856', 'Ship Notice/Manifest', 0, 1),
(10, '860', 'Purchase Order Change Request', 0, 1),
(11, '862', 'Shipping Schedule', 0, 1),
(12, '864', 'Text Message', 0, 1),
(13, '997', 'Functional Acknowledgment', 0, 1),
(14, '997', 'Functional Acknowledgment', 1, 1),
(15, 'CONTRL', 'Functional Acknowledgment', 1, 2),
(16, 'CONTRL', 'Functional Acknowledgment', 0, 2),
(17, 'DELFOR', 'Delivery Schedule Message', 0, 2),
(18, 'DELJIT', 'Delivery Just In Time Message', 0, 2),
(20, '861', 'Receiving Advice/Acceptance Certificate', 0, 1),
(21, '810', 'Invoice', 0, 1),
(22, 'DESADV', 'Despatch Advice', 1, 2),
(23, 'RECADV', 'Receiving Advise Message', 0, 2),
(24, 'APERAK', 'Application Acknowledgment Message ', 0, 2),
(25, '850', 'Purchase Order', 1, 1),
(26, '812', 'Credit/Debit Adjustment', 0, 1),
(27, 'ORDERS', 'Purchase Order', 0, 2),
(28, '4095', 'Delivery Call-Offs', 0, 3),
(29, '4913', 'Shipping Notice', 1, 3),
(30, '846', 'Inventory Inquiry/Advice', 0, 1),
(31, '855', 'Purchase Order Acknowledgment', 0, 1),
(32, '855', 'Purchase Order Acknowledgment', 1, 1),
(33, 'INVOIC', 'Invoice Message', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblEDITransactionStructure`
--

CREATE TABLE `tblEDITransactionStructure` (
  `StructureNo` int NOT NULL,
  `Version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TransactionSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FunctionGroup` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SegmentCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MinLength` int NOT NULL,
  `MaxLength` int NOT NULL,
  `EDITypeNo_FK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDITrasactionRawData`
--

CREATE TABLE `tblEDITrasactionRawData` (
  `TransactionRawDataNo` int NOT NULL,
  `TransactionDate` datetime NOT NULL,
  `TradingPartnerNo_FK` int NOT NULL,
  `TransactionSetNo_FK` int NOT NULL,
  `TransactionKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `InOut` tinyint(1) NOT NULL,
  `RawData` longtext NOT NULL,
  `XMLData` longtext NOT NULL,
  `InterchangeControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GroupControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDIType`
--

CREATE TABLE `tblEDIType` (
  `EDITypeNo` int NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

--
-- Dumping data for table `tblEDIType`
--

INSERT INTO `tblEDIType` (`EDITypeNo`, `Name`) VALUES
(1, 'X12'),
(2, 'EDIFACT'),
(3, 'VDA');

-- --------------------------------------------------------

--
-- Table structure for table `tblEDIVersion`
--

CREATE TABLE `tblEDIVersion` (
  `EDIVersionNo` int NOT NULL,
  `Version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EDITypeNo_FK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

--
-- Dumping data for table `tblEDIVersion`
--

INSERT INTO `tblEDIVersion` (`EDIVersionNo`, `Version`, `EDITypeNo_FK`) VALUES
(1, '002000', 1),
(2, '002001', 1),
(3, '002002', 1),
(4, '002003', 1),
(5, '002040', 1),
(6, '002042', 1),
(7, '003010', 1),
(8, '003011', 1),
(9, '003012', 1),
(10, '003020', 1),
(11, '003021', 1),
(12, '003022', 1),
(13, '003030', 1),
(14, '003031', 1),
(15, '003032', 1),
(16, '003040', 1),
(17, '003041', 1),
(18, '003042', 1),
(19, '003050', 1),
(20, '003051', 1),
(21, '003052', 1),
(22, '003060', 1),
(23, '003061', 1),
(24, '003062', 1),
(25, '003070', 1),
(26, '003071', 1),
(27, '003072', 1),
(28, '004010', 1),
(29, '004011', 1),
(30, '004012', 1),
(31, '004020', 1),
(32, '004021', 1),
(33, '004022', 1),
(34, '004030', 1),
(35, '004031', 1),
(36, '004032', 1),
(37, '004040', 1),
(38, '004041', 1),
(39, '004042', 1),
(40, '004050', 1),
(41, '004051', 1),
(42, '004060', 1),
(43, '004061', 1),
(44, '005010', 1),
(45, '005011', 1),
(46, '005020', 1),
(47, '005021', 1),
(48, '005022', 1),
(49, '005030', 1),
(50, '005031', 1),
(51, '005032', 1),
(52, '005040', 1),
(53, '005041', 1),
(54, '005042', 1),
(55, '005050', 1),
(56, '006010', 1),
(57, '006020', 1),
(58, 'D00A', 2),
(59, 'D00B', 2),
(60, 'D01A', 2),
(61, 'D01B', 2),
(62, 'D02A', 2),
(63, 'D02B', 2),
(64, 'D03A', 2),
(65, 'D03B', 2),
(66, 'D04A', 2),
(67, 'D04B', 2),
(68, 'D05A', 2),
(69, 'D05B', 2),
(70, 'D06A', 2),
(71, 'D06B', 2),
(72, 'D07A', 2),
(73, 'D07B', 2),
(74, 'D08A', 2),
(75, 'D08B', 2),
(76, 'D09A', 2),
(77, 'D09B', 2),
(78, 'D10A', 2),
(79, 'D10B', 2),
(80, 'D11A', 2),
(81, 'D11B', 2),
(82, 'D12A', 2),
(83, 'D12B', 2),
(84, 'D13A', 2),
(85, 'D13B', 2),
(86, 'D14A', 2),
(87, 'D93A', 2),
(88, 'D94A', 2),
(89, 'D94B', 2),
(90, 'D95A', 2),
(91, 'D95B', 2),
(92, 'D96A', 2),
(93, 'D96B', 2),
(94, 'D97A', 2),
(95, 'D97B', 2),
(96, 'D98A', 2),
(97, 'D98B', 2),
(98, 'D99A', 2),
(99, 'D99B', 2),
(100, '01', 3),
(101, '02', 3),
(102, '002002FORD', 1),
(103, '002040CHRY', 1),
(104, '008010', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_142_AMT`
--

CREATE TABLE `tblEDI_142_AMT` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AmtKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AmountQualifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_142_DETAIL`
--

CREATE TABLE `tblEDI_142_DETAIL` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AssignedIdentification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ModelCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ModelCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VehicleIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VehicleIDNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EngineNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EngineNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EngineModelQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EngineModel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PrimaryFailedPartQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PrimaryFailedPart` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ModelYearQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ModelYear` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartNumCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartNumCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDescQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDesc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QuanityQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitMeasureCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_142_DTM`
--

CREATE TABLE `tblEDI_142_DTM` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Qualifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dtmDate` datetime DEFAULT NULL,
  `Century` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_142_HEADER`
--

CREATE TABLE `tblEDI_142_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `WarrantyClaimRefNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SubmitDateTime` datetime DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_142_IT1`
--

CREATE TABLE `tblEDI_142_IT1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `It1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LaborHours` double DEFAULT NULL,
  `UnitMeasurementCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LaborCost` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_142_LINE`
--

CREATE TABLE `tblEDI_142_LINE` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AssignedNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReceiverClaimNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReceiverClaimNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BussinessTypeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BussinessType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `StateCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `StateCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdjustmentMemoQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdjustmentMemoNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DistributorClaimNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DistributorClaimNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DistributorCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DistributorCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DistributorNameQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DistributorName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ClaimClassCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ClaimClassCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ClaimClassCodeDescQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ClaimClassCodeDesc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MajorModelSeriesQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MajorModelSeries` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MajorModelDescQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MajorModelDesc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_142_MSG`
--

CREATE TABLE `tblEDI_142_MSG` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PrrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MsgKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_142_N1`
--

CREATE TABLE `tblEDI_142_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SplIDCodeQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CorpName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCACCodeQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCACCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_142_PRR`
--

CREATE TABLE `tblEDI_142_PRR` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PrrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ComplaintCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_142_REP`
--

CREATE TABLE `tblEDI_142_REP` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RepKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IDQualifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_142_SSS`
--

CREATE TABLE `tblEDI_142_SSS` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SssKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Indicator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AgencyQualifierCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SpecialServicesCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Rate` double DEFAULT NULL,
  `TotalAmount` double DEFAULT NULL,
  `SupplierAmount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_810_HEADER`
--

CREATE TABLE `tblEDI_810_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `InvoiceDate` datetime DEFAULT NULL,
  `InvoiceNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TranTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CurrencyCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TermsBasisDateCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TermsDiscPercent` double DEFAULT NULL,
  `TermsDiscDaysDue` int DEFAULT NULL,
  `TermsNetDueDate` datetime DEFAULT NULL,
  `TermsNetDays` int DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SubmitDateTime` datetime DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `TaxTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TaxAmount` double DEFAULT NULL,
  `TaxPercent` double DEFAULT NULL,
  `TaxIDNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_810_LINE`
--

CREATE TABLE `tblEDI_810_LINE` (
  `NO` int NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QtyInvoiced` double DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `UnitPriceCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ItemDescType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_810_N1`
--

CREATE TABLE `tblEDI_810_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_812_HEADER`
--

CREATE TABLE `tblEDI_812_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubmitDateTime` datetime DEFAULT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdjustmentNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdjustmentDate` datetime DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `TotalAdjustmentAmount` double DEFAULT NULL,
  `CreditDebitType` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `InvoiceNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PONumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransactionType` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateDate` datetime DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnEmailFlag` tinyint(1) DEFAULT '0',
  `blnEmailErrorFlag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_812_LINE`
--

CREATE TABLE `tblEDI_812_LINE` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProdIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BuyersPartID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDescQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdjReasonCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreditDebitType` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdjustmentAmount` double DEFAULT NULL,
  `AdjustmentQty` int DEFAULT NULL,
  `UOM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `ChargeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ChargeDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_812_N1`
--

CREATE TABLE `tblEDI_812_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SplIDCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CorpName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_812_REF`
--

CREATE TABLE `tblEDI_812_REF` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RefQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_820_ADX`
--

CREATE TABLE `tblEDI_820_ADX` (
  `NO` int NOT NULL,
  `AdxKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdjMonetaryAmount` double DEFAULT NULL,
  `AdjReasonCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdjIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdjReferenceID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_820_DTM`
--

CREATE TABLE `tblEDI_820_DTM` (
  `NO` int NOT NULL,
  `DtmKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdxKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IT1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RMRKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_820_HEADER`
--

CREATE TABLE `tblEDI_820_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransHandlingCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TotalPaymentAmount` double DEFAULT NULL,
  `CreditDebitFlagCode` varchar(50) DEFAULT NULL,
  `PaymentMethodCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PaymentFormatCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SupplierIDNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SupplierID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SupplierAcctNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SupplierAcctNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RemittanceDate` datetime DEFAULT NULL,
  `TraceTypeNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TraceRefNum1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OrgCompanyID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TraceRefNum2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CurrencyCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SubmitDateTime` datetime DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnImportSimply` tinyint(1) DEFAULT '0',
  `blnEmailFlag` tinyint(1) DEFAULT '0',
  `blnEmailErrorFlag` tinyint(1) DEFAULT '0',
  `blnImport` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_820_IT1`
--

CREATE TABLE `tblEDI_820_IT1` (
  `NO` int NOT NULL,
  `IT1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdxKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RMRKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QtyInvoiced` double DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `UnitPriceCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_820_LINE`
--

CREATE TABLE `tblEDI_820_LINE` (
  `NO` int NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AssignedNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EntityIDCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipToCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipToIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipToCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipToNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TaxIDNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TaxPaymentTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TaxDate` datetime DEFAULT NULL,
  `TaxInfoID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TaxAmount` double DEFAULT NULL,
  `LoopHeaderIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LoopTrailerIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_820_N1`
--

CREATE TABLE `tblEDI_820_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNum1Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNum1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNum2Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNum2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EmailQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PlantID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_820_REF`
--

CREATE TABLE `tblEDI_820_REF` (
  `NO` int NOT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdxKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IT1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RMRKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_820_RMR`
--

CREATE TABLE `tblEDI_820_RMR` (
  `NO` int NOT NULL,
  `RMRKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RemittanceIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RemittanceID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RemittancePayActionCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NetAmount` double DEFAULT NULL,
  `GrossAmount` double DEFAULT NULL,
  `DiscountAmount` double DEFAULT NULL,
  `AdjReasonCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_820_SAC`
--

CREATE TABLE `tblEDI_820_SAC` (
  `NO` int NOT NULL,
  `SACKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdxKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RMRKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IT1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ChargeID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ChargeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Rate` double DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `ChargeHandlingCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ChargeNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_820_SLN`
--

CREATE TABLE `tblEDI_820_SLN` (
  `NO` int NOT NULL,
  `SLNKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdxKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IT1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RelationshipCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `BasisofUnitPriceCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_820_TAX`
--

CREATE TABLE `tblEDI_820_TAX` (
  `NO` int NOT NULL,
  `TaxKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TaxIDNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TaxPaymentTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TaxDate` datetime DEFAULT NULL,
  `TaxInfoID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TaxAmount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_824_DETAIL`
--

CREATE TABLE `tblEDI_824_DETAIL` (
  `NO` int NOT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ApplErrConditionCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ErrorDescrp` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ErrorData` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_824_DTM`
--

CREATE TABLE `tblEDI_824_DTM` (
  `NO` int NOT NULL,
  `DtmKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `TimeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_824_HEADER`
--

CREATE TABLE `tblEDI_824_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ApplicationAdviceNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SubmitDateTime` datetime DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnEmailFlag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_824_LINE`
--

CREATE TABLE `tblEDI_824_LINE` (
  `NO` int NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AppAcknowledgmentCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OrgDocumentNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OrgDocumentNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OrgCreateDateTime` datetime DEFAULT NULL,
  `TranSetIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_824_N1`
--

CREATE TABLE `tblEDI_824_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_824_NTE`
--

CREATE TABLE `tblEDI_824_NTE` (
  `NO` int NOT NULL,
  `NteKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NoteRefCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_824_QTY`
--

CREATE TABLE `tblEDI_824_QTY` (
  `NO` int NOT NULL,
  `QtyKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QtyQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_824_REF`
--

CREATE TABLE `tblEDI_824_REF` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RefQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_830_ATH`
--

CREATE TABLE `tblEDI_830_ATH` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AthKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ResourceAuthCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ResourceAuth_ThruDate` datetime DEFAULT NULL,
  `CumAthQty` double DEFAULT NULL,
  `CumStartDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_830_DETAIL`
--

CREATE TABLE `tblEDI_830_DETAIL` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FstQty` double DEFAULT NULL,
  `DiffQty` double DEFAULT NULL,
  `ForecastQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ForecastTimeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DatePeriodStart` datetime DEFAULT NULL,
  `DatePeriodEnd` datetime DEFAULT NULL,
  `DateTimeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipPatternCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipPatternTimeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReleaseNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_830_DTM`
--

CREATE TABLE `tblEDI_830_DTM` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Qualifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dtmDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_830_HEADER`
--

CREATE TABLE `tblEDI_830_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubmitDateTime` datetime DEFAULT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReferenceID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReleaseNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ScheduleTypeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ScheduleQtyQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ForecastHorizonDateStart` datetime DEFAULT NULL,
  `ForecastHorizonEndDate` datetime DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `ContactNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminFuncCode_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminContact_hdr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminCommNumQual_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminPhone_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Note` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RtgSeqCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IDCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCACCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransportationType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CummsDateStart` datetime DEFAULT NULL,
  `PlantID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PONum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PlantName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CorpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PlannerName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CTT01` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CTT02` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DateQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnEmailFlag` tinyint(1) DEFAULT '0',
  `blnExportExcel` tinyint(1) DEFAULT NULL,
  `blnEmailErrorFlag` tinyint(1) DEFAULT '0',
  `blnImport` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_830_LINE`
--

CREATE TABLE `tblEDI_830_LINE` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProdIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BuyersPartID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdServiceQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PONum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDescQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReleaseNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReleaseNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubLineAssignID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubLineConfigCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubLineQty` int DEFAULT NULL,
  `SubLineUOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubLineProdServQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubLineProdServID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartRelStatusCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartRelDescription` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdItmDescType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdItmCharCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdItmDescription` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MeasurementRefID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MeasurementQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MeasurementVal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UoBMeasurementCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RangeMax` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RoutingSeqCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IDCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransMethodCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminFuncCode_lin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminContact_lin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminCommNumQual_lin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminPhone_lin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MarksNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MarksNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QtyPerCont` int DEFAULT NULL,
  `ContType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `ReferenceNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SupplierPartID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DCPartLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BuyersEngChangeLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EngChangeLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CTT01` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CTT02` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_830_N1`
--

CREATE TABLE `tblEDI_830_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SplIDCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CorpName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_830_REF`
--

CREATE TABLE `tblEDI_830_REF` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShpKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RefQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_830_SHP`
--

CREATE TABLE `tblEDI_830_SHP` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShpKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `QtyQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipQty` double DEFAULT NULL,
  `DateQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BegInventoryDate` datetime DEFAULT NULL,
  `LastShipDate` datetime DEFAULT NULL,
  `ShipDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_830_SLN`
--

CREATE TABLE `tblEDI_830_SLN` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SlnKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ConfigCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `UOM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdServiceIDQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdServiceID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdServiceIDQual2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdServiceID2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_832_DETAIL`
--

CREATE TABLE `tblEDI_832_DETAIL` (
  `NO` int NOT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PriceIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `PricingQty` double DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CurrencyCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_832_DTM`
--

CREATE TABLE `tblEDI_832_DTM` (
  `NO` int NOT NULL,
  `DtmKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_832_HEADER`
--

CREATE TABLE `tblEDI_832_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CatalogPurposeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurposeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DateQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SubmitDateTime` datetime DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_832_LINE`
--

CREATE TABLE `tblEDI_832_LINE` (
  `NO` int NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BuyersPartID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DCPartLevelQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DCPartLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDscrptQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_832_N1`
--

CREATE TABLE `tblEDI_832_N1` (
  `NO` int NOT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CorporateName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNum1Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNum1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNum2Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNum2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EmailQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PlantID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_832_REF`
--

CREATE TABLE `tblEDI_832_REF` (
  `NO` int NOT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PriceQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PriceReference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PriceRefDescrp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_846_DETAIL`
--

CREATE TABLE `tblEDI_846_DETAIL` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UOM` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `UnitPriceCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QtyQual` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Qty` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_846_DTM`
--

CREATE TABLE `tblEDI_846_DTM` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DtmQual` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `TimeCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_846_HEADER`
--

CREATE TABLE `tblEDI_846_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubmitDateTime` datetime DEFAULT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReportTypeCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReferenceNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `ActionCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateDate` datetime DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnEmailFlag` tinyint(1) DEFAULT '0',
  `blnEmailErrorFlag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_846_LINE`
--

CREATE TABLE `tblEDI_846_LINE` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID1Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID2Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID3Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID4Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID4` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID5Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID5` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_846_N1`
--

CREATE TABLE `tblEDI_846_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_846_REF`
--

CREATE TABLE `tblEDI_846_REF` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RefQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_CTP`
--

CREATE TABLE `tblEDI_850_CTP` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CtpKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PriceIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_DTM`
--

CREATE TABLE `tblEDI_850_DTM` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_HEADER`
--

CREATE TABLE `tblEDI_850_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubmitDateTime` datetime DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `POTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PONum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReleaseNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PODate` datetime DEFAULT NULL,
  `NTE_NoteRefCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NTE_FreeFormMsg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EntityIDCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ExchangeRate` double DEFAULT NULL,
  `FOBShpMethod` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FOBLocationQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FOBDescription` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FOBLocationQual2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FOBDescription2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransMethod` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CarrierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `AdminFuncCode_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminContact_hdr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminCommNumQual_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminPhone_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CTPClass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STPPriceQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TextMessageCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Check864` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `FOBTransTermsQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FOBTransTermsCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnEmailFlag` tinyint(1) DEFAULT '0',
  `blnEmailErrorFlag` tinyint(1) DEFAULT '0',
  `blnImport` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_ITA`
--

CREATE TABLE `tblEDI_850_ITA` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ItaKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AllowanceID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SpecialServiceCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AllowanceMethodofHdlCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AllowanceNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AllowanceTtlAmt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UBMsrCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SpecialChargeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_ITD`
--

CREATE TABLE `tblEDI_850_ITD` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ItdKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TermsTypeCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TermsBasisDateCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TermsDiscountPercent` double DEFAULT NULL,
  `TermsDiscountDueDate` datetime DEFAULT NULL,
  `TermsDiscountDaysDue` int DEFAULT NULL,
  `TermsNetDueDate` datetime DEFAULT NULL,
  `TermsNetDays` int DEFAULT NULL,
  `TermsDiscountAmt` double DEFAULT NULL,
  `TermsDifferredDueDate` datetime DEFAULT NULL,
  `DifferredAmtDue` double DEFAULT NULL,
  `PctOfInvoicePayable` double DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DayOfMonth` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_LINE`
--

CREATE TABLE `tblEDI_850_LINE` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PONum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `POLineNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QtyOrdered` double DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `MfgBasePartNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BuyersPartID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DCPartLevelQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DCPartLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDescQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProjectNumQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProjectNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EntityIDCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CurrencyCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BuyersEngChangeLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EngChangeLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_N1`
--

CREATE TABLE `tblEDI_850_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SplIDCodeQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CorpName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCACCodeQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCACCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_N9`
--

CREATE TABLE `tblEDI_850_N9` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N9Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RefQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Msg` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_NTE`
--

CREATE TABLE `tblEDI_850_NTE` (
  `NO` int NOT NULL,
  `NteKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NoteRefCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_PID`
--

CREATE TABLE `tblEDI_850_PID` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PidKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ItemDescType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProductCharCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ItemDescQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProductDescCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SLPCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SlnKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_PO3`
--

CREATE TABLE `tblEDI_850_PO3` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PO3Key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ChangeReasonCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PriceQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `BasisOfUnitPriceCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitBasisMsrCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_REF`
--

CREATE TABLE `tblEDI_850_REF` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RefQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_SAC`
--

CREATE TABLE `tblEDI_850_SAC` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SacKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AllowanceChargeIndicator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SACCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AgencyQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AgencyCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `MethodHandlingCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_SCH`
--

CREATE TABLE `tblEDI_850_SCH` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SchKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `UOM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmReqQual` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DeliveryReqDate` datetime DEFAULT NULL,
  `DtmPromisedQual` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DeliveryPromisedDate` datetime DEFAULT NULL,
  `ContainerQty` int DEFAULT NULL,
  `ContainerType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_SHH`
--

CREATE TABLE `tblEDI_850_SHH` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShhKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SchedulingCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_850_SLN`
--

CREATE TABLE `tblEDI_850_SLN` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SlnKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RelationshipCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProductIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProductID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_856_DTM`
--

CREATE TABLE `tblEDI_856_DTM` (
  `NO` int NOT NULL,
  `DtmKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_856_HEADER`
--

CREATE TABLE `tblEDI_856_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ASNNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SubmitDateTime` datetime DEFAULT NULL,
  `DateQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipDate` datetime DEFAULT NULL,
  `HashTotal` int DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnEmailFlag` tinyint(1) DEFAULT '0',
  `blnEmailErrorFlag` tinyint(1) DEFAULT '0',
  `blnImport` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_856_HL2`
--

CREATE TABLE `tblEDI_856_HL2` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HL2Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HLIDNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HLParentIDNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HLCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PkgIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PkgType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReturnSNIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReturnSN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MasterMixLabelQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MasterMixSN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_856_HL2_HL3`
--

CREATE TABLE `tblEDI_856_HL2_HL3` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HL2HL3Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HLIDNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HLParentIDNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HLCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PkgIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PkgType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReturnSNIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReturnSN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MasterMixLabelQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MasterMixSN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartNoQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DCPartLevelQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DCPartLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LotNoQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LotNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipSchedQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipSchedNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProjNoQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProjNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `POQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PONo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag1Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag1No` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag1ReasonQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag1ReasonCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag2Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag2No` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag2ReasonQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag2ReasonCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SupplierLotNoQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SupplierLotNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContPkgIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContPkgType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CountryOfOrgQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CountryOfOrg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContLabelQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContLabelSN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_856_HL3`
--

CREATE TABLE `tblEDI_856_HL3` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HL2Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HL3Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HLIDNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HLParentIDNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HLCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartNoQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DCPartLevelQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DCPartLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LotNoQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LotNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipSchedQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipSchedNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProjNoQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProjNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `POQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PONo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag1Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag1No` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag1ReasonQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag1ReasonCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag2Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag2No` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag2ReasonQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IPPTag2ReasonCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SupplierLotNoQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SupplierLotNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReturnSNIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReturnSN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContPkgIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContPkgType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CountryOfOrgQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CountryOfOrg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContLabelQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContLabelSN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_856_LINE`
--

CREATE TABLE `tblEDI_856_LINE` (
  `NO` int NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HLIDNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HLCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `WeightQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Weight` double DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCACCodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCACCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TrackingNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EquipDescCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TrailerNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SpecialHandlingCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BOLQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BOLNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_856_N1`
--

CREATE TABLE `tblEDI_856_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_856_QTY`
--

CREATE TABLE `tblEDI_856_QTY` (
  `NO` int NOT NULL,
  `QtyKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HL3Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HL2Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QtyQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Measurement` double DEFAULT NULL,
  `UnitMeasure` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_856_REF`
--

CREATE TABLE `tblEDI_856_REF` (
  `NO` int NOT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HL3Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HL2Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_CTP`
--

CREATE TABLE `tblEDI_860_CTP` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CtpKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PriceIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_DTM`
--

CREATE TABLE `tblEDI_860_DTM` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_HEADER`
--

CREATE TABLE `tblEDI_860_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubmitDateTime` datetime DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `POTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PONum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ChangeOrderSeqNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PODate` datetime DEFAULT NULL,
  `EntityIDCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ExchangeRate` double DEFAULT NULL,
  `FOBShpMethod` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FOBLocationQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FOBDescription` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FOBLocationQual2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FOBDescription2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransMethod` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CarrierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `AdminFuncCode_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminContact_hdr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminCommNumQual_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminPhone_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CTPClass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STPPriceQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TextMessageCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Check864` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `ReleaseNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FOBTransTermsQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FOBTransTermsCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnEmailFlag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_ITA`
--

CREATE TABLE `tblEDI_860_ITA` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ItaKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AllowanceID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SpecialServiceCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AllowanceMethodofHdlCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AllowanceNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AllowanceTtlAmt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UBMsrCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SpecialChargeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_ITD`
--

CREATE TABLE `tblEDI_860_ITD` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ItdKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TermsTypeCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TermsBasisDateCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TermsDiscountPercent` double DEFAULT NULL,
  `TermsDiscountDueDate` datetime DEFAULT NULL,
  `TermsDiscountDaysDue` int DEFAULT NULL,
  `TermsNetDueDate` datetime DEFAULT NULL,
  `TermsNetDays` int DEFAULT NULL,
  `TermsDiscountAmt` double DEFAULT NULL,
  `TermsDifferredDueDate` datetime DEFAULT NULL,
  `DifferredAmtDue` double DEFAULT NULL,
  `PctOfInvoicePayable` double DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DayOfMonth` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_LINE`
--

CREATE TABLE `tblEDI_860_LINE` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PONum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `POLineNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineItemChange` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QtyOrdered` double DEFAULT NULL,
  `QtyLeftToRcv` double DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `ProdID1Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID2Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID3Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdID3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CurrencyCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UOMCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_MSG`
--

CREATE TABLE `tblEDI_860_MSG` (
  `NO` int NOT NULL,
  `MsgKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `N9Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MsgText` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_N1`
--

CREATE TABLE `tblEDI_860_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SplIDCodeQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCACCodeQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCACCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CorpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommQual2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommNum2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_N9`
--

CREATE TABLE `tblEDI_860_N9` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N9Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RefQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Msg` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_NTE`
--

CREATE TABLE `tblEDI_860_NTE` (
  `NO` int NOT NULL,
  `NteKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NoteRefCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N9Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_PID`
--

CREATE TABLE `tblEDI_860_PID` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PidKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ItemDescType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProductCharCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ItemDescQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProductDescCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SLPCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SlnKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_PKG`
--

CREATE TABLE `tblEDI_860_PKG` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PkgKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ItemDescrpType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PkgCharCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PkgDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_PO3`
--

CREATE TABLE `tblEDI_860_PO3` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PO3Key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ChangeReasonCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PriceQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `BasisOfUnitPriceCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitBasisMsrCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_REF`
--

CREATE TABLE `tblEDI_860_REF` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RefQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_SAC`
--

CREATE TABLE `tblEDI_860_SAC` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SacKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AllowanceChargeIndicator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SACCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AgencyQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AgencyCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `MethodHandlingCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_SCH`
--

CREATE TABLE `tblEDI_860_SCH` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SchKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `UOM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmReqQual` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DeliveryReqDate` datetime DEFAULT NULL,
  `DtmPromisedQual` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DeliveryPromisedDate` datetime DEFAULT NULL,
  `ContainerQty` int DEFAULT NULL,
  `ContainerType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_SHH`
--

CREATE TABLE `tblEDI_860_SHH` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShhKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SchedulingCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_SLN`
--

CREATE TABLE `tblEDI_860_SLN` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SlnKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RelationshipCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProductIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProductID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_860_TD5`
--

CREATE TABLE `tblEDI_860_TD5` (
  `NO` int NOT NULL,
  `TD5Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransMethod` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CarrierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_861_DTM`
--

CREATE TABLE `tblEDI_861_DTM` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `TimeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_861_HEADER`
--

CREATE TABLE `tblEDI_861_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReceivingAdviceNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReceivingAdviceTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `DateQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReceiptDateTime` datetime DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SubmitDateTime` datetime DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnEmailFlag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_861_LINE`
--

CREATE TABLE `tblEDI_861_LINE` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RecvdQty` double DEFAULT NULL,
  `RecvdQtyUOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RecvdConditionCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReturnQty` double DEFAULT NULL,
  `ReturnQtyUOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QuestionQty` double DEFAULT NULL,
  `QuestionQtyUOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QuestionConditionCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Question2Qty` double DEFAULT NULL,
  `Question2QtyUOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Question2ConditionCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShippedUnit` double DEFAULT NULL,
  `ShippedUnitUOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BuyersPartID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProdIDQual2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BuyersEngChangeLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipScheduleQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipScheduleNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProjNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProjNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `POQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PONum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContainerLabelSNQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContainerLabelSN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PalletLabelSNQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PalletLabelSN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BOLNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ASN_PLNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ItemDescriptionType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ItemDescriptionCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ItemDescription` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_861_N1`
--

CREATE TABLE `tblEDI_861_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_861_REF`
--

CREATE TABLE `tblEDI_861_REF` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RefQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_862_ATH`
--

CREATE TABLE `tblEDI_862_ATH` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AthKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ResourceAuthCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ResourceAuth_ThruDate` datetime DEFAULT NULL,
  `CumAthQty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AthQty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CumStartDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_862_DETAIL`
--

CREATE TABLE `tblEDI_862_DETAIL` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TotalDailyQty` double DEFAULT NULL,
  `DiffQty` double DEFAULT NULL,
  `ForecastQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ForecastTimeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FST_DeliveryShipmentDate` datetime DEFAULT NULL,
  `DateTimeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DeliveryShipDate` datetime DEFAULT NULL,
  `RefNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_862_DTM`
--

CREATE TABLE `tblEDI_862_DTM` (
  `NO` int NOT NULL,
  `HdrKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FstKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreateDateTime` datetime DEFAULT NULL,
  `TimeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_862_EXPORT`
--

CREATE TABLE `tblEDI_862_EXPORT` (
  `NO` int NOT NULL,
  `ExportNo` int NOT NULL,
  `JitKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ExportQty` double DEFAULT NULL,
  `PONum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PONum_Suffix` int DEFAULT NULL,
  `ExportDateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_862_HEADER`
--

CREATE TABLE `tblEDI_862_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubmitDateTime` datetime DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReferenceID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `ScheduleTypeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HorizonStartDate` datetime DEFAULT NULL,
  `HorizonEndDate` datetime DEFAULT NULL,
  `ReleaseNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PONum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ScheduleQtyQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminFuncCode_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminContact_hdr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminCommNumQual_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminPhone_hdr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnEmailFlag` tinyint(1) DEFAULT '0',
  `blnEmailErrorFlag` tinyint(1) DEFAULT '0',
  `blnImport` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_862_JIT`
--

CREATE TABLE `tblEDI_862_JIT` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JitKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Quantity` double DEFAULT NULL,
  `DeliveryShipTime` datetime DEFAULT NULL,
  `HondaLotNumberQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HondaLotNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SmallLotDeliveryBatchNumQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SmallLotDeliveryBatchNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LotSequenceNumQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LotSequenceNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipScheduleOrderNumQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipScheduleOrderNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnPrint` tinyint(1) DEFAULT NULL,
  `ShipmentTimeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipmentTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_862_LINE`
--

CREATE TABLE `tblEDI_862_LINE` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AssignedID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartIDQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BuyersPartID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DCPartLevelQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DCPartLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDescQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartLevelShipScheduleNumQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PartLevelShipScheduleNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProjectNoQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProjectNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PackagingCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QtyPerContainer` int DEFAULT NULL,
  `ContainerType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `WeightQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Weight` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TD1UOM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EquipDescCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EquipNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RoutingSeqCode` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCACCodeQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCACCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransMethodTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Routing` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipOrdStatusCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LocationQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LocationID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransDirectionCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransTimeDirectionQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `NoteRefCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FreeFormMsg` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminFuncCode_lin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminContact_lin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminCommNumQual_lin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdminPhone_lin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PalletType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_862_N1`
--

CREATE TABLE `tblEDI_862_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SqlNumQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CorpName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NNALogContact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Check864` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BuyerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RequestorName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_862_REF`
--

CREATE TABLE `tblEDI_862_REF` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShpKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RefQual` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RefNum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_862_SHP`
--

CREATE TABLE `tblEDI_862_SHP` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShpKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `QtyQual` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipQty` double DEFAULT NULL,
  `DateQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastShipDate` datetime DEFAULT NULL,
  `BegInventoryDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_864_DTM`
--

CREATE TABLE `tblEDI_864_DTM` (
  `NO` int NOT NULL,
  `DtmKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtmQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `TimeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_864_HEADER`
--

CREATE TABLE `tblEDI_864_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetPurpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SubmitDateTime` datetime DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnEmailFlag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_864_LINE`
--

CREATE TABLE `tblEDI_864_LINE` (
  `NO` int NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DocumentIDNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PageWidth` int DEFAULT NULL,
  `PageLengthLines` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_864_MSG`
--

CREATE TABLE `tblEDI_864_MSG` (
  `NO` int NOT NULL,
  `MsgKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MsgText` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CarriageControlCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_864_N1`
--

CREATE TABLE `tblEDI_864_N1` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `N1Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EntityIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodeQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CorporationName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AdditionalName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Zip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNum1Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNumber1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNum2Qual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactNumber2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_997_DETAIL`
--

CREATE TABLE `tblEDI_997_DETAIL` (
  `NO` int NOT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SegmentIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SegmentPosition` int DEFAULT NULL,
  `LoopIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SegmentCode1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SegmentCode2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SegmentCode3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SegmentCode4` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SegmentCode5` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ElementPosition` int DEFAULT NULL,
  `ElementRefNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ElementSyntaxErrorCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CopyBadDataElement` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_997_HEADER`
--

CREATE TABLE `tblEDI_997_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISAControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISASenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GSSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FunctionalIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GroupControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FunctionalGroupAckCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NumofTransSetsIncluded` int DEFAULT NULL,
  `NumofReceivedTransSets` int DEFAULT NULL,
  `NumofAcceptedTransSets` int DEFAULT NULL,
  `SubmitDateTime` datetime DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GeneratedDateTime` datetime DEFAULT NULL,
  `FunctionalGroupNoteCode1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FunctionalGroupNoteCode2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FunctionalGroupNoteCode3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FunctionalGroupNoteCode4` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FunctionalGroupNoteCode5` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `GSReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnEmailFlag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_997_LINE`
--

CREATE TABLE `tblEDI_997_LINE` (
  `NO` int NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TranSetIDCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TranSetControlNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TranSetAckCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TranSetSyntaxErrorCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TranSetNoteCode1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TranSetNoteCode2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TranSetNoteCode3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TranSetNoteCode4` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TranSetNoteCode5` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_4095_DETAIL`
--

CREATE TABLE `tblEDI_4095_DETAIL` (
  `NO` int NOT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VersionNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastReceiptDate` datetime DEFAULT NULL,
  `LastDeliveryNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastShipDate` datetime DEFAULT NULL,
  `LastReceiptQty` int DEFAULT NULL,
  `CUMReceiptQty` int DEFAULT NULL,
  `CallOffDate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CallOfQty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_4095_DTM`
--

CREATE TABLE `tblEDI_4095_DTM` (
  `NO` int NOT NULL,
  `DtmKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VersionNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ManufacturingStartDate` datetime DEFAULT NULL,
  `ManufacturingEndDate` datetime DEFAULT NULL,
  `ManufacturingReqQty` int DEFAULT NULL,
  `MaterialStartDate` datetime DEFAULT NULL,
  `MaterialEndDate` datetime DEFAULT NULL,
  `MaterialReqQty` int DEFAULT NULL,
  `CustomerItemID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VendorItemID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PlanningHorizonDate` datetime DEFAULT NULL,
  `PointConsumption` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CUMAchievedQty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_4095_HEADER`
--

CREATE TABLE `tblEDI_4095_HEADER` (
  `NO` int NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VersionNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransmissionNumberOld` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransmissionNumberNew` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransmissionDate` datetime DEFAULT NULL,
  `CUMStartDate` datetime DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blnRepFlag` tinyint(1) DEFAULT '1',
  `blnEmailFlag` tinyint(1) DEFAULT '0',
  `blnEmailErrorFlag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_4095_LINE`
--

CREATE TABLE `tblEDI_4095_LINE` (
  `NO` int NOT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VersionNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PlantID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DeliveryNumberNew` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DeliveryDateNew` datetime DEFAULT NULL,
  `DeliveryNumberOld` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DeliveryDateOld` datetime DEFAULT NULL,
  `CustomerItemID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VendorItemID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OrderNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DockCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CustomerClerkID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UnitOfMeasure` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DeliveryFrequency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ManufacturingRelease` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RequirementCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AccountKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `StockLocation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblEDI_4095_PACKAGE`
--

CREATE TABLE `tblEDI_4095_PACKAGE` (
  `NO` int NOT NULL,
  `PkgKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HdrKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LineKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DtlKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VersionNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CustomerPackagingCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VendorPackagingCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QtyPerContainer` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblERPType`
--

CREATE TABLE `tblERPType` (
  `ERPNo` int NOT NULL,
  `ERPName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

--
-- Dumping data for table `tblERPType`
--

INSERT INTO `tblERPType` (`ERPNo`, `ERPName`) VALUES
(1, 'EKK SAP'),
(2, 'UVI ERP');

-- --------------------------------------------------------

--
-- Table structure for table `tblErrorHandle`
--

CREATE TABLE `tblErrorHandle` (
  `ErrorHandleNo` int NOT NULL,
  `ErrorHandleCode` int NOT NULL,
  `Description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

--
-- Dumping data for table `tblErrorHandle`
--

INSERT INTO `tblErrorHandle` (`ErrorHandleNo`, `ErrorHandleCode`, `Description`) VALUES
(1, 0, 'Do not check'),
(2, 1, 'Check all'),
(3, 2, 'Do not check mandatory segments missing'),
(4, 3, 'Do not check unrecognized segments'),
(5, 4, 'Do not check max loops');

-- --------------------------------------------------------

--
-- Table structure for table `tblErrorLog`
--

CREATE TABLE `tblErrorLog` (
  `ErrorLogNo` int NOT NULL,
  `LogDate` datetime NOT NULL,
  `TradingPartnerNo_FK` int DEFAULT NULL,
  `TransactionSetNo_FK` int DEFAULT NULL,
  `TransactionRawDataNo_FK` int DEFAULT NULL,
  `ErrorMessage` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LogType` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblInboundMapping`
--

CREATE TABLE `tblInboundMapping` (
  `InboundMappingNo` int NOT NULL,
  `TradingPartnerNo_FK` int NOT NULL,
  `TransactionSetNo_FK` int NOT NULL,
  `SegmentNo_FK` int DEFAULT NULL,
  `Postion` int NOT NULL,
  `TableName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FieldName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommitDBAfterRead` tinyint(1) NOT NULL,
  `Note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransactionRawDataNo_FK` int NOT NULL,
  `IsInsert` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblInboundOutboundSetting`
--

CREATE TABLE `tblInboundOutboundSetting` (
  `SettingNo` int NOT NULL,
  `SettingName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `InOut` tinyint(1) NOT NULL,
  `Path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IsArchive` tinyint(1) NOT NULL,
  `IsDelete` tinyint(1) NOT NULL,
  `IsCreate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblInterchangeControlNumber`
--

CREATE TABLE `tblInterchangeControlNumber` (
  `ControlNo` int NOT NULL,
  `InterchangeControlNumber` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblOperator`
--

CREATE TABLE `tblOperator` (
  `OperatorNo` int NOT NULL,
  `OperatorCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OperatorName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OperatorParameter` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

--
-- Dumping data for table `tblOperator`
--

INSERT INTO `tblOperator` (`OperatorNo`, `OperatorCode`, `OperatorName`, `OperatorParameter`) VALUES
(1, 'CK', 'Create Key', NULL),
(2, 'TR', 'Trim', NULL),
(3, 'AB', 'Add By', NULL),
(4, 'SB', 'Subtract By', NULL),
(5, 'DB', 'Divide By', NULL),
(6, 'MB', 'Multi By', NULL),
(7, 'RP', 'Replace', NULL),
(8, 'ATL', 'Add Text On Left', NULL),
(9, 'ATR', 'Add Text On Right', NULL),
(10, 'AVL', 'Add Variable On Left', NULL),
(11, 'AVR', 'Add Variable On Right', NULL),
(12, 'SV', 'Store To Variable', NULL),
(13, 'BE', 'Blank Current Expression', NULL),
(14, 'DC1', 'Convert CCYYMMDD To MM-DD-CCYY', NULL),
(15, 'DC2', 'Convert CCYYMMDD To MM/DD/CCYY', NULL),
(16, 'DC3', 'Convert CCYYMMDD To YYMMDD', NULL),
(17, 'DC4', 'Convert DD?MM?CCYY To CCYYMMDD', NULL),
(18, 'DC5', 'Convert MM?DD???YY To CCYYMMDD', NULL),
(19, 'DC6', 'Convert MM?DD???YY To YYMMDD', NULL),
(20, 'DC7', 'Convert YYMMDD To CCYYMMDD', NULL),
(21, 'DC8', 'Convert YYMMDD To MM-DD-CCYY', NULL),
(22, 'DC9', 'Convert YYMMDD To MM-DD-YY', NULL),
(23, 'DC10', 'Convert YYMMDD To MM/DD/CCYY', NULL),
(24, 'DC11', 'Convert YYMMDD To MM/DD/YY', NULL),
(25, 'DC12', 'Convert HHMM To HH:MM', NULL),
(26, 'DC13', 'Convert HHMMSS To HH:MM:SS', NULL),
(27, 'UC', 'Upper Case', NULL),
(28, 'LC', 'Lower Case', NULL),
(29, 'ST', 'Substring', NULL),
(30, 'PL', 'Pad Left', NULL),
(31, 'PR', 'Pad Right', NULL),
(32, 'NOT1', 'Do Notthing If Blank', NULL),
(33, 'NOT2', 'Do Notthing If Zero', NULL),
(34, 'GETD', 'Get Date', NULL),
(35, 'GETT', 'Get Time', NULL),
(36, 'DC14', 'Convert HH:MM:SS To HHMMSS', NULL),
(37, 'DC15', 'Convert HH:MM:SS To HHMM', NULL),
(38, 'SPLIT', 'Split And Get Element', NULL),
(39, 'CLEAR_VAR', 'Clear Variable Value', NULL),
(40, 'DC16', 'Convert YYWW or YYMM to Date', NULL),
(41, 'GETDNOW', 'Get Current Date', NULL),
(42, 'GETTNOW', 'Get Current Time', NULL),
(43, 'CONVDEC', 'Covert To Decimal', NULL),
(44, 'ABV', 'Add By Variable', NULL),
(45, 'SBV', 'Subtract By Variable', NULL),
(46, 'DBV', 'Divide By Variable', NULL),
(47, 'MBV', 'Multi By Variable', NULL),
(48, 'GETTIMEZONE', 'Get Time Zone Code', NULL),
(49, 'GETTSNOW', 'Get Current Time Until Second', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblOperatorInboundMapping`
--

CREATE TABLE `tblOperatorInboundMapping` (
  `OperatorMappingNo` int NOT NULL,
  `OperatorNo_FK` int NOT NULL,
  `InboundMappingNo_FK` int NOT NULL,
  `OperatorParameter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblOperatorOutboundMapping`
--

CREATE TABLE `tblOperatorOutboundMapping` (
  `OperatorMappingNo` int NOT NULL,
  `OperatorNo_FK` int NOT NULL,
  `OutboundMappingNo_FK` int NOT NULL,
  `OperatorParameter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblOutboundMapping`
--

CREATE TABLE `tblOutboundMapping` (
  `OutboundMappingNo` int NOT NULL,
  `TradingPartnerNo_FK` int NOT NULL,
  `TransactionSetNo_FK` int NOT NULL,
  `SegmentNo_FK` int DEFAULT NULL,
  `Postion` int NOT NULL,
  `Value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `XMLPathField` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OutputEDIFilePath` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TransactionRawDataNo_FK` int NOT NULL,
  `SegmentNumber` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblSegmentTerminator`
--

CREATE TABLE `tblSegmentTerminator` (
  `SegmentTerminatorNo` int NOT NULL,
  `TerminatorCode` int NOT NULL,
  `Terminator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblTradingPartner`
--

CREATE TABLE `tblTradingPartner` (
  `TradingPartnerNo` int NOT NULL,
  `TradingPartnerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AuthorizationQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AuthorizationInfo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SecurityQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SecurityInfo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `InterchangeSenderIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `InterchangeSenderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `InterchangeReceiverIDQual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `InterchangeReceiverID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ApplicationSenderCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ApplicationReceiverCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ResponsibleAgencyCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SegmentTerminator` int NOT NULL,
  `DataElementDelimiter` int NOT NULL,
  `RepetitionSep` int DEFAULT NULL,
  `InterchangeVersion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `StandardVersion` int NOT NULL,
  `TestIndicator` tinyint(1) NOT NULL,
  `SubElementSep` int NOT NULL,
  `FunctionalAcknowledgement` int DEFAULT '0',
  `OutBoundID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Output997FilePath` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `blnIsGSYear4` tinyint(1) DEFAULT '0',
  `blnUseSCP` tinyint(1) DEFAULT '0',
  `SCPFolder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ERPNo_FK` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblTradingPartnerAutoCopy`
--

CREATE TABLE `tblTradingPartnerAutoCopy` (
  `TPAutoCopyNo` int NOT NULL,
  `TradingPartnerNo_FK` int NOT NULL,
  `TradingPartnerNo_AutoCopy_FK` int NOT NULL,
  `TransactionSetNo_FK` int NOT NULL,
  `blnCopyIDFromTradingPartner` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblTradingPartnerErrorHanding`
--

CREATE TABLE `tblTradingPartnerErrorHanding` (
  `TPErrorHandingNo` int NOT NULL,
  `TradingPartnerNo_FK` int NOT NULL,
  `TransactionSetNo_FK` int NOT NULL,
  `ErrorHandleNo_FK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tblTransmissionControlNumber`
--

CREATE TABLE `tblTransmissionControlNumber` (
  `TransControlNo` int NOT NULL,
  `TransmissionNumber` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `innodb_system`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblEDISegment`
--
ALTER TABLE `tblEDISegment`
  ADD PRIMARY KEY (`SegmentNo`);

--
-- Indexes for table `tblEDITransactionSet`
--
ALTER TABLE `tblEDITransactionSet`
  ADD PRIMARY KEY (`TransactionSetNo`);

--
-- Indexes for table `tblEDITransactionStructure`
--
ALTER TABLE `tblEDITransactionStructure`
  ADD PRIMARY KEY (`StructureNo`);

--
-- Indexes for table `tblEDITrasactionRawData`
--
ALTER TABLE `tblEDITrasactionRawData`
  ADD PRIMARY KEY (`TransactionRawDataNo`);

--
-- Indexes for table `tblEDIType`
--
ALTER TABLE `tblEDIType`
  ADD PRIMARY KEY (`EDITypeNo`);

--
-- Indexes for table `tblEDIVersion`
--
ALTER TABLE `tblEDIVersion`
  ADD PRIMARY KEY (`EDIVersionNo`);

--
-- Indexes for table `tblEDI_142_AMT`
--
ALTER TABLE `tblEDI_142_AMT`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_142_DETAIL`
--
ALTER TABLE `tblEDI_142_DETAIL`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_142_DTM`
--
ALTER TABLE `tblEDI_142_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_142_HEADER`
--
ALTER TABLE `tblEDI_142_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_142_IT1`
--
ALTER TABLE `tblEDI_142_IT1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_142_LINE`
--
ALTER TABLE `tblEDI_142_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_142_MSG`
--
ALTER TABLE `tblEDI_142_MSG`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_142_N1`
--
ALTER TABLE `tblEDI_142_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_142_PRR`
--
ALTER TABLE `tblEDI_142_PRR`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_142_REP`
--
ALTER TABLE `tblEDI_142_REP`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_142_SSS`
--
ALTER TABLE `tblEDI_142_SSS`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_810_HEADER`
--
ALTER TABLE `tblEDI_810_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_810_LINE`
--
ALTER TABLE `tblEDI_810_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_810_N1`
--
ALTER TABLE `tblEDI_810_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_812_HEADER`
--
ALTER TABLE `tblEDI_812_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_812_LINE`
--
ALTER TABLE `tblEDI_812_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_812_N1`
--
ALTER TABLE `tblEDI_812_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_812_REF`
--
ALTER TABLE `tblEDI_812_REF`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_820_ADX`
--
ALTER TABLE `tblEDI_820_ADX`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_820_DTM`
--
ALTER TABLE `tblEDI_820_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_820_HEADER`
--
ALTER TABLE `tblEDI_820_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_820_IT1`
--
ALTER TABLE `tblEDI_820_IT1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_820_LINE`
--
ALTER TABLE `tblEDI_820_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_820_N1`
--
ALTER TABLE `tblEDI_820_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_820_REF`
--
ALTER TABLE `tblEDI_820_REF`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_820_RMR`
--
ALTER TABLE `tblEDI_820_RMR`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_820_SAC`
--
ALTER TABLE `tblEDI_820_SAC`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_820_SLN`
--
ALTER TABLE `tblEDI_820_SLN`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_820_TAX`
--
ALTER TABLE `tblEDI_820_TAX`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_824_DETAIL`
--
ALTER TABLE `tblEDI_824_DETAIL`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_824_DTM`
--
ALTER TABLE `tblEDI_824_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_824_HEADER`
--
ALTER TABLE `tblEDI_824_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_824_LINE`
--
ALTER TABLE `tblEDI_824_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_824_N1`
--
ALTER TABLE `tblEDI_824_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_824_NTE`
--
ALTER TABLE `tblEDI_824_NTE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_824_QTY`
--
ALTER TABLE `tblEDI_824_QTY`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_824_REF`
--
ALTER TABLE `tblEDI_824_REF`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_830_ATH`
--
ALTER TABLE `tblEDI_830_ATH`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_830_DETAIL`
--
ALTER TABLE `tblEDI_830_DETAIL`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_830_DTM`
--
ALTER TABLE `tblEDI_830_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_830_HEADER`
--
ALTER TABLE `tblEDI_830_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_830_LINE`
--
ALTER TABLE `tblEDI_830_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_830_N1`
--
ALTER TABLE `tblEDI_830_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_830_REF`
--
ALTER TABLE `tblEDI_830_REF`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_830_SHP`
--
ALTER TABLE `tblEDI_830_SHP`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_830_SLN`
--
ALTER TABLE `tblEDI_830_SLN`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_832_DETAIL`
--
ALTER TABLE `tblEDI_832_DETAIL`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_832_DTM`
--
ALTER TABLE `tblEDI_832_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_832_HEADER`
--
ALTER TABLE `tblEDI_832_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_832_LINE`
--
ALTER TABLE `tblEDI_832_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_832_N1`
--
ALTER TABLE `tblEDI_832_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_832_REF`
--
ALTER TABLE `tblEDI_832_REF`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_846_DETAIL`
--
ALTER TABLE `tblEDI_846_DETAIL`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_846_DTM`
--
ALTER TABLE `tblEDI_846_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_846_HEADER`
--
ALTER TABLE `tblEDI_846_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_846_LINE`
--
ALTER TABLE `tblEDI_846_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_846_N1`
--
ALTER TABLE `tblEDI_846_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_846_REF`
--
ALTER TABLE `tblEDI_846_REF`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_CTP`
--
ALTER TABLE `tblEDI_850_CTP`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_DTM`
--
ALTER TABLE `tblEDI_850_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_HEADER`
--
ALTER TABLE `tblEDI_850_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_ITA`
--
ALTER TABLE `tblEDI_850_ITA`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_ITD`
--
ALTER TABLE `tblEDI_850_ITD`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_LINE`
--
ALTER TABLE `tblEDI_850_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_N1`
--
ALTER TABLE `tblEDI_850_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_N9`
--
ALTER TABLE `tblEDI_850_N9`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_NTE`
--
ALTER TABLE `tblEDI_850_NTE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_PID`
--
ALTER TABLE `tblEDI_850_PID`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_PO3`
--
ALTER TABLE `tblEDI_850_PO3`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_REF`
--
ALTER TABLE `tblEDI_850_REF`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_SAC`
--
ALTER TABLE `tblEDI_850_SAC`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_SCH`
--
ALTER TABLE `tblEDI_850_SCH`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_SHH`
--
ALTER TABLE `tblEDI_850_SHH`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_850_SLN`
--
ALTER TABLE `tblEDI_850_SLN`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_856_DTM`
--
ALTER TABLE `tblEDI_856_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_856_HEADER`
--
ALTER TABLE `tblEDI_856_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_856_HL2`
--
ALTER TABLE `tblEDI_856_HL2`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_856_HL2_HL3`
--
ALTER TABLE `tblEDI_856_HL2_HL3`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_856_HL3`
--
ALTER TABLE `tblEDI_856_HL3`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_856_LINE`
--
ALTER TABLE `tblEDI_856_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_856_N1`
--
ALTER TABLE `tblEDI_856_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_856_QTY`
--
ALTER TABLE `tblEDI_856_QTY`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_856_REF`
--
ALTER TABLE `tblEDI_856_REF`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_CTP`
--
ALTER TABLE `tblEDI_860_CTP`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_DTM`
--
ALTER TABLE `tblEDI_860_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_HEADER`
--
ALTER TABLE `tblEDI_860_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_ITA`
--
ALTER TABLE `tblEDI_860_ITA`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_ITD`
--
ALTER TABLE `tblEDI_860_ITD`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_LINE`
--
ALTER TABLE `tblEDI_860_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_MSG`
--
ALTER TABLE `tblEDI_860_MSG`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_N1`
--
ALTER TABLE `tblEDI_860_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_N9`
--
ALTER TABLE `tblEDI_860_N9`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_NTE`
--
ALTER TABLE `tblEDI_860_NTE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_PID`
--
ALTER TABLE `tblEDI_860_PID`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_PKG`
--
ALTER TABLE `tblEDI_860_PKG`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_PO3`
--
ALTER TABLE `tblEDI_860_PO3`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_REF`
--
ALTER TABLE `tblEDI_860_REF`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_SAC`
--
ALTER TABLE `tblEDI_860_SAC`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_SCH`
--
ALTER TABLE `tblEDI_860_SCH`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_SHH`
--
ALTER TABLE `tblEDI_860_SHH`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_SLN`
--
ALTER TABLE `tblEDI_860_SLN`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_860_TD5`
--
ALTER TABLE `tblEDI_860_TD5`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_861_DTM`
--
ALTER TABLE `tblEDI_861_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_861_HEADER`
--
ALTER TABLE `tblEDI_861_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_861_LINE`
--
ALTER TABLE `tblEDI_861_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_861_N1`
--
ALTER TABLE `tblEDI_861_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_861_REF`
--
ALTER TABLE `tblEDI_861_REF`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_862_ATH`
--
ALTER TABLE `tblEDI_862_ATH`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_862_DETAIL`
--
ALTER TABLE `tblEDI_862_DETAIL`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_862_DTM`
--
ALTER TABLE `tblEDI_862_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_862_HEADER`
--
ALTER TABLE `tblEDI_862_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_862_JIT`
--
ALTER TABLE `tblEDI_862_JIT`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_862_LINE`
--
ALTER TABLE `tblEDI_862_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_862_N1`
--
ALTER TABLE `tblEDI_862_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_862_REF`
--
ALTER TABLE `tblEDI_862_REF`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_862_SHP`
--
ALTER TABLE `tblEDI_862_SHP`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_864_DTM`
--
ALTER TABLE `tblEDI_864_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_864_HEADER`
--
ALTER TABLE `tblEDI_864_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_864_LINE`
--
ALTER TABLE `tblEDI_864_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_864_MSG`
--
ALTER TABLE `tblEDI_864_MSG`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_864_N1`
--
ALTER TABLE `tblEDI_864_N1`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_997_DETAIL`
--
ALTER TABLE `tblEDI_997_DETAIL`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_997_HEADER`
--
ALTER TABLE `tblEDI_997_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_997_LINE`
--
ALTER TABLE `tblEDI_997_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_4095_DETAIL`
--
ALTER TABLE `tblEDI_4095_DETAIL`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_4095_DTM`
--
ALTER TABLE `tblEDI_4095_DTM`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_4095_HEADER`
--
ALTER TABLE `tblEDI_4095_HEADER`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_4095_LINE`
--
ALTER TABLE `tblEDI_4095_LINE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblEDI_4095_PACKAGE`
--
ALTER TABLE `tblEDI_4095_PACKAGE`
  ADD PRIMARY KEY (`NO`);

--
-- Indexes for table `tblERPType`
--
ALTER TABLE `tblERPType`
  ADD PRIMARY KEY (`ERPNo`);

--
-- Indexes for table `tblErrorHandle`
--
ALTER TABLE `tblErrorHandle`
  ADD PRIMARY KEY (`ErrorHandleNo`);

--
-- Indexes for table `tblErrorLog`
--
ALTER TABLE `tblErrorLog`
  ADD PRIMARY KEY (`ErrorLogNo`);

--
-- Indexes for table `tblInboundMapping`
--
ALTER TABLE `tblInboundMapping`
  ADD PRIMARY KEY (`InboundMappingNo`);

--
-- Indexes for table `tblInboundOutboundSetting`
--
ALTER TABLE `tblInboundOutboundSetting`
  ADD PRIMARY KEY (`SettingNo`);

--
-- Indexes for table `tblInterchangeControlNumber`
--
ALTER TABLE `tblInterchangeControlNumber`
  ADD PRIMARY KEY (`ControlNo`);

--
-- Indexes for table `tblOperator`
--
ALTER TABLE `tblOperator`
  ADD PRIMARY KEY (`OperatorNo`);

--
-- Indexes for table `tblOperatorInboundMapping`
--
ALTER TABLE `tblOperatorInboundMapping`
  ADD PRIMARY KEY (`OperatorMappingNo`);

--
-- Indexes for table `tblOperatorOutboundMapping`
--
ALTER TABLE `tblOperatorOutboundMapping`
  ADD PRIMARY KEY (`OperatorMappingNo`);

--
-- Indexes for table `tblOutboundMapping`
--
ALTER TABLE `tblOutboundMapping`
  ADD PRIMARY KEY (`OutboundMappingNo`);

--
-- Indexes for table `tblSegmentTerminator`
--
ALTER TABLE `tblSegmentTerminator`
  ADD PRIMARY KEY (`SegmentTerminatorNo`);

--
-- Indexes for table `tblTradingPartner`
--
ALTER TABLE `tblTradingPartner`
  ADD PRIMARY KEY (`TradingPartnerNo`);

--
-- Indexes for table `tblTradingPartnerAutoCopy`
--
ALTER TABLE `tblTradingPartnerAutoCopy`
  ADD PRIMARY KEY (`TPAutoCopyNo`);

--
-- Indexes for table `tblTradingPartnerErrorHanding`
--
ALTER TABLE `tblTradingPartnerErrorHanding`
  ADD PRIMARY KEY (`TPErrorHandingNo`);

--
-- Indexes for table `tblTransmissionControlNumber`
--
ALTER TABLE `tblTransmissionControlNumber`
  ADD PRIMARY KEY (`TransControlNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblEDISegment`
--
ALTER TABLE `tblEDISegment`
  MODIFY `SegmentNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=485;

--
-- AUTO_INCREMENT for table `tblEDITransactionSet`
--
ALTER TABLE `tblEDITransactionSet`
  MODIFY `TransactionSetNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tblEDITransactionStructure`
--
ALTER TABLE `tblEDITransactionStructure`
  MODIFY `StructureNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDITrasactionRawData`
--
ALTER TABLE `tblEDITrasactionRawData`
  MODIFY `TransactionRawDataNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDIType`
--
ALTER TABLE `tblEDIType`
  MODIFY `EDITypeNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblEDIVersion`
--
ALTER TABLE `tblEDIVersion`
  MODIFY `EDIVersionNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `tblEDI_142_AMT`
--
ALTER TABLE `tblEDI_142_AMT`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_142_DETAIL`
--
ALTER TABLE `tblEDI_142_DETAIL`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_142_DTM`
--
ALTER TABLE `tblEDI_142_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_142_HEADER`
--
ALTER TABLE `tblEDI_142_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_142_IT1`
--
ALTER TABLE `tblEDI_142_IT1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_142_LINE`
--
ALTER TABLE `tblEDI_142_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_142_MSG`
--
ALTER TABLE `tblEDI_142_MSG`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_142_N1`
--
ALTER TABLE `tblEDI_142_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_142_PRR`
--
ALTER TABLE `tblEDI_142_PRR`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_142_REP`
--
ALTER TABLE `tblEDI_142_REP`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_142_SSS`
--
ALTER TABLE `tblEDI_142_SSS`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_810_HEADER`
--
ALTER TABLE `tblEDI_810_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_810_LINE`
--
ALTER TABLE `tblEDI_810_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_810_N1`
--
ALTER TABLE `tblEDI_810_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_812_HEADER`
--
ALTER TABLE `tblEDI_812_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_812_LINE`
--
ALTER TABLE `tblEDI_812_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_812_N1`
--
ALTER TABLE `tblEDI_812_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_812_REF`
--
ALTER TABLE `tblEDI_812_REF`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_820_ADX`
--
ALTER TABLE `tblEDI_820_ADX`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_820_DTM`
--
ALTER TABLE `tblEDI_820_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_820_HEADER`
--
ALTER TABLE `tblEDI_820_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_820_IT1`
--
ALTER TABLE `tblEDI_820_IT1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_820_LINE`
--
ALTER TABLE `tblEDI_820_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_820_N1`
--
ALTER TABLE `tblEDI_820_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_820_REF`
--
ALTER TABLE `tblEDI_820_REF`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_820_RMR`
--
ALTER TABLE `tblEDI_820_RMR`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_820_SAC`
--
ALTER TABLE `tblEDI_820_SAC`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_820_SLN`
--
ALTER TABLE `tblEDI_820_SLN`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_820_TAX`
--
ALTER TABLE `tblEDI_820_TAX`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_824_DETAIL`
--
ALTER TABLE `tblEDI_824_DETAIL`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_824_DTM`
--
ALTER TABLE `tblEDI_824_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_824_HEADER`
--
ALTER TABLE `tblEDI_824_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_824_LINE`
--
ALTER TABLE `tblEDI_824_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_824_N1`
--
ALTER TABLE `tblEDI_824_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_824_NTE`
--
ALTER TABLE `tblEDI_824_NTE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_824_QTY`
--
ALTER TABLE `tblEDI_824_QTY`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_824_REF`
--
ALTER TABLE `tblEDI_824_REF`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_830_ATH`
--
ALTER TABLE `tblEDI_830_ATH`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_830_DETAIL`
--
ALTER TABLE `tblEDI_830_DETAIL`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_830_DTM`
--
ALTER TABLE `tblEDI_830_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_830_HEADER`
--
ALTER TABLE `tblEDI_830_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_830_LINE`
--
ALTER TABLE `tblEDI_830_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_830_N1`
--
ALTER TABLE `tblEDI_830_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_830_REF`
--
ALTER TABLE `tblEDI_830_REF`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_830_SHP`
--
ALTER TABLE `tblEDI_830_SHP`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_830_SLN`
--
ALTER TABLE `tblEDI_830_SLN`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_832_DETAIL`
--
ALTER TABLE `tblEDI_832_DETAIL`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_832_DTM`
--
ALTER TABLE `tblEDI_832_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_832_HEADER`
--
ALTER TABLE `tblEDI_832_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_832_LINE`
--
ALTER TABLE `tblEDI_832_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_832_N1`
--
ALTER TABLE `tblEDI_832_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_832_REF`
--
ALTER TABLE `tblEDI_832_REF`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_846_DETAIL`
--
ALTER TABLE `tblEDI_846_DETAIL`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_846_DTM`
--
ALTER TABLE `tblEDI_846_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_846_HEADER`
--
ALTER TABLE `tblEDI_846_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_846_LINE`
--
ALTER TABLE `tblEDI_846_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_846_N1`
--
ALTER TABLE `tblEDI_846_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_846_REF`
--
ALTER TABLE `tblEDI_846_REF`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_CTP`
--
ALTER TABLE `tblEDI_850_CTP`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_DTM`
--
ALTER TABLE `tblEDI_850_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_HEADER`
--
ALTER TABLE `tblEDI_850_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_ITA`
--
ALTER TABLE `tblEDI_850_ITA`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_ITD`
--
ALTER TABLE `tblEDI_850_ITD`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_LINE`
--
ALTER TABLE `tblEDI_850_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_N1`
--
ALTER TABLE `tblEDI_850_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_N9`
--
ALTER TABLE `tblEDI_850_N9`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_NTE`
--
ALTER TABLE `tblEDI_850_NTE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_PID`
--
ALTER TABLE `tblEDI_850_PID`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_PO3`
--
ALTER TABLE `tblEDI_850_PO3`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_REF`
--
ALTER TABLE `tblEDI_850_REF`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_SAC`
--
ALTER TABLE `tblEDI_850_SAC`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_SCH`
--
ALTER TABLE `tblEDI_850_SCH`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_SHH`
--
ALTER TABLE `tblEDI_850_SHH`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_850_SLN`
--
ALTER TABLE `tblEDI_850_SLN`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_856_DTM`
--
ALTER TABLE `tblEDI_856_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_856_HEADER`
--
ALTER TABLE `tblEDI_856_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_856_HL2`
--
ALTER TABLE `tblEDI_856_HL2`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_856_HL2_HL3`
--
ALTER TABLE `tblEDI_856_HL2_HL3`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_856_HL3`
--
ALTER TABLE `tblEDI_856_HL3`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_856_LINE`
--
ALTER TABLE `tblEDI_856_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_856_N1`
--
ALTER TABLE `tblEDI_856_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_856_QTY`
--
ALTER TABLE `tblEDI_856_QTY`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_856_REF`
--
ALTER TABLE `tblEDI_856_REF`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_CTP`
--
ALTER TABLE `tblEDI_860_CTP`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_DTM`
--
ALTER TABLE `tblEDI_860_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_HEADER`
--
ALTER TABLE `tblEDI_860_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_ITA`
--
ALTER TABLE `tblEDI_860_ITA`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_ITD`
--
ALTER TABLE `tblEDI_860_ITD`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_LINE`
--
ALTER TABLE `tblEDI_860_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_MSG`
--
ALTER TABLE `tblEDI_860_MSG`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_N1`
--
ALTER TABLE `tblEDI_860_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_N9`
--
ALTER TABLE `tblEDI_860_N9`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_NTE`
--
ALTER TABLE `tblEDI_860_NTE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_PID`
--
ALTER TABLE `tblEDI_860_PID`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_PKG`
--
ALTER TABLE `tblEDI_860_PKG`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_PO3`
--
ALTER TABLE `tblEDI_860_PO3`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_REF`
--
ALTER TABLE `tblEDI_860_REF`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_SAC`
--
ALTER TABLE `tblEDI_860_SAC`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_SCH`
--
ALTER TABLE `tblEDI_860_SCH`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_SHH`
--
ALTER TABLE `tblEDI_860_SHH`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_SLN`
--
ALTER TABLE `tblEDI_860_SLN`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_860_TD5`
--
ALTER TABLE `tblEDI_860_TD5`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_861_DTM`
--
ALTER TABLE `tblEDI_861_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_861_HEADER`
--
ALTER TABLE `tblEDI_861_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_861_LINE`
--
ALTER TABLE `tblEDI_861_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_861_N1`
--
ALTER TABLE `tblEDI_861_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_861_REF`
--
ALTER TABLE `tblEDI_861_REF`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_862_ATH`
--
ALTER TABLE `tblEDI_862_ATH`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_862_DETAIL`
--
ALTER TABLE `tblEDI_862_DETAIL`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_862_DTM`
--
ALTER TABLE `tblEDI_862_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_862_HEADER`
--
ALTER TABLE `tblEDI_862_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_862_JIT`
--
ALTER TABLE `tblEDI_862_JIT`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_862_LINE`
--
ALTER TABLE `tblEDI_862_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_862_N1`
--
ALTER TABLE `tblEDI_862_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_862_REF`
--
ALTER TABLE `tblEDI_862_REF`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_862_SHP`
--
ALTER TABLE `tblEDI_862_SHP`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_864_DTM`
--
ALTER TABLE `tblEDI_864_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_864_HEADER`
--
ALTER TABLE `tblEDI_864_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_864_LINE`
--
ALTER TABLE `tblEDI_864_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_864_MSG`
--
ALTER TABLE `tblEDI_864_MSG`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_864_N1`
--
ALTER TABLE `tblEDI_864_N1`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_997_DETAIL`
--
ALTER TABLE `tblEDI_997_DETAIL`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_997_HEADER`
--
ALTER TABLE `tblEDI_997_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_997_LINE`
--
ALTER TABLE `tblEDI_997_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_4095_DETAIL`
--
ALTER TABLE `tblEDI_4095_DETAIL`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_4095_DTM`
--
ALTER TABLE `tblEDI_4095_DTM`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_4095_HEADER`
--
ALTER TABLE `tblEDI_4095_HEADER`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_4095_LINE`
--
ALTER TABLE `tblEDI_4095_LINE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEDI_4095_PACKAGE`
--
ALTER TABLE `tblEDI_4095_PACKAGE`
  MODIFY `NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblERPType`
--
ALTER TABLE `tblERPType`
  MODIFY `ERPNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblErrorHandle`
--
ALTER TABLE `tblErrorHandle`
  MODIFY `ErrorHandleNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblErrorLog`
--
ALTER TABLE `tblErrorLog`
  MODIFY `ErrorLogNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblInboundMapping`
--
ALTER TABLE `tblInboundMapping`
  MODIFY `InboundMappingNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblInboundOutboundSetting`
--
ALTER TABLE `tblInboundOutboundSetting`
  MODIFY `SettingNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblInterchangeControlNumber`
--
ALTER TABLE `tblInterchangeControlNumber`
  MODIFY `ControlNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblOperator`
--
ALTER TABLE `tblOperator`
  MODIFY `OperatorNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tblOperatorInboundMapping`
--
ALTER TABLE `tblOperatorInboundMapping`
  MODIFY `OperatorMappingNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblOperatorOutboundMapping`
--
ALTER TABLE `tblOperatorOutboundMapping`
  MODIFY `OperatorMappingNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblOutboundMapping`
--
ALTER TABLE `tblOutboundMapping`
  MODIFY `OutboundMappingNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblSegmentTerminator`
--
ALTER TABLE `tblSegmentTerminator`
  MODIFY `SegmentTerminatorNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblTradingPartner`
--
ALTER TABLE `tblTradingPartner`
  MODIFY `TradingPartnerNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblTradingPartnerAutoCopy`
--
ALTER TABLE `tblTradingPartnerAutoCopy`
  MODIFY `TPAutoCopyNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblTradingPartnerErrorHanding`
--
ALTER TABLE `tblTradingPartnerErrorHanding`
  MODIFY `TPErrorHandingNo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblTransmissionControlNumber`
--
ALTER TABLE `tblTransmissionControlNumber`
  MODIFY `TransControlNo` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
