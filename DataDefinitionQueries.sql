-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Feb 08, 2019 at 10:31 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs361_leungn`
--

-- --------------------------------------------------------

--
-- Table structure for table `ballot`
--

DROP TABLE IF EXISTS `ballot`;
CREATE TABLE `ballot` (
  `ballot_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `candidate` varchar(255) NOT NULL,
  `zip` decimal(8,0) NOT NULL,
  `party` varchar(255) NOT NULL,
  `electoral_college` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ballot`
--

INSERT INTO `ballot` (`ballot_id`, `full_name`, `age`, `candidate`, `zip`, `party`, `electoral_college`) VALUES
(1, 'Nadia Leung', 34, 'Hillary Clinton', '01650', 'Democrat', 6),
(2, 'Thomas Lem', 36, 'Hillary Clinton', '01650', 'Democrat', 6),
(3, 'Clarissa Gasiciel', 38, 'Hillary Clinton', '650', 'Democrat', 6),
(4, 'Stephen Thomas', 34, 'Donald Trump', '02580', 'Republican', 3),
(5, 'Evan Schein', 36, 'Donald Trump', '02580', 'Republican', 3),
(6, 'Daniel Ram', 38, 'Hillary Clinton', '02580', 'Democrat', 3),
(7, 'Helena Ima', 36, 'Hillary Clinton', '01240', 'Democrat', 8),
(8, 'Penny Li', 38, 'Donald Trump', '01240', 'Republican', 8),
(9, 'Rachel Kim', 36, 'Donald Trump', '01980', 'Republican', 9),
(10, 'Uma Thurman', 38, 'Donald Trump', '01980', 'Republican', 9);

-- --------------------------------------------------------

--
-- Table structure for user information
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `pswd_hash` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `street` varchar(255) NOT NULL,
  `apt` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(11) NOT NULL,
  `email` varchar(320) NOT NULL,
  `is_voter` boolean NOT NULL DEFAULT false,    -- True if eligible voter
  `is_admin` boolean NOT NULL DEFAULT false,    -- True if can add ballots/surveys
  `is_candidate` boolean NOT NULL DEFAULT false -- True if candidate
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `username`, `pswd_hash`, `first_name`, `last_name`, `birthday`, `street`, `apt`, `city`, `state`, `zip`, `email`, `is_voter`, `is_admin`, `is_candidate`) VALUES
(1, 'ychen', 'aaabbbccc', 'Yuzhe', 'Chen', '1985-06-06', '123 Fake Street', NULL, 'Anytown', 'NY', '12345', 'yezhe@gmail.com', true, false, false),
(2, 'kartj', 'afhdihk8977', 'Jimmy', 'Kart', '1965-06-06', '666 Some Avenue', 'B', 'Baboon County', 'ID', '55555', 'j.kart@idahovote.gov', true, true, false),
(3, 'gaga4ever', 'hhhhhhhhhhh', 'Lady', 'Gaga', '1990-02-04', '987 Main Street', 'D', 'Los Angeles', 'CA', '90001', 'gaga@gmail.com', true, false, true),
(4, 'jolierm', 'afdhkl@#98889', 'Rachel', 'Jolie', '1995-06-12', '2525 Lake Boulevard', NULL, 'Seattle', 'WA', '98101', 'jolie@paramount.com', true, false, false),
(5, 'ostone', 'afjjjiiiii', 'Olivia', 'stone', '1987-02-27', '10506 Western Avenue', NULL, 'Lexington', 'KY', '40502', 'olivia@aol.com', true, false, false);

-- --------------------------------------------------------

-- ** Removed this table because voters' votes should not
-- be identifiably logged due to the secrecy of ballots.
-- We can change this to track demographic information
-- if you would like (age, sex, ethnicity, etc.) if
-- we also want to include that data as part of
-- user registration (CG) **

--
-- Table structure for table `candidate_votes`
--

-- DROP TABLE IF EXISTS `candidate_votes`;
-- CREATE TABLE `candidate_votes` (
--  `voter_id` int(11) NOT NULL,
--  `candidate_id` int(11) NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `candidate_votes`
--

-- INSERT INTO `candidate_votes` (`voter_id`, `candidate_id`) VALUES
-- (1, 1),
-- (2, 3),
-- (3, 6),
-- (4, 5),
-- (5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `state_vote`
--

DROP TABLE IF EXISTS `state_vote`;
CREATE TABLE `state_vote` (
  `id` int(11) NOT NULL,
  `count` float NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state_vote`
--

