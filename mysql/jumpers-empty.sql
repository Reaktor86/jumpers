-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 07 2021 г., 19:49
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `jumpers`
--

-- --------------------------------------------------------

--
-- Структура таблицы `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `score` int(11) NOT NULL,
  `map` int(11) NOT NULL,
  `reputation` int(11) NOT NULL,
  `time` varchar(36) NOT NULL,
  `date` varchar(36) NOT NULL,
  `name-A` varchar(32) NOT NULL,
  `name-B` varchar(32) NOT NULL,
  `name-C` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cups`
--

CREATE TABLE `cups` (
  `id` int(11) NOT NULL,
  `name` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cups`
--

INSERT INTO `cups` (`id`, `name`) VALUES
(1, 'бронза'),
(2, 'серебро'),
(3, 'золото'),
(4, 'платина');

-- --------------------------------------------------------

--
-- Структура таблицы `saved_games`
--

CREATE TABLE `saved_games` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `save` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `stat`
--

CREATE TABLE `stat` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `moves` int(11) NOT NULL,
  `finish_first` int(11) NOT NULL,
  `items_bought` int(11) NOT NULL,
  `power_used` int(11) NOT NULL,
  `races` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `money_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `trophies`
--

CREATE TABLE `trophies` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `type_id` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `progress_total` int(11) NOT NULL,
  `users_achieved` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `trophies`
--

INSERT INTO `trophies` (`id`, `name`, `description`, `type_id`, `hidden`, `progress_total`, `users_achieved`) VALUES
(1, 'Начало пути', 'Завершите 1 трассу', 1, 0, 1, NULL),
(2, 'Вторая пройдена', 'Завершите 2 трассу', 1, 0, 1, NULL),
(3, 'Цвет настроения - оранжевый', 'Завершите 3 трассу', 1, 0, 1, NULL),
(4, 'Преодоление трудностей', 'Завершите 4 трассу', 1, 0, 1, NULL),
(5, 'К финалу готов', 'Завершите 5 трассу', 1, 0, 1, NULL),
(6, 'Повелитель швабры', 'Получите швабру', 2, 1, 1, NULL),
(7, 'Ложный финал', 'Завершите основную часть имперского чемпионата', 1, 1, 1, NULL),
(8, 'В гору', 'Завершите 7 трассу', 1, 0, 1, NULL),
(9, 'Восьмая пройдена', 'Завершите 8 трассу', 1, 0, 1, NULL),
(10, 'Взбитые сливки', 'Завершите 9 трассу', 1, 0, 1, NULL),
(11, 'На вершине вулкана', 'Завершите 10 трассу', 1, 0, 1, NULL),
(12, 'Чемпион!', 'Выиграйте имперский чемпионат', 3, 0, 1, NULL),
(13, 'Мы больше не друзья', 'Откажитесь от предложения императора в конце чемпионата', 1, 1, 1, NULL),
(14, 'Инвестор', 'Примите предложение императора в конце чемпионата', 1, 1, 1, NULL),
(15, 'Можно выдохнуть', 'Завершите имперский чемпионат', 2, 0, 1, NULL),
(16, 'Череп и кости', 'Завершите 12 трассу', 1, 1, 1, NULL),
(17, 'Выживший', 'Завершите 13 трассу', 1, 1, 1, NULL),
(18, 'Прощайте, черепушки!', 'Завершите 14 трассу', 1, 1, 1, NULL),
(19, 'Я спасу тебя!', 'Дойдите до пленницы на трассе 15', 2, 1, 1, NULL),
(20, 'Чудесное спасение', 'Дойдите живым до выхода на трассе 15', 2, 1, 1, NULL),
(21, 'Герой Империи', 'Спасите пленницу и получите звание Героя Империи', 3, 1, 1, NULL),
(22, 'Твоя фишка', 'Купите свою первую фишку', 1, 0, 1, NULL),
(23, 'Увеличиваем шансы', 'Купите свой первый предмет', 1, 0, 1, NULL),
(24, 'Элитный прыгун', 'Купите элитную фишку', 1, 0, 1, NULL),
(25, 'Они мне все нравятся', 'Купите хотя бы 1 раз каждый предмет в магазине', 1, 0, 7, NULL),
(26, 'Максимальная скорость', 'Переместитесь на максимальное число клеток за 1 ход', 1, 0, 1, NULL),
(27, 'Хищник', 'Три раза поймайте соперника в капкан', 1, 0, 3, NULL),
(28, 'Кусь!', 'Три раза укусите соперника вампирскими клыками', 1, 0, 3, NULL),
(29, 'Сила есть, и ум тоже', 'Три раза выкиньте соперника с трассы', 1, 0, 3, NULL),
(30, 'Боец', 'Потратьте на борьбе с соперниками 10 единиц силы', 1, 0, 10, NULL),
(31, 'Воин', 'Потратьте на борьбе с соперниками 50 единиц силы', 2, 0, 50, NULL),
(32, 'Магнетизм', 'Финишируйте с помощью магнита', 1, 0, 1, NULL),
(33, 'Это невозможно!', 'Получите невозможный кубик', 2, 1, 1, NULL),
(34, 'Секретное оружие', 'Воспользуйтесь всеми секретными предметами в игре', 2, 0, 2, NULL),
(35, 'Оправданный риск', 'Финишируйте на 5-й трассе через опасное первое ответвление', 1, 0, 1, NULL),
(36, 'Мастер щита', 'Соберите с помощью щита 500 $', 1, 0, 500, NULL),
(37, 'Накопил на старость', 'Соберите с копилки 1000 $', 1, 0, 1000, NULL),
(38, 'Сладкий вкус победы', 'Займите 1 место на любой трассе', 1, 0, 1, NULL),
(39, 'Победа стала слаще', 'Займите 1 место на любой трассе 5 раз', 2, 0, 5, NULL),
(40, 'Победитель по жизни', 'Займите 1 место на любой трассе 15 раз', 3, 0, 15, NULL),
(41, 'Манипулятор', 'Заставьте соперника встать на зелёную клетку', 1, 0, 1, NULL),
(42, 'Тупой, ещё тупее', 'Завершите имперский чемпионат с тремя тупыми соперниками', 1, 0, 1, NULL),
(43, 'Спасибо за преданность!', 'Сыграйте в «Прыгунов» три раза', 3, 0, 3, NULL),
(44, 'Допрыгался', 'Выбейте все достижения в «Прыгунах»', 4, 0, 43, NULL),
(45, 'magnet', 'Для достижения \"Они мне все нравятся\"', 1, 1, 1, NULL),
(46, 'smagnet', 'Для достижения \"Они мне все нравятся\"', 1, 1, 1, NULL),
(47, 'shield', 'Для достижения \"Они мне все нравятся\"', 1, 1, 1, NULL),
(48, 'ishield', 'Для достижения \"Они мне все нравятся\"', 1, 1, 1, NULL),
(49, 'trap', 'Для достижения \"Они мне все нравятся\"', 1, 1, 1, NULL),
(50, 'vampire', 'Для достижения \"Они мне все нравятся\"', 1, 1, 1, NULL),
(51, 'impItem', 'Для достижения \"Они мне все нравятся\"', 1, 1, 1, NULL),
(52, 'impUse', 'Для достижения \"Секретное оружие\"', 1, 1, 1, NULL),
(53, 'mop', 'Для достижения \"Секретное оружие\"', 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `online` tinyint(1) NOT NULL,
  `email` varchar(64) NOT NULL,
  `hash` varchar(64) NOT NULL,
  `email_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `reg_date` varchar(36) NOT NULL,
  `lastMailSend` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_trophies`
--

CREATE TABLE `user_trophies` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `trophy_id` int(11) NOT NULL,
  `progress` int(11) NOT NULL,
  `achieved` tinyint(1) NOT NULL,
  `date` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `cups`
--
ALTER TABLE `cups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `saved_games`
--
ALTER TABLE `saved_games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `stat`
--
ALTER TABLE `stat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `trophies`
--
ALTER TABLE `trophies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_trophies`
--
ALTER TABLE `user_trophies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trophy_id` (`trophy_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT для таблицы `cups`
--
ALTER TABLE `cups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `saved_games`
--
ALTER TABLE `saved_games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT для таблицы `stat`
--
ALTER TABLE `stat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT для таблицы `trophies`
--
ALTER TABLE `trophies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT для таблицы `user_trophies`
--
ALTER TABLE `user_trophies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `saved_games`
--
ALTER TABLE `saved_games`
  ADD CONSTRAINT `saved_games_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `stat`
--
ALTER TABLE `stat`
  ADD CONSTRAINT `stat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `trophies`
--
ALTER TABLE `trophies`
  ADD CONSTRAINT `trophies_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `cups` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_trophies`
--
ALTER TABLE `user_trophies`
  ADD CONSTRAINT `user_trophies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_trophies_ibfk_2` FOREIGN KEY (`trophy_id`) REFERENCES `trophies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
