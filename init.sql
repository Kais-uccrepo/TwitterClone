-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 16, 2017 at 02:41 PM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `instantdb`
--
CREATE DATABASE IF NOT EXISTS `instantdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `instantdb`;

-- --------------------------------------------------------

--
-- Table structure for table `symbols`
--

CREATE TABLE `symbols` (
  `id` int(11) NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT '',
  `animal` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `symbols`
--

INSERT INTO `symbols` (`id`, `country`, `animal`, `image`) VALUES
(69, 'kais', 'hi', 'https://s3-us-west-1.amazonaws.com/powr/defaults/image-slider2.jpg'),
(70, 'kais', 'hello', 'https://s3-us-west-1.amazonaws.com/powr/defaults/image-slider2.jpg'),
(71, 'kais', 'boi', 'https://s3-us-west-1.amazonaws.com/powr/defaults/image-slider2.jpg'),
(72, 'something', 'hi', 'http://s3.amazonaws.com/digitaltrends-uploads-prod/2015/04/gremlins-gizmo.jpg'),
(73, 'something', 'gawfgrht', 'http://s3.amazonaws.com/digitaltrends-uploads-prod/2015/04/gremlins-gizmo.jpg'),
(74, 'something', 'halloo', 'http://s3.amazonaws.com/digitaltrends-uploads-prod/2015/04/gremlins-gizmo.jpg'),
(75, 'kais', 'doug was here', 'https://s3-us-west-1.amazonaws.com/powr/defaults/image-slider2.jpg'),
(76, 'kais', 'doug was here sike boi', 'https://s3-us-west-1.amazonaws.com/powr/defaults/image-slider2.jpg'),
(77, 'kais', 'hi', 'https://s3-us-west-1.amazonaws.com/powr/defaults/image-slider2.jpg'),
(78, 'kais', 'hi', 'https://s3-us-west-1.amazonaws.com/powr/defaults/image-slider2.jpg'),
(79, 'neel_ismail', 'post', 'http://del.h-cdn.co/assets/15/50/1600x800/landscape-1449679172-delish-biscoff-cookies.jpg'),
(87, 'kais', 'post', 'https://s3-us-west-1.amazonaws.com/powr/defaults/image-slider2.jpg'),
(88, 'golflover123', 'I love golf', 'http://www.psdgraphics.com/file/golf-ball.jpg'),
(89, 'golflover123', 'golf is my life #golf', 'http://www.psdgraphics.com/file/golf-ball.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `salt` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `salt`, `email`, `image`) VALUES
(4, 'joe', '2da8829d571c7eb4fe0d16b699f4f85f873b7b042a763afa13449264bb4017ca', '37ef77e53bf3e4f0', 'joe@blow.com', ''),
(7, 'kais', '34adc88269af2210774a74d338f32c7fa5a4f25936e47ae234d1e2355b1fa0d8', '7adbe6501dd0acca', 'test@test.com', 'https://s3-us-west-1.amazonaws.com/powr/defaults/image-slider2.jpg'),
(16, 'hello', '826703432bfbebb3f46b0fcddc4cb808f61754253212186c84f5ddc2f3792520', '261c4753dea1916', 'hello@hello.hello', 'http://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg'),
(18, 'something', 'd7c3ceef23ff5e3c637cd5655540a8dcf45f57efcb72f3882bcff95eda1f19b3', '60aa9b422ab078a1', 's@s.s', 'http://s3.amazonaws.com/digitaltrends-uploads-prod/2015/04/gremlins-gizmo.jpg'),
(19, 'neel_ismail', 'fa71b9978fffaea84cf179316b9bcc7116e30c74230ed0e56825e276c473a248', '62debd1833ebebf7', 'test@example.com', 'https://www.google.ca/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwiv7KWa8erTAhXL64MKHaVgBZ0QjRwIBw&url=http%3A%2F%2Fwww.delish.com%2Fcooking%2Frecipe-ideas%2Frecipes%2Fa45132%2Fbiscoff-chocolate-chip-cookies-recipe%2F&psig=AFQjCNEkKtjWMLXeJRJTMtpyHaAJsOxdOg&ust=1494696685138366'),
(20, 'golflover123', 'ab353c70ade896c8f2f72de64c77f19872f8f13b47548c2e1955ccefb9668884', '3315171e29a971fc', 'golf@golfweekly.golf', 'http://www.psdgraphics.com/file/golf-ball.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `symbols`
--
ALTER TABLE `symbols`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `symbols`
--
ALTER TABLE `symbols`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