INSERT INTO `state_vote` (`id`, `count`, `candidate_id`, `voter_id`) VALUES
(1, 650, 1, 1),
(2, 1230, 3, 2),
(3, 2540, 4, 3),
(4, 3960, 2, 4),
(5, 3220, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `state_ballot`
--

DROP TABLE IF EXISTS `state_ballot`;
CREATE TABLE `state_ballot` (
  `electoral_college` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `ballot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state_ballot`
--

INSERT INTO `state_ballot` (`electoral_college`, `state_id`, `ballot_id`) VALUES
(1, 1, 2),
(1, 2, 1),
(1, 2, 4),
(1, 3, 1),
(1, 3, 3),
(1, 3, 7),
(2, 4, 9),
(1, 5, 7),
(1, 5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `candidate` varchar(255) NOT NULL,
  `office` varchar(255) NOT NULL,  -- Office candidate is running for
  `state` varchar(255) DEFAULT NULL,  -- State candidate is running in
  `district` int (11) DEFAULT NULL,  -- District candidate is running in
  `party` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `candidate`, `office`, `state`, `district`, `party`) VALUES
(1, 'Donald Trump', 'President', NULL, NULL, 'Republican'),
(2, 'Hillary Clinton', 'President', NULL, NULL, 'Democrat'),
(3, 'Jane Smith', 'Senator', 'KY', NULL, 'Democrat'),
(4, 'Mike Garcia', 'Representative', 'TX', 3, 'Democrat');

-- --------------------------------------------------------


--
-- Table structure for logging votes for each candidate in each applicable state
--

DROP TABLE IF EXISTS `votes_by_state`;
CREATE TABLE `votes_by_state` (
  `cand_id` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  `total` int (11) NOT NULL DEFAULT 0,
  PRIMARY KEY(`cand_id`, `state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Test data for votes_by_state
--

INSERT INTO `votes_by_state` (`cand_id`, `state`, `total`) VALUES
(1, 'MA', 1876600),
(1, 'CA', 2676600),
(2, 'NY', 3876600),
(2, 'KY', 4976600),
(2, 'TX', 23556800);


--
-- Table structure for table `candidate_ballot`
--

DROP TABLE IF EXISTS `candidate_ballot`;
CREATE TABLE `candidate_ballot` (
  `candidate_id` int(11) NOT NULL,
  `ballot_id` int(11) NOT NULL,
  `electoral_college` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidate_ballot`
--

INSERT INTO `candidate_ballot` (`candidate_id`, `ballot_id`, `electoral_college`) VALUES
(1, 1, 12),
(1, 2, 12),
(1, 3, 12),
(1, 4, 20),
(1, 5, 18),
(1, 6, 10);




--
-- Indexes for dumped tables
--

--
-- Indexes for table `ballot`
--
ALTER TABLE `ballot`
  ADD PRIMARY KEY (`ballot_id`);

--
-- Indexes for table `voters`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate_votes`
--
-- ALTER TABLE `candidate_votes`
--  ADD PRIMARY KEY (`voter_id`,`candidate_id`),
--  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `state_vote`
--
ALTER TABLE `state_vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `voter_id` (`voter_id`);

--
-- Indexes for table `state_ballot`
--
ALTER TABLE `state_ballot`
  ADD PRIMARY KEY (`state_id`,`ballot_id`),
  ADD KEY `ballot_id` (`ballot_id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate_ballot`
--
ALTER TABLE `candidate_ballot`
  ADD PRIMARY KEY (`candidate_id`,`ballot_id`),
  ADD KEY `ballot_id` (`ballot_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ballot`
--
ALTER TABLE `ballot`
  MODIFY `ballot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `state_vote`
--
ALTER TABLE `state_vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


 ALTER TABLE `votes_by_state`
  ADD CONSTRAINT `votes_by_state_ibfk_1` FOREIGN KEY (`cand_id`) REFERENCES `candidates` (`id`);
--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidate_votes`
--
-- ALTER TABLE `candidate_votes`
--  ADD CONSTRAINT `candidate_votes_ibfk_1` FOREIGN KEY (`voter_id`) REFERENCES `voters` (`id`),
--  ADD CONSTRAINT `candidate_votes_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`);

--
-- Constraints for table `state_vote`
--
ALTER TABLE `state_vote`
  ADD CONSTRAINT `state_vote_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`),
  ADD CONSTRAINT `state_vote_ibfk_2` FOREIGN KEY (`voter_id`) REFERENCES `user_info` (`id`);

--
-- Constraints for table `state_ballot`
--
ALTER TABLE `state_ballot`
  ADD CONSTRAINT `state_ballot_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state_vote` (`id`),
  ADD CONSTRAINT `state_ballot_ibfk_2` FOREIGN KEY (`ballot_id`) REFERENCES `ballot` (`ballot_id`);

--
-- Constraints for table `candidate_ballot`
--
ALTER TABLE `candidate_ballot`
  ADD CONSTRAINT `candidate_ballot_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`),
  ADD CONSTRAINT `candidate_ballot_ibfk_2` FOREIGN KEY (`ballot_id`) REFERENCES `ballot` (`ballot_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
