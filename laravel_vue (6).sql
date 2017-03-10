-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2017 at 04:30 PM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_vue`
--

-- --------------------------------------------------------

--
-- Table structure for table `friendships`
--

CREATE TABLE `friendships` (
  `id` int(10) UNSIGNED NOT NULL,
  `requester` int(11) NOT NULL,
  `user_requested` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `friendships`
--

INSERT INTO `friendships` (`id`, `requester`, `user_requested`, `status`, `created_at`, `updated_at`) VALUES
(2, 41, 1, 0, '2017-02-05 09:05:13', '2017-02-05 09:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(2, 41, 2, '2017-02-05 09:12:52', '2017-02-05 09:12:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2017_02_01_075525_create_profiles_table', 1),
(12, '2017_02_01_132541_create_friendships_table', 1),
(13, '2017_02_03_092254_create_notifications_table', 1),
(14, '2017_02_03_175453_create_jobs_table', 1),
(15, '2017_02_04_145416_create_posts_table', 1),
(16, '2017_02_05_050643_create_likes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0b7b3964-7112-4d0f-a868-2eeb3c2b372a', 'App\\Notifications\\NewFriendRequest', 1, 'App\\User', '{"name":"firoz rahman sabuz","message":"sent you a friend request."}', '2017-02-05 09:06:50', '2017-02-05 09:05:19', '2017-02-05 09:06:50'),
('48f48be9-02f1-41c9-aa49-5ada58521cac', 'App\\Notifications\\NewFriendRequest', 1, 'App\\User', '{"name":"firoz rahman sabuz","message":"sent you a friend request."}', '2017-02-05 09:06:50', '2017-02-05 09:04:49', '2017-02-05 09:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 41, 'hello home how are you?\n', '2017-02-05 08:54:57', '2017-02-05 08:54:57'),
(2, 41, 'what are you doing', '2017-02-05 08:56:31', '2017-02-05 08:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `location`, `about`, `created_at`, `updated_at`) VALUES
(1, 1, 'O''Konside', 'Illum et saepe recusandae vero sit eligendi dignissimos. Occaecati sed amet sint inventore illo fuga at. Rerum iste necessitatibus iste dolores aliquam distinctio. Ad ut expedita aut nihil eveniet eum aut. Distinctio eos rerum explicabo quis perferendis delectus debitis rerum. Corrupti autem libero quo autem.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(2, 2, 'Goyettefort', 'Iusto omnis eum nostrum temporibus. Explicabo illum voluptas exercitationem error dolorem omnis. Et saepe omnis omnis et neque nemo consequatur est. Voluptatem magni sunt sapiente dolor debitis aut recusandae. Ipsum quidem delectus libero hic perspiciatis.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(3, 3, 'Turcottemouth', 'Qui ipsa ex repudiandae tempore eveniet tempore. Labore at harum sunt similique ipsa ipsa. Est rerum qui hic qui. Temporibus eligendi ab doloribus minus enim et dolorum voluptas. Dolores provident quaerat corporis labore accusantium magnam.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(4, 4, 'Rathberg', 'Doloremque eos omnis aut hic quam eum et voluptatem. Sed aut sit nemo. In tenetur dolores velit omnis molestiae. Reprehenderit repellendus nihil perspiciatis reiciendis nobis quos.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(5, 5, 'Larkinstad', 'Similique sed ut quia nobis. Et quam animi est aspernatur adipisci. Quia saepe sit pariatur. Ea velit aut veniam. Nihil fugiat quia illum doloremque reprehenderit earum quia quo.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(6, 6, 'East Shanelletown', 'Impedit reiciendis laudantium velit dolorum libero ut animi. Exercitationem ut sed et. Est nostrum vel ab necessitatibus. Provident excepturi tenetur animi aliquam repellendus aut. Asperiores aut ab ea sint.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(7, 7, 'West Cyril', 'Sint aut fugiat asperiores voluptas nobis. Blanditiis aliquid nobis quia debitis. Magnam quod doloremque accusamus veritatis unde recusandae ipsam sed. Qui qui magni cum et dolorum aliquam. Iure in voluptatem quas quas at. Repudiandae enim quas quod autem magni est asperiores.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(8, 8, 'Port Ceasar', 'Voluptatem quia deserunt tempore illo ut voluptatem. Aliquam nam adipisci facere. Molestias voluptas eos non natus numquam. Veniam amet facilis aperiam ut.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(9, 9, 'Port Destiney', 'Aspernatur nostrum temporibus voluptatem est eum. Aut cupiditate necessitatibus rerum ut sed in. Voluptatem praesentium praesentium ut in doloribus sunt esse. Ut et sunt corporis aut cum repudiandae consequatur.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(10, 10, 'East Elyseburgh', 'In sapiente aut dolor illo repellat. Voluptas non ipsum corrupti molestias et. Nulla expedita at voluptas dolores. Tenetur voluptates modi corrupti autem. Et odio minima corrupti dolorum veritatis omnis.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(11, 11, 'Daughertyport', 'Recusandae adipisci aspernatur quis laborum inventore qui. Perferendis sed laboriosam voluptatem ad. Earum sed dolorem impedit repudiandae repellendus rerum. Quidem autem laudantium et nemo culpa id et. Itaque unde sunt velit.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(12, 12, 'Maggioberg', 'Dignissimos et eos ea qui dolorem. Itaque suscipit harum est commodi aspernatur molestias fuga. Asperiores sed perspiciatis expedita eum. Accusantium deserunt tempore nesciunt aut. Sint eum magni rem voluptatum ut quaerat. Veritatis quod et corporis qui.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(13, 13, 'Henryhaven', 'Iure doloremque id aut ea. Maiores quod repellendus natus neque culpa alias fugit. Esse et voluptatum aliquid. Dicta autem sed quas ducimus. Voluptas et cupiditate vel.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(14, 14, 'Macejkovicville', 'Laboriosam et mollitia cupiditate odit maiores alias rerum. Ut veniam et iure. Voluptas a placeat beatae rerum accusantium. Eligendi aut doloremque sit exercitationem. Quia minus quia aut voluptas sint.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(15, 15, 'Krystinaland', 'Sit dicta voluptas nobis repudiandae magni. Sed perspiciatis vero tempora vel occaecati consequatur perferendis dolor. Ad quis non impedit qui illum. Odit sit necessitatibus omnis facilis necessitatibus.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(16, 16, 'Hayesfurt', 'Adipisci aspernatur voluptatem veritatis rerum autem placeat omnis. Sit iure delectus error ullam asperiores. Quod maiores ut non quo. Reiciendis quam rem id fuga. Ducimus dolore vel laborum distinctio dolore sed iste.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(17, 17, 'Fannytown', 'Beatae et iste ut a laborum saepe voluptatibus. Dolorum aspernatur dolorem dolorum facere. Et provident et quis corporis et.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(18, 18, 'South Jeradstad', 'Perferendis rerum voluptates quod sint voluptatem. Ea aut saepe ut id et debitis est quis. Aut deserunt iusto voluptatibus repellat inventore. Reiciendis dolores qui ipsam. Voluptatem sit vel ea. Maxime voluptatem sint itaque ut.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(19, 19, 'East Aisha', 'Tempora animi est qui eligendi et tenetur. Voluptatem dolorem ea quas dicta. Et aut assumenda aliquid cumque sit. Iste quia dolorem natus. Non beatae sed animi soluta dolorem quia qui voluptas.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(20, 20, 'Augustburgh', 'Cumque et iusto est eum. Est voluptas distinctio ut consequatur voluptatem dolore molestiae consequuntur. Ea molestias deleniti quasi consequatur. Accusantium est inventore deleniti quisquam doloremque porro ut.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(21, 21, 'Bomouth', 'Eveniet temporibus voluptatem assumenda nisi. Eius est eos omnis. Reiciendis nemo rem est. Itaque cum aperiam ipsa iusto. Laboriosam quia vero rerum voluptatem velit. Quidem vero consequatur minima tempore.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(22, 22, 'Beattyside', 'Rerum est rem exercitationem fuga vel quia. Consequatur temporibus quasi eveniet. Hic nostrum rerum odit aliquam voluptatibus consequuntur quibusdam.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(23, 23, 'East Sabrynaton', 'Et natus omnis doloremque sit. Inventore dolorem totam repellendus molestias minus eveniet officia velit. Laboriosam quam veniam hic illo assumenda. Sed omnis eligendi voluptatem quam. Voluptas minima omnis ut quidem recusandae cum quisquam.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(24, 24, 'North Alberto', 'Itaque qui odio et temporibus qui modi. Et ut aliquid quo et maiores est laborum. Deserunt suscipit sed nemo quod facilis. Numquam at quod dolorem et veritatis unde quae. Quidem ad recusandae in quia.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(25, 25, 'East Alba', 'Et molestiae in inventore minima unde aliquid nulla. Sit et consequatur qui magni. Quo eum inventore omnis sapiente necessitatibus.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(26, 26, 'Gibsonland', 'In tempora iusto corporis reprehenderit. Nobis fuga nulla rem quo. Illum dolores qui voluptatem quos. Quaerat esse ex dolores aliquam non. Optio necessitatibus sint commodi totam.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(27, 27, 'West Gennaro', 'Impedit fugit eum aut sed. Qui tempore mollitia non harum voluptatum. Voluptate sed consequuntur porro. Vitae atque aperiam enim aut quia a nemo expedita. Accusamus dolores labore recusandae cumque.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(28, 28, 'Abbottland', 'Qui adipisci temporibus doloribus sit est officiis sequi quis. Vitae autem voluptatem dicta repellat dignissimos eum. Hic eum odit exercitationem.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(29, 29, 'West Cassie', 'Voluptate error aliquid qui adipisci saepe. Aut aperiam cum unde. Esse aut provident repudiandae dolor. Dolores non voluptatem hic sit ut illum. Rerum aperiam laboriosam sed fuga.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(30, 30, 'Quentinview', 'Voluptatem eveniet cupiditate rerum porro corrupti reprehenderit modi. Repellendus quis dolorem necessitatibus ipsa repellendus aut est. Quaerat ea nam id ad. Unde quaerat minima aut. Voluptas voluptas quas quia mollitia suscipit ut consectetur.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(31, 31, 'South Josefahaven', 'Consequatur ducimus quia deserunt sint. Quas temporibus dignissimos laudantium est officia error optio iste. Sunt nesciunt ratione debitis quisquam doloribus tenetur. Ea aut est repellendus ea alias cum enim culpa. Laboriosam ex voluptas voluptatem soluta exercitationem.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(32, 32, 'Wisokyburgh', 'Quaerat labore veritatis voluptatum rerum. Aut veniam soluta modi reiciendis molestiae. Quia minima officia nemo et accusantium. Non ut quis et quia et. Exercitationem eos ducimus aspernatur animi et.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(33, 33, 'Gulgowskiview', 'Nemo omnis aperiam commodi reiciendis quia incidunt est. Quo repellendus quae nam minus et voluptatem. Voluptatem exercitationem quis dolorum impedit adipisci ut ut ipsam.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(34, 34, 'West Marianneport', 'Rerum et occaecati deleniti fugit illo. Voluptas placeat corrupti labore et similique voluptatem. Enim qui dignissimos tempora temporibus dolores doloribus voluptatem. Dolorem numquam hic odio veniam sit dolores reiciendis. Dignissimos eum asperiores non.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(35, 35, 'Port Orin', 'Sed optio adipisci qui iure facere. Iure rerum qui accusantium. Est distinctio ut est sint est eum ratione quia. Sed rerum a rerum qui impedit dicta maxime aut. Eos aspernatur velit nulla qui consequuntur voluptatum.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(36, 36, 'West Kacey', 'Similique consectetur sed voluptate sunt qui ut harum. Omnis error beatae praesentium rem pariatur impedit minus. Officia sapiente non atque repellendus.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(37, 37, 'Pedrohaven', 'Numquam eligendi maxime et. Harum reiciendis facere a consequatur vel. Deserunt illo ut consequatur et veritatis qui quia.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(38, 38, 'New Justenview', 'Fugiat esse iste consequatur voluptas magnam velit. Minima cupiditate sit et. Neque nisi et ea autem dolorum excepturi quam. Non ullam magni ullam possimus. Dicta fuga dolore laboriosam ut sunt eius eum. Ea debitis nam et omnis.', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(39, 39, 'Joshuashire', 'Dolor alias corrupti et dolorem earum. Suscipit aut sunt dignissimos voluptatem consectetur sed. Architecto soluta ad aut sequi sit repellendus. Accusamus itaque adipisci dignissimos aut.', '2017-02-05 08:46:49', '2017-02-05 08:46:49'),
(40, 40, 'West Cristal', 'In nam aut est voluptas quasi. Et dolor architecto voluptas. Inventore sint distinctio placeat et asperiores dolor dolor animi. Quibusdam dolor asperiores sunt qui. Dolor quaerat ad eveniet adipisci odit sit voluptatibus explicabo.', '2017-02-05 08:46:49', '2017-02-05 08:46:49'),
(41, 41, 'kushtia-Bangladesh', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.', '2017-02-05 08:51:37', '2017-02-05 08:57:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `slug`, `gender`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mandy Ondricka', 'chaim14@example.net', 'public/defaults/avatars/female.png', 'mandy-langworth', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'uQD63JiKZ6', '2017-02-05 08:46:39', '2017-02-05 08:46:39'),
(2, 'Berta Bernier', 'eleazar25@example.org', 'public/defaults/avatars/female.png', 'rachel-boehm', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'v05vOOlcSD', '2017-02-05 08:46:41', '2017-02-05 08:46:41'),
(3, 'Jacinto Schmeler', 'littel.salvador@example.com', 'public/defaults/avatars/female.png', 'icie-morissette', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 't1fFM5E707', '2017-02-05 08:46:41', '2017-02-05 08:46:41'),
(4, 'Lorenza Gaylord', 'shany.mayert@example.com', 'public/defaults/avatars/female.png', 'dr-norwood-langosh', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'oGjLyC2j2K', '2017-02-05 08:46:41', '2017-02-05 08:46:41'),
(5, 'Kenton Dooley', 'joconner@example.org', 'public/defaults/avatars/female.png', 'sophia-pacocha', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', '7Fo80ay1U6', '2017-02-05 08:46:41', '2017-02-05 08:46:41'),
(6, 'Sage Gerlach', 'berniece.treutel@example.com', 'public/defaults/avatars/female.png', 'lizzie-leffler-dvm', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'bwGekAndgt', '2017-02-05 08:46:41', '2017-02-05 08:46:41'),
(7, 'Garnett Macejkovic', 'kyleigh.halvorson@example.net', 'public/defaults/avatars/female.png', 'mrs-litzy-leuschke-jr', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'd63QoGEInP', '2017-02-05 08:46:42', '2017-02-05 08:46:42'),
(8, 'Prof. Dudley Borer', 'tamara.davis@example.net', 'public/defaults/avatars/female.png', 'carol-labadie', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'QtOZ61mPwA', '2017-02-05 08:46:42', '2017-02-05 08:46:42'),
(9, 'Sylvester Dietrich', 'price.brandi@example.org', 'public/defaults/avatars/female.png', 'mervin-hammes', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'PdkN2d969F', '2017-02-05 08:46:42', '2017-02-05 08:46:42'),
(10, 'Antwon West', 'hilbert47@example.com', 'public/defaults/avatars/female.png', 'earl-kuhn', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'EPzEhpuShh', '2017-02-05 08:46:42', '2017-02-05 08:46:42'),
(11, 'Ms. Cecile Mayer IV', 'xsimonis@example.com', 'public/defaults/avatars/female.png', 'ms-kelsi-hilpert', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'SR7Ryoa9kS', '2017-02-05 08:46:42', '2017-02-05 08:46:42'),
(12, 'Diego Smitham', 'llarson@example.net', 'public/defaults/avatars/female.png', 'elise-windler-phd', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'swLO7F0Gli', '2017-02-05 08:46:42', '2017-02-05 08:46:42'),
(13, 'Margarett O''Kon', 'ken.kiehn@example.com', 'public/defaults/avatars/female.png', 'waldo-price', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'O5wTTXD7gb', '2017-02-05 08:46:43', '2017-02-05 08:46:43'),
(14, 'Dr. Ariel Blick PhD', 'pfeffer.marlen@example.com', 'public/defaults/avatars/female.png', 'ms-bella-schmeler-iii', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'YAAKXoG18n', '2017-02-05 08:46:43', '2017-02-05 08:46:43'),
(15, 'Cecilia Robel', 'price.funk@example.net', 'public/defaults/avatars/female.png', 'deborah-yost', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'h3g2xKdYhc', '2017-02-05 08:46:43', '2017-02-05 08:46:43'),
(16, 'Mr. Tremayne Davis IV', 'award@example.com', 'public/defaults/avatars/female.png', 'effie-harvey', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', '2VLotv1nfT', '2017-02-05 08:46:43', '2017-02-05 08:46:43'),
(17, 'Ms. Eloisa Ullrich', 'predovic.ansel@example.org', 'public/defaults/avatars/female.png', 'sonia-berge', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'pucOY4we7O', '2017-02-05 08:46:43', '2017-02-05 08:46:43'),
(18, 'Emely Altenwerth', 'tpurdy@example.com', 'public/defaults/avatars/female.png', 'candida-walsh', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'ZQIFMvIO37', '2017-02-05 08:46:43', '2017-02-05 08:46:43'),
(19, 'Ms. Rita Hintz Jr.', 'gnikolaus@example.com', 'public/defaults/avatars/female.png', 'jayde-roob', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'gGMtRvoemf', '2017-02-05 08:46:44', '2017-02-05 08:46:44'),
(20, 'Ryder Steuber I', 'vivienne.wisoky@example.org', 'public/defaults/avatars/female.png', 'leonie-kshlerin', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'veuaChtf32', '2017-02-05 08:46:44', '2017-02-05 08:46:44'),
(21, 'Miss Katrine Hills', 'howell.dooley@example.com', 'public/defaults/avatars/female.png', 'esperanza-kovacek-ii', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'wJrSM0icpj', '2017-02-05 08:46:44', '2017-02-05 08:46:44'),
(22, 'Mr. Delbert Connelly Sr.', 'isaac78@example.net', 'public/defaults/avatars/female.png', 'floyd-lockman', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'cMry0cUT3H', '2017-02-05 08:46:44', '2017-02-05 08:46:44'),
(23, 'Golden Sawayn', 'batz.delbert@example.org', 'public/defaults/avatars/female.png', 'clovis-sporer', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'bSX70TPN3c', '2017-02-05 08:46:44', '2017-02-05 08:46:44'),
(24, 'Ms. Kylee Effertz', 'garrett.nitzsche@example.org', 'public/defaults/avatars/female.png', 'wellington-streich', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'QsBoRy9MxR', '2017-02-05 08:46:44', '2017-02-05 08:46:44'),
(25, 'Mrs. Jody Wyman', 'waelchi.reta@example.net', 'public/defaults/avatars/female.png', 'ida-feil-md', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', '2mahm9UZEq', '2017-02-05 08:46:45', '2017-02-05 08:46:45'),
(26, 'Shana Sipes Sr.', 'mattie69@example.org', 'public/defaults/avatars/female.png', 'austyn-predovic', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'fKGkijBGMP', '2017-02-05 08:46:45', '2017-02-05 08:46:45'),
(27, 'Rodrick Cormier', 'nader.sonia@example.com', 'public/defaults/avatars/female.png', 'jed-bruen', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'AUcaJCyLco', '2017-02-05 08:46:45', '2017-02-05 08:46:45'),
(28, 'Sterling Blick', 'pweimann@example.com', 'public/defaults/avatars/female.png', 'mr-adelbert-franecki', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'X9CStTQ0Zf', '2017-02-05 08:46:45', '2017-02-05 08:46:45'),
(29, 'Prof. Payton Quigley', 'sabina.johnson@example.net', 'public/defaults/avatars/female.png', 'josiah-collier', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'SwYnVMwHvN', '2017-02-05 08:46:45', '2017-02-05 08:46:45'),
(30, 'Anita Kerluke', 'rosenbaum.felipe@example.org', 'public/defaults/avatars/female.png', 'viviane-hand', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'a5vKP3ddlT', '2017-02-05 08:46:45', '2017-02-05 08:46:45'),
(31, 'Janis Reichel Sr.', 'cmoen@example.com', 'public/defaults/avatars/female.png', 'prof-julia-abshire-dds', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', '1sv6W3l6cF', '2017-02-05 08:46:46', '2017-02-05 08:46:46'),
(32, 'Ora Goodwin', 'rjohnson@example.com', 'public/defaults/avatars/female.png', 'prof-shea-bogisich', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'uApJoNHxc5', '2017-02-05 08:46:46', '2017-02-05 08:46:46'),
(33, 'Ronny Paucek', 'pedro.block@example.com', 'public/defaults/avatars/female.png', 'ora-johns', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'u5IGzu0Btq', '2017-02-05 08:46:46', '2017-02-05 08:46:46'),
(34, 'Beverly Tromp', 'brooke41@example.net', 'public/defaults/avatars/female.png', 'kianna-wolff-iv', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'g5BAeGwm3I', '2017-02-05 08:46:46', '2017-02-05 08:46:46'),
(35, 'Conner Doyle', 'hauck.isai@example.net', 'public/defaults/avatars/female.png', 'isidro-marvin', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', '7OB5C05qXt', '2017-02-05 08:46:46', '2017-02-05 08:46:46'),
(36, 'Genoveva Boyle', 'green.felicita@example.org', 'public/defaults/avatars/female.png', 'miss-ebba-schaefer-jr', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'relQd9yVVM', '2017-02-05 08:46:46', '2017-02-05 08:46:46'),
(37, 'Jalen Waters', 'mherman@example.org', 'public/defaults/avatars/female.png', 'meda-kemmer', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', '13dx1RGEEB', '2017-02-05 08:46:47', '2017-02-05 08:46:47'),
(38, 'Sage Lakin', 'wilmer50@example.com', 'public/defaults/avatars/female.png', 'gerald-farrell', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'owkExsrITA', '2017-02-05 08:46:47', '2017-02-05 08:46:47'),
(39, 'Deanna Gutmann', 'raynor.colby@example.com', 'public/defaults/avatars/female.png', 'levi-sipes', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', '8qj1Ya12PK', '2017-02-05 08:46:47', '2017-02-05 08:46:47'),
(40, 'Dr. Hipolito Luettgen MD', 'hwintheiser@example.net', 'public/defaults/avatars/female.png', 'dr-dan-ferry-dvm', 0, '$2y$10$z1GotLtL0vc0/tNd11idiOWXZC0DiFnIl8RLOzcYW41hmMu2pvmbG', 'GEMb78LqaG', '2017-02-05 08:46:48', '2017-02-05 08:46:48'),
(41, 'firoz rahman sabuz', 'smskushtia@gmail.com', 'public/avatars/2c72436483a81f387c3aaa39b85658c3.jpeg', 'firoz-rahman-sabuz', 1, '$2y$10$8w19C.JHgfKH.1sfJC8qE.38fT2Y2O7aLp8iURoSFtDWJkg.8dkYq', '8RbRF7yIZCNF8gP40nMpxhvJATFz8O1BoUhmHxW48EyGC7jo5QeqzkeIJhAM', '2017-02-05 08:51:33', '2017-02-05 08:57:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `friendships`
--
ALTER TABLE `friendships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `friendships`
--
ALTER TABLE `friendships`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
