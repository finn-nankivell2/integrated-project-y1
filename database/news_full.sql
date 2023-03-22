-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 22, 2023 at 04:02 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `sub_heading` varchar(250) NOT NULL,
  `short_headline` varchar(250) NOT NULL,
  `content` mediumtext NOT NULL,
  `image` varchar(450) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `location` varchar(50) NOT NULL,
  `summary` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `author_id`, `title`, `sub_heading`, `short_headline`, `content`, `image`, `date`, `time`, `location`, `summary`) VALUES
(1, 1, 'Test Article', 'TOPIC HERE', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'images/placeholder/fractal6.jpg', '2023-03-09', '12:24:00', 'dublin', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
(2, 1, 'Life as a 21st-Century Trucker', 'LONG READ', 'Life', 'Lorem ipsum dolor sit amet.', 'images/placeholder/fractal1.jpg', '2023-03-09', '00:23:16', 'dublin', 'trucks');

-- --------------------------------------------------------

--
-- Table structure for table `articles_topics`
--

CREATE TABLE `articles_topics` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(70) DEFAULT NULL,
  `personal_website` varchar(200) NOT NULL,
  `bio` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `email`, `personal_website`, `bio`) VALUES
(1, 'Michael Gregory', 'birthdayboy@gmail.com', 'https://jerma-lore.fandom.com/wiki/Michael', 'Michael is a birthday boy. He has loads of super cool toys!');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`) VALUES
(1, 'technology'),
(2, 'review');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `articles_topics`
--
ALTER TABLE `articles_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`topic_id`),
  ADD KEY `fk3` (`article_id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`);

