-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2021 at 11:55 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codesmashersblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `sno` int(20) NOT NULL,
  `postno` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` text NOT NULL,
  `username` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`sno`, `postno`, `content`, `date`, `username`) VALUES
(7, 26, 'aaa', '24/02/2021 14:49:25', 'arpit'),
(8, 26, 'bbb', '24/02/2021 14:49:34', 'arpit456jain'),
(9, 28, 'aa', '24/02/2021 14:49:45', 'arpit'),
(10, 26, '\"Zuckerberg\" redirects here. For other people with the surname, see Zuckerberg (surname).\r\nMark Zuckerberg\r\nMark Zuckerberg F8 2019 Keynote (32830578717) (cropped).jpg\r\nZuckerberg in 2019\r\nBorn	Mark Elliot Zuckerberg\r\nMay 14, 1984 (age 36)\r\nWhite Plains, New York, U.S.\r\nEducation	Harvard University (no degree)\r\nOccupation	\r\nInternet entrepreneurphilanthropistmedia mogul\r\nYears active	2004–present\r\nKnown for	Co-founding and leading Facebook, Inc.\r\nNet worth	Increase US$ 103.7 Billion (as of February 2021)[1]\r\nTitle	\r\nFounder and CEO of Facebook, Inc.\r\nCo-founder and co-CEO of Chan Zuckerberg Initiative[2]\r\nSpouse(s)	Priscilla Chan ​(m. 2012)​\r\nChildren	2\r\nRelatives	Randi Zuckerberg (sister)\r\nDonna Zuckerberg (sister)\r\nWebsite	facebook.com/zuck\r\nSignature\r\nMark Zuckerberg Signature.svg\r\nMark Elliot Zuckerberg (/ˈzʌkərbɜːrɡ/; born May 14, 1984) is an American media magnate, internet entrepreneur, and philanthropist. He is known for co-founding Facebook, Inc. and serves as its chairman, chief executive officer, and controlling shareholder.[3][4] He also is a co-founder of the solar sail spacecraft development project Breakthrough Starshot and serves as one of its board members.[5]\r\n\r\nBorn in White Plains, New York, Zuckerberg attended Harvard University, where he launched the Facebook social networking service from his dormitory room on February 4, 2004, with college roommates Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, and Chris Hughes.[6] Originally launched to select college campuses, the site expanded rapidly and eventually beyond colleges, reaching one billion users by 2012. Zuckerberg took the company public in May 2012 with majority shares', '24/02/2021 15:02:41', 'cs2019021042'),
(11, 26, 'hello', '25/02/2021 13:43:03', 'aj'),
(12, 26, 'w', '25/02/2021 13:43:17', 'Arpit'),
(13, 29, 'hello', '25/02/2021 13:52:44', 'arpit456jain'),
(14, 36, 'testing comment section and it is working fine...', '25/02/2021 15:11:17', 'Arpit'),
(15, 37, 'testing comment section..', '25/02/2021 15:21:17', 'arpit'),
(16, 37, 'testing comment section In 1979, Bjarne Stroustrup, a Danish computer scientist, began work on \"C with Classes\", the predecessor to C++.[16] The motivation for creating a new language originated from Stroustrup\'s experience in programming for his PhD thesis. Stroustrup found that Simula had features that were very helpful for large software development, but the language was too slow for practical use, while BCPL was fast but too low-level to be suitable for large software development. When Stroustrup started working in AT&T Bell Labs, he had the problem of analyzing the UNIX kernel with respect to distributed computing. Remembering his PhD experience, Stroustrup set out to enhance the C language with Simula-like features.[17] C was chosen because it was general-purpose, fast, portable and widely used. As well as C and Simula\'s influences, other languages also influenced this new language, including ALGOL 68, Ada, CLU and ML.', '25/02/2021 15:22:37', 'Arpit'),
(17, 36, 'testing cmnt section', '25/02/2021 15:45:45', 'Arpit');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` int(11) NOT NULL,
  `mes` varchar(1000) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `mes`, `date`, `email`) VALUES
