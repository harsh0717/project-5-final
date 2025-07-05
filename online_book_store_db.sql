-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2025 at 04:00 PM
-- Server version: 8.0.39
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_book_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `full_name`, `email`, `password`) VALUES
(2, 'admin', 'admin@example.com', '$2y$10$IXvGcDNZTu8Tq9DONBK8NeFecl2fdqu.M5D3LcBdzDT1nCkyGYvkK');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(1, 'jack London'),
(8, 'charles dickens'),
(10, 'walt whitman'),
(11, 'Lord Byron'),
(12, 'Robert Cecil Martin'),
(13, 'Andrew Hunt'),
(14, 'Thomas H. Cormen'),
(15, 'Francis Scott Fitzgerald'),
(16, 'Josh Lockhart'),
(17, 'Jane Austen'),
(18, 'Arthur Conan Doyle'),
(19, 'Oscar Wilde'),
(20, 'मुंशी प्रेमचंद (Munshi Premchand)'),
(21, 'देवकीनंदन खत्री(Devkinandan Khatri)'),
(22, 'Ved Vyas'),
(23, 'Valmiki');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `author_id` int NOT NULL,
  `description` text NOT NULL,
  `category_id` int NOT NULL,
  `cover` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author_id`, `description`, `category_id`, `cover`, `file`) VALUES
(1, 'Crime and Punishment', 1, 'Crime and Punishment by Fyodor Dostoevsky is a psychological novel that explores the moral dilemmas of Raskolnikov, a young man who commits murder believing he\'s above the law. The story delves into guilt, redemption, and the struggle between good and evil within the human soul.', 1, '6867b146635c16.72345793.jpg', '6867b10397f899.69454118.pdf'),
(2, 'Great Expectations', 8, 'Great Expectations by Charles Dickens is a coming-of-age novel that follows Pip, an orphan who dreams of rising above his humble beginnings. Through unexpected fortune and painful lessons, he discovers the true meaning of gentility, loyalty, and love.', 1, '6866d0c00ebda7.98132941.jpg', '6866d0c00fc879.95848990.pdf'),
(7, 'Pride and Prejudice', 17, 'A classic novel about love and social expectations in 19th-century England, featuring the witty Elizabeth Bennet and proud Mr. Darcy.', 13, '6867f1c2bb2597.65605507.jpg', '6867f1c2bb6b02.25725302.pdf'),
(8, 'The Adventures of Sherlock Holmes', 18, 'Brilliant detective Sherlock Holmes solves mysteries in Victorian London using logic and observation.', 14, '6867f2679e0e48.56247330.jpg', '6867f2679e63b0.35301571.pdf'),
(9, 'The Picture of Dorian Gray', 19, 'A young man remains eternally youthful while a hidden portrait of him ages and reflects his moral decay. It’s a chilling tale of vanity, sin, and supernatural consequences.', 15, '6867f347645c59.42987298.jpg', '6867f347652c93.83394651.pdf'),
(10, 'गोदान (Godaan)', 20, 'भारतीय किसान जीवन की पीड़ा और सामाजिक अन्याय की गहरी कथा।(A deep tale of the suffering and social injustice of Indian farmer\'s life)', 16, '6867f47066fa58.69641596.jpg', '6867f47076bb84.82902042.pdf'),
(11, 'चंद्रकांता(Chandrakanta)', 21, 'राजाओं, जादूगरों और रोमांचक रहस्यों से भरी भारत की पहली फैंटेसी शैली की किताब।(India\'s first fantasy genre book filled with kings, wizards and thrilling mysteries.)', 17, '6867f5b7727257.86137234.jpg', '6867f5b77323f7.43254319.pdf'),
(12, 'Mahabharat(English)', 22, 'The *Mahabharat* is one of the greatest Indian epics, narrating the war between the Pandavas and the Kauravas—two branches of the same royal family. It explores themes of dharma (duty), karma, loyalty, and justice. At its core is the legendary Kurukshetra war, with Lord Krishna guiding Arjuna in the *Bhagavad Gita*. The epic also includes rich stories of devotion, betrayal, sacrifice, and divine intervention. It remains a timeless guide to life, ethics, and spiritual wisdom.', 18, '6867f70137e543.66294593.jpg', '6867f70147a9a4.03065371.pdf'),
(13, 'Mahabharat(Hindi)', 22, 'महाभारत भारत का एक महान महाकाव्य है, जो पांडवों और कौरवों के बीच हुए कुरुक्षेत्र युद्ध की कहानी है। इसमें धर्म, कर्म, निष्ठा, न्याय और जीवन के गूढ़ सिद्धांतों का वर्णन है। युद्ध के समय भगवान श्रीकृष्ण द्वारा अर्जुन को दिया गया *श्रीमद्भगवद् गीता* उपदेश इसका सबसे महत्वपूर्ण भाग है। महाभारत में प्रेम, त्याग, विश्वासघात और ईश्वर की लीलाओं की गाथा भी है। यह ग्रंथ आज भी जीवन और धर्म का मार्गदर्शन करता है। (The *Mahabharat* is one of the greatest Indian epics, narrating the war between the Pandavas and the Kauravas—two branches of the same royal family. It explores themes of dharma (duty), karma, loyalty, and justice. At its core is the legendary Kurukshetra war, with Lord Krishna guiding Arjuna in the *Bhagavad Gita*. The epic also includes rich stories of devotion, betrayal, sacrifice, and divine intervention. It remains a timeless guide to life, ethics, and spiritual wisdom.)', 18, '6867f75399cb73.10449661.jpg', '6867f7539a77c9.05246787.pdf'),
(14, 'Ramayana By Valmiki (Hindi)', 23, 'रामायण एक प्राचीन भारतीय महाकाव्य है, जिसकी रचना महर्षि वाल्मीकि ने की थी। यह भगवान श्रीराम के जीवन, उनके वनवास, माता सीता की रावण द्वारा अपहरण, और अंत में रावण के वध की कथा है। रामायण में भक्ति, धर्म, कर्तव्य, आदर्श परिवार और मर्यादा पुरुषोत्तम राम के गुणों का वर्णन है। इसमें भाईचारे, त्याग, सत्य और नारी सम्मान जैसे मूल्यों को प्रमुखता दी गई है। यह ग्रंथ आज भी भारतीय संस्कृति और आचरण का आधार है।(The *Ramayana* is an ancient Indian epic written by Sage Valmiki. It narrates the life of Lord Rama, his exile to the forest, the abduction of his wife Sita by the demon king Ravana, and Rama\'s eventual victory over evil. The story highlights ideals of devotion, duty, honor, sacrifice, and righteousness. Lord Rama is portrayed as the perfect man (*Maryada Purushottam*), and the epic serves as a moral and spiritual guide. Even today, the *Ramayana* deeply influences Indian culture and values.)', 18, '6867fb63714084.51756895.jpg', '6867fb6381b243.71382794.pdf'),
(15, 'test', 20, 'test', 5, '686916adefbde0.04433584.png', '686916ae00a2e9.73741665.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Novel'),
(5, 'Poetry'),
(13, 'Romance'),
(14, 'Mystery'),
(15, 'Horror'),
(16, 'Classic'),
(17, 'Fiction'),
(18, 'Hindu Itihasa (History)');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `rating` tinyint NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `rating`, `message`, `created_at`) VALUES
(1, 'harsh', 'gohilharsh759@gmail.com', 4, 'this is so beautiful web site', '2025-07-05 10:26:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