--
-- Constraints for table `articles_topics`
--
ALTER TABLE `articles_topics`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`),
  ADD CONSTRAINT `fk3` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



INSERT INTO `articles` (`author_id`, `title`, `sub_heading`, `short_headline`, `content`, `image`, `date`, `time`, `location`, `summary`) VALUES(1, 'Russia-Ukraine war: Moscow warns of ‘serious consequences’ if UK supplies depleted uranium shells to Kyiv', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'US politics: claims Trump misled his lawyers about classified papers as potential indictment looms', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'UK politics: Boris Johnson says ‘hand on heart’ he did not lie to the Commons as he is grilled over Partygate', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Rishi Sunak’s Northern Ireland plan passes but 20-plus Tories rebel', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Government sees off no-confidence vote by far-right party', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'K-pop star Chaeyoung apologises for wearing swastika logo', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Trial over ski collision enters second day in Utah', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Activists launch legal case over English-only translations at Notre Dame', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Burrowing badgers halt train services', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Fifteen people taken to hospital after ship topples over at Leith dry dock', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Composer’s bad liver may not have been solely alcohol related, say experts', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Kharkiv’s Russian missile cemetery', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Lender announces $15.6bn support package for Ukraine', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Kishida and Xi tread starkly different paths on Ukraine', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Day 392: Kishida meets Zelenskiy in Kyiv', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'National pride dealt heavy blow by the merger of its banking titans', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Concern over violence as Palestinians prepare for Ramadan', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Why did I avoid the camera so much when I was young?', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'An anti-portrait of an opera-goer', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Mysterious ‘Broadway Pooper’ strikes during the Clintons’ night at the theatre', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Gory stan satire Swarm is a shallow look at extreme fandom', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'A shopper’s guide to synthetic fabrics', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Why does the UK have highest levels in G7 and is Brexit a factor?', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Western democracy is weaker in this new cold war than it was in the first one', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The Catholic church offering free tattoos? It’s a cross I’d be happy to bear', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The secret of happiness? Embrace the boring, lay claim to the mundane and rejoice in repetition', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Ham-fisted but humane: the BBC’s podcast about Shamima Begum raises vital questions', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Britain’s art institutions face death by a thousand cuts. Why are they just putting up with it?', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'One minute, I was in the sauna – the next, I was in a steamy panic', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'India’s WPL has captured the imagination – and this is just the start', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Ohtani lived out fairytale as World Baseball Classic came of age', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Former Arsenal forward retires: ‘It’s time to leave the big stage', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Euro 2024 qualifiers and the return of Hodgson', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Fresh allegations made of sexual abuse at club in Poole', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'PSG are as far away as ever from getting best out of their stars', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'New Jersey prodigy Levito in medal mix at world championships', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'I truly think I can be better than ever', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Mediterranean diet is part of a whole way of life', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'A family at war in the hell of Bakhmut', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Are the ghosts of 2008 rising again?', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Film sheds new light on infamous cold war killing', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Beijing’s population falls for first time since 2003 ', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Officer shot during raids targeting Reichsbürger movement', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Odds of UK interest rate rise surge after inflation jumps to 10.4%', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Arkansas bans trans students from using bathroom that matches gender', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Unknown Jackson Pollock painting found in raid, say Bulgarian officials', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'UK begins inquiry into alleged SAS extrajudicial killings', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Search under way for family of one of air force’s last black WW2 veterans', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Fox News and Dominion face off in court over 2020 election claims', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Prisoners who used toothbrush to escape caught at pancake restaurant', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Argentinian Luis Caffarelli wins Abel prize', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Pressure grows on industry to accept carbon levy', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Eight things the world must do to avoid the worst of climate change', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Charge big oil firms with homicide', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Older Americans protest against ‘dirty banks’ funding oil and gas projects', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The artist who films herself undercover', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Even diehard fans will be glad the end is nigh', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Boy George and band members pay ex-drummer £1.75m after legal dispute', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Funk legend Sly Stone announces memoir', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Thrilling documentary captures the explosive energy of 2 Tone', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The Chevalier review – fascinating but flawed look at an extraordinary musician', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'I knew my friend was dying – and I didn’t contact her', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'How to make Glamorgan sausages – recipe', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'My wife told me all about her sexual past – and I am having mini panic attacks', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, '‘I could no longer cosplay the grownup to my little cousin’', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'What does the most overused word of our era actually mean?', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, '‘Don’t equate sex and penetration’', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'How Europe’s first wild river national park saw off the dams', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The deadly war against Iraq’s journalists ', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The cost of diabetes in the global south', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The day a sitting president of the US was arrested', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Trudeau-Biden talks to tackle asylum seekers at southern border', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Bali marks new year with day of silence ', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Have you been affected by Cyclone Gabrielle?', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'How will you remember the footballer?', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Tell us what you think about Putin’s escalation of war in Ukraine', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Share your views on the protests following Mahsa Amini’s death', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Britain’s biggest police force is ‘racist, sexist, and homophobic’ – can it change?', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, ' Britain’s biggest police force is ‘racist, sexist, and homophobic’ – can it change? ', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Listen to previous episodes', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, ' More from the series ', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'French government survives no-confidence votes amid protests – video', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Mysterious streaks of light seen in California sky – video', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Drone footage shows millions of dead fish in river', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'A Hindu festival and a toppled ship', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Designing Elton John’s final tour', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'My life with Jewish retirees', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Kurdish New Year 2023 celebrations – in pictures', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'On the frontlines of the war 2003-08', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Behind the scenes with David Bowie', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Russia-Ukraine war live: Moscow warns of ‘serious consequences’ if UK supplies depleted uranium shells to Kyiv', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'She was one of Alabama’s last abortion doctors. Then they came for everything she had ', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'West Midlands school criticised after death threats to gay Muslim speaker ', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Putin says Russia ‘will respond’ if UK supplies depleted uranium shells to Ukraine', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Putin’s two-day charm offensive with Xi underlines who’s boss', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, '‘It’s half of what was shot at us’: Kharkiv’s Russian missile cemetery', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'French activists launch legal case over English-only translations at Notre Dame', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Ugandan MPs pass bill imposing death penalty for homosexuality', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Putin welcomes China’s controversial proposals for peace in Ukraine', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Switzerland’s national pride dealt heavy blow by the merger of its banking titans', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'GameStop Profitable For First Time In Years Even As Everything Seems On Fire', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Trump Hasnt Been Arrested But AI Images Keep Fooling People', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Our Favorite Cosplay From Katsucon 2023', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Here’s Every Single Video Game Remake You Can Play In 2023', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, '10 Badass Action Games That Will Make You Feel Like John Wick', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'A Ton Of Lowkey Features Just Made The PS5 Way More Convenient', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, '11+ Captivating Games To Play After The Last Of Us', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Valve Just Revealed All Steam Sale Dates For 2023', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Best Deals of the Day: Samsung QLED 4K TV, Instant Pot Pressure Cooker,...', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Dewalt 20V Max Cordless Drill & Driver Kit', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Discover Samsung - Daily Deal', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Binoid THC-O Gummies', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Three Surprisingly Practical Uses for Dryer Lint', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Leaked Document Shows How Amazon Ended Up Over-Listing Thousands of Jobs', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The Week In Games: Survival Horror Ukulele Edition', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Republican Congressman Proudly Admits He Doesnt Know the Difference Between Abortion & Plan B', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'A US Agency Rejected Face Recognition—and Landed in Big Trouble', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'This Is the Lightest Paint in the World', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The TikTok CEO’s Face-Off With Congress Is Doomed', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'AI Loves—and Loathes—Language', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'I Finally Slept Well on a Plane With This Pillow', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The Future of Black Queer Characters in Comics Is Joyful', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'How to Move Your Slack Archive to Discord', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, '‘4 People Tweeting’ Changed the Face of Nigerian Politics', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'I Saw the Face of God in a Semiconductor Factory', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'A New York Court Is About to Rule on the Future of Crypto', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Online Sleuths Untangle the Mystery of the Nord Stream Sabotage', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Google Rolls Out Its Bard Chatbot to Battle ChatGPT', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Save the Planet by Eating This Big Ugly Fish', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'In Ukraine, Crypto Finds a Purpose', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The Future Smartphone: More Folds, Less Phone, a Whole Lot of AI', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'A Gene Therapy Cure for Sickle Cell Is on the Horizon', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The World’s Real ‘Cybercrime’ Problem', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'How to Love Technology Again', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Jenny Odell Can Stretch Time and So Can You', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'On the Trail of the Fentanyl King', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'This Is a Philosopher on Drugs', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The Best Phones With an Actual Headphone Jack', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'This Thermal Camera Lets You Play ‘Hot or Not’ With Any Phone', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The Best Wireless Earbuds for Working Out', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The Instax Mini 12 Is the Best, Cutest Starter Instant Camera', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Give Your Back a Break With Our Favorite Office Chairs', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Europe Is Drying Up', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Solar Panels Floating in Reservoirs? We’ll Drink to That', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'As Millions of Solar Panels Age Out, Recyclers Hope to Cash In', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The Food System Is Awful for the Climate. It Doesn’t Have to Be', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Climate Change Is Making Alaska’s Legendary Iditarod Harder to Run', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'The First Shot: Inside the Covid Vaccine Fast Track', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Like. Flirt. Ghost: A Journey Into the Social Media Lives of Teens', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Why No One Clicked on the Great Hypertext Story', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Welcome to ‘Disneyland With the Death Penalty’', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'I Called Off My Wedding. The Internet Will Never Forget', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Harvard Professor Answers Happiness Questions From Twitter', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
(1, 'Chris Pine, Hugh Grant & Michelle Rodriguez Answer the Webs Most Searched Questions', 'TOPIC', 'Test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', 'Lorem ipsum dolor sit amet.'),
;