(1, 'arpit', 94551277, 'hello', '2021-02-16 19:53:58', '111aj@gmail.com'),
(2, 'Arpit Jain', 2147483647, '', '0000-00-00 00:00:00', '111arpit1@gmail.com'),
(3, 'Arpit Jain', 2147483647, 'a', '0000-00-00 00:00:00', '111arpit1@gmail.com'),
(4, 'Arpit Jain', 2147483647, 'q', '0000-00-00 00:00:00', '111arpit1@mail.com'),
(5, 'Arpit Jain', 2147483647, 'aaa', '2021-02-17 10:46:37', 'excelresearchpapers@gmail.com'),
(6, 'Arpit Jain', 2147483647, 'aaaaaaaaaaaaa', '2021-02-17 11:03:31', 'arpit456jain@gmail.com'),
(7, 'Arpit Jain', 2147483647, 'aaaaaaaaaaaaa', '2021-02-17 11:04:10', 'arpit456jain@gmail.com'),
(8, 'Arpit Jain', 2147483647, 'aaaaaaaaaaaaa', '2021-02-17 11:05:23', 'arpit456jain@gmail.com'),
(9, 'Arpit Jain', 2147483647, 'aaaaaaaaaaaaa', '2021-02-17 11:08:51', 'arpit456jain@gmail.com'),
(10, 'Arpit Jain', 2147483647, 'aaaaaaaaaaaaa', '2021-02-17 11:11:15', 'arpit456jain@gmail.com'),
(11, 'Arpit Jain', 2147483647, 'w', '2021-02-17 11:12:06', 'arpit456jain@gmail.com'),
(12, 'Arpit Jain', 2147483647, 'hello', '2021-02-17 11:13:29', '111arpit1@gmail.com'),
(13, 'Arpit Jain', 2147483647, 'thanks\r\n', '2021-02-19 19:39:40', '111arpit1@gmail.com'),
(14, 'Arpit Jain', 2147483647, 'testing', '2021-02-20 10:38:31', '111arpit1@gmail.com'),
(15, 'Arpit Jain', 2147483647, 'testing', '2021-02-20 10:39:02', '111arpit1@gmail.com'),
(16, 'Arpit Jain', 2147483647, 'testing', '2021-02-20 10:41:14', '111arpit1@gmail.com'),
(17, 'Arpit Jain', 2147483647, 'hello this is for testing purpose good work', '2021-02-20 10:50:31', '111arpit1@gmail.com'),
(18, 'Arpit Jain', 2147483647, 'testing', '2021-02-25 09:54:57', '111arpit1@gmail.com'),
(19, 'Arpit Jain', 2147483647, 'hello', '2021-02-25 10:13:13', '111arpit1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `date`) VALUES
(36, 'Python (programming language)', 'python', 'Python is an interpreted, high-level and general-purpose programming language. Python\'s design philosophy emphasizes code readability with its notable use of significant indentation. Its language constructs and object-oriented approach aim to help programmers write clear, logical code for small and large-scale projects.[29]  Python is dynamically-typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly, procedural), object-oriented and functional programming. Python is often described as a \"batteries included\" language due to its comprehensive standard library.[30]  Python was created in the late 1980s, and first released in 1991, by Guido van Rossum as a successor to the ABC programming language. Python 2.0, released in 2000, introduced new features, such as list comprehensions, and a garbage collection system with reference counting, and was discontinued with version 2.7 in 2020.[31] Python 3.0, released in 2008, was a major revision of the language that is not completely backward-compatible and much Python 2 code does not run unmodified on Python 3. With Python 2\'s end-of-life (and pip having dropped support in 2021[32]), only Python 3.6.x[33] and later are supported, with older versions still supporting e.g. Windows 7 (and old installers not restricted to 64-bit Windows).  Python interpreters are supported for mainstream operating systems and available for a few more (and in the past supported many more). A global community of programmers develops and maintains CPython, a free and open-source[34] reference implementation. A non-profit organization, the Python Software Foundation, manages and directs resources for Python and CPython development.  As of January 2021, Python ranks third in TIOBE’s index of most popular programming languages, behind C and Java,[35] having previously gained second place and their award for the most popularity gain for 2020.', '25/02/2021 15:08:43'),
(37, 'C++ (One of the best Language for CP)', 'cpp', 'C++  is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or \"C with Classes\". The language has expanded significantly over time, and modern C++ now has object-oriented, generic, and functional features in addition to facilities for low-level memory manipulation. It is almost always implemented as a compiled language, and many vendors provide C++ compilers, including the Free Software Foundation, LLVM, Microsoft, Intel, Oracle, and IBM, so it is available on many platforms.[9]\r\n\r\nC++ was designed with an orientation toward system programming and embedded, resource-constrained software and large systems, with performance, efficiency, and flexibility of use as its design highlights.[10] C++ has also been found useful in many other contexts, with key strengths being software infrastructure and resource-constrained applications,[10] including desktop applications, video games, servers (e.g. e-commerce, web search, or SQL servers), and performance-critical applications (e.g. telephone switches or space probes).[11]\r\n\r\nC++ is standardized by the International Organization for Standardization (ISO), with the latest standard version ratified and published by ISO in December 2020 as ISO/IEC 14882:2020 (informally known as C++20).[12] The C++ programming language was initially standardized in 1998 as ISO/IEC 14882:1998, which was then amended by the C++03, C++11, C++14, and C++17 standards. The current C++20 standard supersedes these with new features and an enlarged standard library. Before the initial standardization in 1998, C++ was developed by Danish computer scientist Bjarne Stroustrup at Bell Labs since 1979 as an extension of the C language; he wanted an efficient and flexible language similar to C that also provided high-level features for program organization.[13] Since 2012, C++ is on a three-year release schedule,[14] with C++23 the next planned standard.', '25/02/2021 15:15:47'),
(39, 'Java (programming language)', 'java', 'Java is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. It is a general-purpose programming language intended to let application developers write once, run anywhere (WORA),[17] meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.[18] Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of the underlying computer architecture. The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them. The Java runtime provides dynamic capabilities (such as reflection and runtime code modification) that are typically not available in traditional compiled languages. As of 2019, Java was one of the most popular programming languages in use according to GitHub,[19][20] particularly for client-server web applications, with a reported 9 million developers.[21]\r\n\r\nJava was originally developed by James Gosling at Sun Microsystems (which has since been acquired by Oracle) and released in 1995 as a core component of Sun Microsystems\' Java platform. The original and reference implementation Java compilers, virtual machines, and class libraries were originally released by Sun under proprietary licenses. As of May 2007, in compliance with the specifications of the Java Community Process, Sun had relicensed most of its Java technologies under the GNU General Public License. Oracle offers its own HotSpot Java Virtual Machine, however the official reference implementation is the OpenJDK JVM which is free open source software and used by most developers and is the default JVM for almost all Linux distributions.', '25/02/2021 15:54:45'),
(40, 'C (programming language)', 'c', 'C is a general-purpose, procedural computer programming language supporting structured programming, lexical variable scope, and recursion, with a static type system. By design, C provides constructs that map efficiently to typical machine instructions. It has found lasting use in applications previously coded in assembly language. Such applications include operating systems and various application software for computer architectures that range from supercomputers to PLCs and embedded systems.\r\n\r\nA successor to the programming language B, C was originally developed at Bell Labs by Dennis Ritchie between 1972 and 1973 to construct utilities running on Unix. It was applied to re-implementing the kernel of the Unix operating system.[6] During the 1980s, C gradually gained popularity. It has become one of the most widely used programming languages,[7][8] with C compilers from various vendors available for the majority of existing computer architectures and operating systems. C has been standardized by the ANSI since 1989 (ANSI C) and by the International Organization for Standardization (ISO).\r\n\r\nC is an imperative procedural language. It was designed to be compiled to provide low-level access to memory and language constructs that map efficiently to machine instructions, all with minimal runtime support. Despite its low-level capabilities, the language was designed to encourage cross-platform programming. A standards-compliant C program written with portability in mind can be compiled for a wide variety of computer platforms and operating systems with few changes to its source code.', '25/02/2021 15:55:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `sno` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
