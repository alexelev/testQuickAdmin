-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 11 2017 г., 17:04
-- Версия сервера: 5.7.19
-- Версия PHP: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Категория 1', '2017-11-11 11:49:48', '2017-11-11 11:49:48', NULL),
(2, 'Категория 2', '2017-11-11 11:50:02', '2017-11-11 11:50:02', NULL),
(3, 'Категория 3', '2017-11-11 11:50:16', '2017-11-11 11:50:16', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT NULL,
  `menu_type` int(11) NOT NULL DEFAULT '1',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `position`, `menu_type`, `icon`, `name`, `title`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 0, NULL, 'User', 'User', NULL, NULL, NULL),
(2, NULL, 0, NULL, 'Role', 'Role', NULL, NULL, NULL),
(3, 2, 1, 'fa-database', 'Categories', 'Categories', 5, '2017-11-11 11:45:52', '2017-11-11 12:04:05'),
(4, 1, 1, 'fa-database', 'Products', 'Products', 5, '2017-11-11 11:49:14', '2017-11-11 12:03:58'),
(5, 0, 2, 'fa-database', 'System', 'System', NULL, '2017-11-11 12:03:34', '2017-11-11 12:03:34');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_role`
--

CREATE TABLE `menu_role` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_role`
--

INSERT INTO `menu_role` (`menu_id`, `role_id`) VALUES
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_10_10_000000_create_menus_table', 1),
(4, '2015_10_10_000000_create_roles_table', 1),
(5, '2015_10_10_000000_update_users_table', 1),
(6, '2015_12_11_000000_create_users_logs_table', 1),
(7, '2016_03_14_000000_update_menus_table', 1),
(8, '2017_11_11_134552_create_categories_table', 2),
(9, '2017_11_11_134915_create_products_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `isActive` tinyint(4) DEFAULT '0',
  `price` decimal(15,2) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `photo`, `description`, `isActive`, `price`, `categories_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Продукт 1', '1510408583-stand1.jpg', '<h1>передовые технологии<br />\r\n<br />\r\nС 2000 года Luxoft сотрудничает с ведущими поставщиками технологий, включая компании входящие в Fortune 500, чтобы предоставлять самые современные технологические услуги, а также услуги по разработке продуктов и производственных приложений. Предлагаемые услуги в области передовых технологий позволяют нашим клиентам расширить свои возможности, снизить риски при внедрении новых идей, а также сократить накладные расходы и использовать внутренние ресурсы для решения более важных задач.</h1>', NULL, '100500.00', 1, '2017-11-11 11:56:24', '2017-11-11 11:57:06', NULL),
(2, 'Продукт 2', '1510408613-stand2.jpg', '<p>С 2000 года Luxoft сотрудничает с ведущими поставщиками технологий, включая компании входящие в Fortune 500, чтобы предоставлять самые современные технологические услуги, а также услуги по разработке продуктов и производственных приложений. Предлагаемые услуги в области передовых технологий позволяют нашим клиентам расширить свои возможности, снизить риски при внедрении новых идей, а также сократить накладные расходы и использовать внутренние ресурсы для решения более важных задач.</p>', NULL, '200500.00', 1, '2017-11-11 11:56:53', '2017-11-11 11:56:53', NULL),
(3, 'Продукт 3', '1510408652-stand2mini@2x.jpg', '<p>С 2000 года Luxoft сотрудничает с ведущими поставщиками технологий, включая компании входящие в Fortune 500, чтобы предоставлять самые современные технологические услуги, а также услуги по разработке продуктов и производственных приложений. Предлагаемые услуги в области передовых технологий позволяют нашим клиентам расширить свои возможности, снизить риски при внедрении новых идей, а также сократить накладные расходы и использовать внутренние ресурсы для решения более важных задач.</p>', NULL, '1000.00', 2, '2017-11-11 11:57:32', '2017-11-11 11:57:32', NULL),
(4, 'Продукт 4', '1510408678-stand3.jpg', '<p>С 2000 года Luxoft сотрудничает с ведущими поставщиками технологий, включая компании входящие в Fortune 500, чтобы предоставлять самые современные технологические услуги, а также услуги по разработке продуктов и производственных приложений. Предлагаемые услуги в области передовых технологий позволяют нашим клиентам расширить свои возможности, снизить риски при внедрении новых идей, а также сократить накладные расходы и использовать внутренние ресурсы для решения более важных задач.</p>', 1, '1000000.00', 3, '2017-11-11 11:57:58', '2017-11-11 11:57:58', NULL),
(5, 'Продукт 5', '1510408710-stand3mini.jpg', '<p>С 2000 года Luxoft сотрудничает с ведущими поставщиками технологий, включая компании входящие в Fortune 500, чтобы предоставлять самые современные технологические услуги, а также услуги по разработке продуктов и производственных приложений. Предлагаемые услуги в области передовых технологий позволяют нашим клиентам расширить свои возможности, снизить риски при внедрении новых идей, а также сократить накладные расходы и использовать внутренние ресурсы для решения более важных задач.</p>', 1, '300600.00', 2, '2017-11-11 11:58:30', '2017-11-11 11:58:30', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2017-11-11 11:33:51', '2017-11-11 11:33:51'),
(2, 'User', '2017-11-11 11:33:51', '2017-11-11 11:33:51');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@test.email', '$2y$10$wobhvsbNo7J4mBGmZ79JVOm.wbgNireMRKUyzit.SKhtZB9QRrRs2', NULL, '2017-11-11 11:34:08', '2017-11-11 11:34:08');

-- --------------------------------------------------------

--
-- Структура таблицы `users_logs`
--

CREATE TABLE `users_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users_logs`
--

INSERT INTO `users_logs` (`id`, `user_id`, `action`, `action_model`, `action_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'created', 'categories', 1, '2017-11-11 11:49:48', '2017-11-11 11:49:48'),
(2, 1, 'created', 'categories', 2, '2017-11-11 11:50:02', '2017-11-11 11:50:02'),
(3, 1, 'created', 'categories', 3, '2017-11-11 11:50:16', '2017-11-11 11:50:16'),
(4, 1, 'created', 'products', 1, '2017-11-11 11:56:24', '2017-11-11 11:56:24'),
(5, 1, 'created', 'products', 2, '2017-11-11 11:56:53', '2017-11-11 11:56:53'),
(6, 1, 'updated', 'products', 1, '2017-11-11 11:57:06', '2017-11-11 11:57:06'),
(7, 1, 'created', 'products', 3, '2017-11-11 11:57:32', '2017-11-11 11:57:32'),
(8, 1, 'created', 'products', 4, '2017-11-11 11:57:58', '2017-11-11 11:57:58'),
(9, 1, 'created', 'products', 5, '2017-11-11 11:58:30', '2017-11-11 11:58:30');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_role`
--
ALTER TABLE `menu_role`
  ADD UNIQUE KEY `menu_role_menu_id_role_id_unique` (`menu_id`,`role_id`),
  ADD KEY `menu_role_menu_id_index` (`menu_id`),
  ADD KEY `menu_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `users_logs`
--
ALTER TABLE `users_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `users_logs`
--
ALTER TABLE `users_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `menu_role`
--
ALTER TABLE `menu_role`
  ADD CONSTRAINT `menu_role_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
