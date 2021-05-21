-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 05 2021 г., 13:33
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

--
-- Дамп данных таблицы `characters`
--

INSERT INTO `characters` (`id`, `user_id`, `name`, `score`, `map`, `reputation`, `time`, `date`, `name-A`, `name-B`, `name-C`) VALUES
(1, 9, 'Reaktor', 4810, 11, 0, '02:05:18', '2021 Mar 25 10:28', '', '', ''),
(2, 9, 'Чебуратор', 0, 1, 0, '0', '', '', '', ''),
(3, 9, 'fqwfq', 0, 1, 0, '0', '', '', '', ''),
(4, 9, 'qq', 0, 1, 0, '0', '', '', '', ''),
(5, 9, 'CW', 0, 1, 0, '0', '', '', '', ''),
(6, 9, 'ege', 0, 1, 0, '0', '', '', '', ''),
(7, 9, 'gvwg', 0, 1, 0, '0', '', '', '', ''),
(8, 9, 'мцым', 0, 1, 0, '0', '', '', '', ''),
(9, 9, 'swvwsv', 0, 1, 0, '0', '', '', '', ''),
(10, 9, 'wfwf', 0, 1, 0, '0', '', '', '', ''),
(11, 9, 'Robo DJ', 4880, 15, 2, '03:13:33', '2021 Mar 26 18:31', '', '', ''),
(12, 9, 'Stomper', 0, 1, 0, '0', '', '', '', ''),
(13, 10, 'dgveg', 0, 1, 0, '0', '', '', '', ''),
(14, 10, 'цацпа', 0, 1, 0, '0', '', '', '', ''),
(15, 10, 'svwgvs', 0, 1, 0, '0', '', '', '', ''),
(17, 9, 'DRS', 5960, 15, 2, '03:05:35', '2021 Mar 29 17:36', 'Куплинов', 'Пикуля', 'Санта Клаус'),
(18, 9, 'wfwf', 0, 1, 0, '0', '', 'Кума', 'Фенечка', 'Мэри Поппинс'),
(19, 9, 'DRS', 5880, 15, 2, '03:02:35', '2021 Mar 29 17:48', '', '', ''),
(20, 9, 'sfwsgs', 0, 1, 0, '0', '', 'Бывалый', 'Неандерталец', 'Мэддисон');

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

--
-- Дамп данных таблицы `saved_games`
--

INSERT INTO `saved_games` (`id`, `user_id`, `save`) VALUES
(1, 9, '{\"u041eu043bu0435u0436u0435u043a\":{\"slot1\":{\"year\":\"2021\",\"month\":\"Mar\",\"day\":\"29\",\"hour\":\"18\",\"min\":\"43\",\"players\":[{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":2,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":2,\"powerUsed\":0,\"currentCell\":551,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":true,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":0,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"A\",\"model\":\"white\",\"place\":2,\"label\":\"u041fu043bu0435u043du043du0438u0446u0430\",\"shift\":1},{\"type\":\"comp\",\"aiType\":\"balanced\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":315,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":0,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"B\",\"model\":\"white\",\"place\":2,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 B\"},{\"type\":\"comp\",\"aiType\":\"balanced\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":315,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":0,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"C\",\"model\":\"white\",\"place\":3,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 C\"},{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":10,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":2,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":true,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":1000,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":true,\"name\":[],\"letter\":\"D\",\"model\":\"black\",\"place\":1,\"label\":\"u0418u0433u0440u043eu043a D\"}],\"gameSpeed\":1,\"labelsOn\":true,\"skipTutorial\":true,\"unlockMagnet\":false,\"unlockSMagnet\":false,\"unlockShield\":false,\"unlockIShield\":false,\"unlockTrap\":false,\"unlockVampire\":false,\"unlockImp\":false,\"unlockMop\":false,\"unlockManipulator\":false,\"conditionsCount\":18,\"knowBranch\":true,\"knowOrange\":true,\"knowBlack\":true,\"knowArrowBlue\":true,\"knowBonus\":true,\"knowStarOr\":true,\"knowStarRed\":true,\"knowMoneybag\":true,\"knowSpeed\":true,\"knowDeadend\":true,\"knowHatched\":true,\"knowAction\":false,\"knowJoker\":true,\"knowBone\":true,\"showedHintLegend\":false,\"showedHintRed\":false,\"showedHintAttack\":false,\"showedHintLog\":false,\"showedHintZone\":false,\"showedHintUseMagnet\":false,\"showedHintUseSMagnet\":false,\"showedHintUseShield\":true,\"showedHintUseIShield\":false,\"showedHintUseTrap\":false,\"showedHintUseHatched\":false,\"showedHintUseVampire\":false,\"showedHintUseIMP\":false,\"showedHintUseMop\":false,\"level\":14,\"status\":\"over\",\"slot\":1,\"reputation\":4,\"firstBite\":true,\"secondBite\":true,\"gameTime\":111},\"slot2\":{\"year\":\"2021\",\"month\":\"Mar\",\"day\":\"26\",\"hour\":\"18\",\"min\":\"31\",\"charId\":11,\"players\":[{\"type\":\"comp\",\"aiType\":\"balanced\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":16,\"powerUsed\":0,\"currentCell\":763,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":4,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":940,\"bonusMoney\":0,\"magnets\":1,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":2,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"A\",\"model\":\"brown\",\"place\":1,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 A\"},{\"type\":\"comp\",\"aiType\":\"risky\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":1,\"moves\":14,\"powerUsed\":0,\"currentCell\":543,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":3,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":1000,\"bonusMoney\":0,\"magnets\":1,\"smagnets\":0,\"shields\":1,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"B\",\"model\":\"blue\",\"place\":2,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 B\"},{\"type\":\"comp\",\"aiType\":\"careful\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":14,\"powerUsed\":0,\"currentCell\":542,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":4,\"dream\":\"brown\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":3560,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":1,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"C\",\"model\":\"blue\",\"place\":3,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 C\"},{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":5,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":15,\"powerUsed\":0,\"currentCell\":550,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":4880,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":true,\"name\":[],\"letter\":\"D\",\"model\":\"black\",\"place\":4,\"label\":\"Robo DJ\"}],\"gameSpeed\":1,\"labelsOn\":true,\"skipTutorial\":true,\"unlockMagnet\":true,\"unlockSMagnet\":true,\"unlockShield\":true,\"unlockIShield\":true,\"unlockTrap\":true,\"unlockVampire\":true,\"unlockImp\":true,\"unlockMop\":false,\"unlockManipulator\":true,\"conditionsCount\":18,\"knowBranch\":true,\"knowOrange\":true,\"knowBlack\":true,\"knowArrowBlue\":true,\"knowBonus\":true,\"knowStarOr\":true,\"knowStarRed\":true,\"knowMoneybag\":true,\"knowSpeed\":true,\"knowDeadend\":true,\"knowHatched\":true,\"knowAction\":false,\"knowJoker\":true,\"knowBone\":true,\"showedHintLegend\":true,\"showedHintRed\":true,\"showedHintAttack\":true,\"showedHintLog\":false,\"showedHintZone\":true,\"showedHintUseMagnet\":true,\"showedHintUseSMagnet\":true,\"showedHintUseShield\":true,\"showedHintUseIShield\":true,\"showedHintUseTrap\":true,\"showedHintUseHatched\":true,\"showedHintUseVampire\":true,\"showedHintUseIMP\":true,\"showedHintUseMop\":false,\"level\":14,\"status\":\"over\",\"slot\":2,\"reputation\":2,\"firstBite\":false,\"secondBite\":false,\"gameTime\":11587,\"winner\":{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":5,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":15,\"powerUsed\":0,\"currentCell\":550,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":4880,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":true,\"name\":[],\"letter\":\"D\",\"model\":\"black\",\"place\":4,\"label\":\"Robo DJ\"},\"impGiven\":true},\"slot3\":{\"year\":\"2021\",\"month\":\"Mar\",\"day\":\"29\",\"hour\":\"16\",\"min\":\"47\",\"charId\":17,\"players\":[{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":0,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":31,\"powerUsed\":1,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":1,\"dream\":\"black\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":2990,\"bonusMoney\":-20,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"B\",\"model\":\"brown\",\"place\":2,\"label\":\"u041fu0438u043au0443u043bu044f\"},{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":6,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":16,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":4920,\"bonusMoney\":580,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":true,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"D\",\"model\":\"brown\",\"place\":1,\"label\":\"DRS\"},{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":-1,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":55,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":true,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":220,\"bonusMoney\":-370,\"magnets\":-1,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"C\",\"model\":\"blue\",\"place\":4,\"label\":\"u0421u0430u043du0442u0430 u041au043bu0430u0443u0441\"},{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":0,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":55,\"powerUsed\":3,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":3,\"dream\":\"blue\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":1050,\"bonusMoney\":-250,\"magnets\":-1,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":true,\"vampire\":true,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"A\",\"model\":\"green\",\"place\":3,\"label\":\"u041au0443u043fu043bu0438u043du043eu0432\"}],\"gameSpeed\":1,\"labelsOn\":true,\"skipTutorial\":true,\"unlockMagnet\":true,\"unlockSMagnet\":true,\"unlockShield\":true,\"unlockIShield\":true,\"unlockTrap\":true,\"unlockVampire\":true,\"unlockImp\":false,\"unlockMop\":false,\"unlockManipulator\":false,\"conditionsCount\":17,\"knowBranch\":true,\"knowOrange\":true,\"knowBlack\":true,\"knowArrowBlue\":true,\"knowBonus\":true,\"knowStarOr\":true,\"knowStarRed\":true,\"knowMoneybag\":true,\"knowSpeed\":true,\"knowDeadend\":true,\"knowHatched\":true,\"knowAction\":true,\"knowJoker\":true,\"knowBone\":false,\"showedHintLegend\":true,\"showedHintRed\":true,\"showedHintAttack\":true,\"showedHintLog\":false,\"showedHintZone\":true,\"showedHintUseMagnet\":true,\"showedHintUseSMagnet\":true,\"showedHintUseShield\":true,\"showedHintUseIShield\":true,\"showedHintUseTrap\":true,\"showedHintUseHatched\":true,\"showedHintUseVampire\":true,\"showedHintUseIMP\":true,\"showedHintUseMop\":true,\"level\":10,\"status\":\"finish\",\"slot\":\"3\",\"reputation\":0,\"firstBite\":true,\"secondBite\":true,\"gameTime\":9255,\"impGiven\":true},\"slot4\":{\"year\":\"2021\",\"month\":\"Mar\",\"day\":\"29\",\"hour\":\"17\",\"min\":\"48\",\"charId\":17,\"players\":[{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":17,\"powerUsed\":0,\"currentCell\":540,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":3,\"dream\":\"blue\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":1050,\"bonusMoney\":0,\"magnets\":-1,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":true,\"vampire\":true,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"A\",\"model\":\"green\",\"place\":1,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 A\"},{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":9999,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":17,\"powerUsed\":0,\"currentCell\":763,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":1,\"dream\":\"black\",\"speed\":2,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":2990,\"bonusMoney\":-80,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"B\",\"model\":\"brown\",\"place\":2,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 B\"},{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":16,\"powerUsed\":0,\"currentCell\":550,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":220,\"bonusMoney\":0,\"magnets\":-1,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"C\",\"model\":\"blue\",\"place\":3,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 C\"},{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":4,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":17,\"powerUsed\":0,\"currentCell\":757,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":5880,\"bonusMoney\":140,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":true,\"name\":[],\"letter\":\"D\",\"model\":\"black\",\"place\":4,\"label\":\"DRS\"}],\"gameSpeed\":1,\"labelsOn\":true,\"skipTutorial\":true,\"unlockMagnet\":true,\"unlockSMagnet\":true,\"unlockShield\":true,\"unlockIShield\":true,\"unlockTrap\":true,\"unlockVampire\":true,\"unlockImp\":true,\"unlockMop\":false,\"unlockManipulator\":true,\"conditionsCount\":18,\"knowBranch\":true,\"knowOrange\":true,\"knowBlack\":true,\"knowArrowBlue\":true,\"knowBonus\":true,\"knowStarOr\":true,\"knowStarRed\":true,\"knowMoneybag\":true,\"knowSpeed\":true,\"knowDeadend\":true,\"knowHatched\":true,\"knowAction\":false,\"knowJoker\":true,\"knowBone\":true,\"showedHintLegend\":true,\"showedHintRed\":true,\"showedHintAttack\":true,\"showedHintLog\":false,\"showedHintZone\":true,\"showedHintUseMagnet\":true,\"showedHintUseSMagnet\":true,\"showedHintUseShield\":true,\"showedHintUseIShield\":true,\"showedHintUseTrap\":true,\"showedHintUseHatched\":true,\"showedHintUseVampire\":true,\"showedHintUseIMP\":true,\"showedHintUseMop\":true,\"level\":14,\"status\":\"over\",\"slot\":\"4\",\"reputation\":2,\"firstBite\":false,\"secondBite\":true,\"gameTime\":10947,\"winner\":{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":6,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":16,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":3380,\"bonusMoney\":580,\"magnets\":1,\"smagnets\":2,\"shields\":1,\"ishields\":1,\"trap\":false,\"vampire\":true,\"mop\":false,\"mopCheck\":false,\"imp\":3,\"impUsed\":false,\"manipulator\":true,\"name\":[],\"letter\":\"D\",\"model\":\"black\",\"place\":4,\"label\":\"DRS\"},\"impGiven\":true},\"slot5\":{\"year\":\"2021\",\"month\":\"Mar\",\"day\":\"29\",\"hour\":\"17\",\"min\":\"36\",\"charId\":17,\"players\":[{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":-1,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":9,\"powerUsed\":0,\"currentCell\":522,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":3,\"dream\":\"blue\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":1050,\"bonusMoney\":0,\"magnets\":-1,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":true,\"vampire\":true,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"A\",\"model\":\"green\",\"place\":1,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 A\"},{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":9,\"powerUsed\":0,\"currentCell\":540,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":1,\"dream\":\"black\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":2990,\"bonusMoney\":-80,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"B\",\"model\":\"brown\",\"place\":2,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 B\"},{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":9,\"powerUsed\":0,\"currentCell\":532,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":220,\"bonusMoney\":0,\"magnets\":-1,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"C\",\"model\":\"blue\",\"place\":3,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 C\"},{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":-2,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":9,\"powerUsed\":0,\"currentCell\":540,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":2,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":5960,\"bonusMoney\":80,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":true,\"name\":[],\"letter\":\"D\",\"model\":\"black\",\"place\":4,\"label\":\"DRS\"}],\"gameSpeed\":1,\"labelsOn\":true,\"skipTutorial\":true,\"unlockMagnet\":true,\"unlockSMagnet\":true,\"unlockShield\":true,\"unlockIShield\":true,\"unlockTrap\":true,\"unlockVampire\":true,\"unlockImp\":true,\"unlockMop\":false,\"unlockManipulator\":true,\"conditionsCount\":18,\"knowBranch\":true,\"knowOrange\":true,\"knowBlack\":true,\"knowArrowBlue\":true,\"knowBonus\":true,\"knowStarOr\":true,\"knowStarRed\":true,\"knowMoneybag\":true,\"knowSpeed\":true,\"knowDeadend\":true,\"knowHatched\":true,\"knowAction\":false,\"knowJoker\":true,\"knowBone\":true,\"showedHintLegend\":true,\"showedHintRed\":true,\"showedHintAttack\":true,\"showedHintLog\":false,\"showedHintZone\":true,\"showedHintUseMagnet\":true,\"showedHintUseSMagnet\":true,\"showedHintUseShield\":true,\"showedHintUseIShield\":true,\"showedHintUseTrap\":true,\"showedHintUseHatched\":true,\"showedHintUseVampire\":true,\"showedHintUseIMP\":true,\"showedHintUseMop\":true,\"level\":14,\"status\":\"over\",\"slot\":5,\"reputation\":2,\"firstBite\":false,\"secondBite\":true,\"gameTime\":11117,\"winner\":{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":6,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":16,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":3380,\"bonusMoney\":580,\"magnets\":1,\"smagnets\":2,\"shields\":1,\"ishields\":1,\"trap\":false,\"vampire\":true,\"mop\":false,\"mopCheck\":false,\"imp\":3,\"impUsed\":false,\"manipulator\":true,\"name\":[],\"letter\":\"D\",\"model\":\"black\",\"place\":4,\"label\":\"DRS\"},\"impGiven\":true},\"slot6\":{\"year\":\"2021\",\"month\":\"Mar\",\"day\":\"29\",\"hour\":\"18\",\"min\":\"26\",\"charId\":17,\"players\":[{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":5,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":3,\"dream\":\"blue\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":1050,\"bonusMoney\":0,\"magnets\":-1,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":true,\"vampire\":true,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"A\",\"model\":\"green\",\"place\":1,\"label\":\"u041au0443u043fu043bu0438u043du043eu0432\"},{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":8,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":1,\"dream\":\"black\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":2990,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"B\",\"model\":\"brown\",\"place\":2,\"label\":\"u041fu0438u043au0443u043bu044f\"},{\"type\":\"comp\",\"aiType\":\"stupid\",\"power\":6,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":220,\"bonusMoney\":0,\"magnets\":-1,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"C\",\"model\":\"blue\",\"place\":3,\"label\":\"u0421u0430u043du0442u0430 u041au043bu0430u0443u0441\"},{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":8,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":4920,\"bonusMoney\":0,\"magnets\":1,\"smagnets\":0,\"shields\":1,\"ishields\":0,\"trap\":false,\"vampire\":true,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":true,\"name\":[],\"letter\":\"D\",\"model\":\"black\",\"place\":4,\"label\":\"DRS\"}],\"gameSpeed\":1,\"labelsOn\":true,\"skipTutorial\":true,\"unlockMagnet\":true,\"unlockSMagnet\":true,\"unlockShield\":true,\"unlockIShield\":true,\"unlockTrap\":true,\"unlockVampire\":true,\"unlockImp\":true,\"unlockMop\":false,\"unlockManipulator\":true,\"conditionsCount\":17,\"knowBranch\":true,\"knowOrange\":true,\"knowBlack\":true,\"knowArrowBlue\":true,\"knowBonus\":true,\"knowStarOr\":true,\"knowStarRed\":true,\"knowMoneybag\":true,\"knowSpeed\":true,\"knowDeadend\":true,\"knowHatched\":true,\"knowAction\":false,\"knowJoker\":true,\"knowBone\":false,\"showedHintLegend\":true,\"showedHintRed\":true,\"showedHintAttack\":true,\"showedHintLog\":false,\"showedHintZone\":true,\"showedHintUseMagnet\":true,\"showedHintUseSMagnet\":true,\"showedHintUseShield\":true,\"showedHintUseIShield\":true,\"showedHintUseTrap\":true,\"showedHintUseHatched\":true,\"showedHintUseVampire\":true,\"showedHintUseIMP\":true,\"showedHintUseMop\":true,\"level\":11,\"status\":\"start\",\"slot\":6,\"reputation\":1,\"firstBite\":true,\"secondBite\":true,\"gameTime\":9287,\"winner\":{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":8,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":4920,\"bonusMoney\":0,\"magnets\":1,\"smagnets\":0,\"shields\":1,\"ishields\":0,\"trap\":false,\"vampire\":true,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":true,\"name\":[],\"letter\":\"D\",\"model\":\"black\",\"place\":4,\"label\":\"DRS\"},\"impGiven\":true},\"slot7\":{\"year\":\"2021\",\"month\":\"Mar\",\"day\":\"29\",\"hour\":\"18\",\"min\":\"28\",\"charId\":20,\"players\":[{\"type\":\"comp\",\"aiType\":\"balanced\",\"power\":2,\"bonusMoves\":0,\"skipMoves\":2,\"moves\":1,\"powerUsed\":0,\"currentCell\":0,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":70,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"A\",\"model\":\"white\",\"place\":4,\"label\":\"u0411u044bu0432u0430u043bu044bu0439\"},{\"type\":\"comp\",\"aiType\":\"risky\",\"power\":1,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":2,\"powerUsed\":1,\"currentCell\":0,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":150,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"B\",\"model\":\"white\",\"place\":2,\"label\":\"u041du0435u0430u043du0434u0435u0440u0442u0430u043bu0435u0446\"},{\"type\":\"comp\",\"aiType\":\"careful\",\"power\":1,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":2,\"powerUsed\":1,\"currentCell\":0,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":2,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":100,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"C\",\"model\":\"white\",\"place\":3,\"label\":\"u041cu044du0434u0434u0438u0441u043eu043d\"},{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":2,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":1,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":200,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"D\",\"model\":\"white\",\"place\":1,\"label\":\"sfwsgs\"}],\"gameSpeed\":1,\"labelsOn\":true,\"skipTutorial\":true,\"unlockMagnet\":false,\"unlockSMagnet\":false,\"unlockShield\":false,\"unlockIShield\":false,\"unlockTrap\":false,\"unlockVampire\":false,\"unlockImp\":false,\"unlockMop\":false,\"unlockManipulator\":false,\"conditionsCount\":5,\"knowBranch\":false,\"knowOrange\":false,\"knowBlack\":false,\"knowArrowBlue\":false,\"knowBonus\":false,\"knowStarOr\":false,\"knowStarRed\":false,\"knowMoneybag\":false,\"knowSpeed\":false,\"knowDeadend\":false,\"knowHatched\":false,\"knowAction\":false,\"knowJoker\":false,\"knowBone\":false,\"showedHintLegend\":false,\"showedHintRed\":false,\"showedHintAttack\":false,\"showedHintLog\":false,\"showedHintZone\":false,\"showedHintUseMagnet\":false,\"showedHintUseSMagnet\":false,\"showedHintUseShield\":false,\"showedHintUseIShield\":false,\"showedHintUseTrap\":false,\"showedHintUseHatched\":false,\"showedHintUseVampire\":false,\"showedHintUseIMP\":false,\"showedHintUseMop\":false,\"level\":0,\"status\":\"finish\",\"slot\":7,\"reputation\":0,\"firstBite\":true,\"secondBite\":true,\"gameTime\":55}},\"trophy\":{\"slot1\":{\"year\":\"2021\",\"month\":\"Mar\",\"day\":\"27\",\"hour\":\"17\",\"min\":\"34\",\"charId\":15,\"players\":[{\"type\":\"comp\",\"aiType\":\"balanced\",\"power\":0,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":0,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"A\",\"model\":\"white\",\"place\":1,\"label\":\"u0416u0430u0440u043eu0432u043du044f\"},{\"type\":\"comp\",\"aiType\":\"risky\",\"power\":0,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":0,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"B\",\"model\":\"white\",\"place\":2,\"label\":\"u0422u0438u043cu043eu043d\"},{\"type\":\"comp\",\"aiType\":\"careful\",\"power\":0,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":0,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"C\",\"model\":\"white\",\"place\":3,\"label\":\"u0411u0443u0440u0430u0442u0438u043d\"},{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":0,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":0,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"D\",\"model\":\"white\",\"place\":4,\"label\":\"svwgvs\"}],\"gameSpeed\":1.4,\"labelsOn\":true,\"skipTutorial\":false,\"unlockMagnet\":false,\"unlockSMagnet\":false,\"unlockShield\":false,\"unlockIShield\":false,\"unlockTrap\":false,\"unlockVampire\":false,\"unlockImp\":false,\"unlockMop\":false,\"unlockManipulator\":false,\"conditionsCount\":5,\"knowBranch\":false,\"knowOrange\":false,\"knowBlack\":false,\"knowArrowBlue\":false,\"knowBonus\":false,\"knowStarOr\":false,\"knowStarRed\":false,\"knowMoneybag\":false,\"knowSpeed\":false,\"knowDeadend\":false,\"knowHatched\":false,\"knowAction\":false,\"knowJoker\":false,\"knowBone\":false,\"showedHintLegend\":false,\"showedHintRed\":false,\"showedHintAttack\":false,\"showedHintLog\":false,\"showedHintZone\":false,\"showedHintUseMagnet\":false,\"showedHintUseSMagnet\":false,\"showedHintUseShield\":false,\"showedHintUseIShield\":false,\"showedHintUseTrap\":false,\"showedHintUseHatched\":false,\"showedHintUseVampire\":false,\"showedHintUseIMP\":false,\"showedHintUseMop\":false,\"level\":0,\"status\":\"start\",\"slot\":1,\"reputation\":0,\"firstBite\":true,\"secondBite\":true,\"gameTime\":0}}}'),
(2, 10, '{\"u041eu043bu0435u0436u0435u043a\":{\"slot1\":{\"year\":\"2021\",\"month\":\"Mar\",\"day\":\"26\",\"hour\":\"17\",\"min\":\"54\",\"charId\":11,\"players\":[{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":3,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":23,\"powerUsed\":2,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":4270,\"bonusMoney\":-70,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"D\",\"model\":\"blue\",\"place\":2,\"label\":\"Robo DJ\"},{\"type\":\"comp\",\"aiType\":\"careful\",\"power\":3,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":21,\"powerUsed\":1,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":4,\"dream\":\"brown\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":3560,\"bonusMoney\":180,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":1,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"C\",\"model\":\"blue\",\"place\":1,\"label\":\"u0420u0443u0431u0430u043du043eu043a\"},{\"type\":\"comp\",\"aiType\":\"balanced\",\"power\":4,\"bonusMoves\":0,\"skipMoves\":1,\"moves\":22,\"powerUsed\":6,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":4,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":940,\"bonusMoney\":-290,\"magnets\":1,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":true,\"imp\":2,\"impUsed\":true,\"manipulator\":false,\"name\":[],\"letter\":\"A\",\"model\":\"brown\",\"place\":3,\"label\":\"u0413u0430u0440u0438u043a u0425u0430u0440u043bu0430u043cu043eu0432\"},{\"type\":\"comp\",\"aiType\":\"risky\",\"power\":-1,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":10,\"powerUsed\":1,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":true,\"shiftPos\":1,\"fore\":false,\"buyCount\":3,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":1000,\"bonusMoney\":350,\"magnets\":1,\"smagnets\":0,\"shields\":1,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"B\",\"model\":\"blue\",\"place\":4,\"label\":\"u041du044eu0448u0430\"}],\"gameSpeed\":1,\"labelsOn\":true,\"skipTutorial\":true,\"unlockMagnet\":true,\"unlockSMagnet\":true,\"unlockShield\":true,\"unlockIShield\":true,\"unlockTrap\":true,\"unlockVampire\":true,\"unlockImp\":false,\"unlockMop\":false,\"unlockManipulator\":false,\"conditionsCount\":17,\"knowBranch\":true,\"knowOrange\":true,\"knowBlack\":true,\"knowArrowBlue\":true,\"knowBonus\":true,\"knowStarOr\":true,\"knowStarRed\":true,\"knowMoneybag\":true,\"knowSpeed\":true,\"knowDeadend\":true,\"knowHatched\":true,\"knowAction\":true,\"knowJoker\":true,\"knowBone\":false,\"showedHintLegend\":true,\"showedHintRed\":true,\"showedHintAttack\":true,\"showedHintLog\":false,\"showedHintZone\":true,\"showedHintUseMagnet\":true,\"showedHintUseSMagnet\":true,\"showedHintUseShield\":true,\"showedHintUseIShield\":true,\"showedHintUseTrap\":true,\"showedHintUseHatched\":true,\"showedHintUseVampire\":false,\"showedHintUseIMP\":false,\"showedHintUseMop\":false,\"level\":10,\"status\":\"finish\",\"slot\":\"1\",\"reputation\":0,\"firstBite\":true,\"secondBite\":true,\"gameTime\":9375,\"impGiven\":true},\"slot2\":{\"year\":\"2021\",\"month\":\"Mar\",\"day\":\"26\",\"hour\":\"18\",\"min\":\"31\",\"charId\":11,\"players\":[{\"type\":\"comp\",\"aiType\":\"balanced\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":16,\"powerUsed\":0,\"currentCell\":763,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":4,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":940,\"bonusMoney\":0,\"magnets\":1,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":2,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"A\",\"model\":\"brown\",\"place\":1,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 A\"},{\"type\":\"comp\",\"aiType\":\"risky\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":1,\"moves\":14,\"powerUsed\":0,\"currentCell\":543,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":3,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":1000,\"bonusMoney\":0,\"magnets\":1,\"smagnets\":0,\"shields\":1,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"B\",\"model\":\"blue\",\"place\":2,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 B\"},{\"type\":\"comp\",\"aiType\":\"careful\",\"power\":10000,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":14,\"powerUsed\":0,\"currentCell\":542,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":4,\"dream\":\"brown\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"sup\",\"capital\":3560,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":1,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"C\",\"model\":\"blue\",\"place\":3,\"label\":\"u0421u0443u043fu0435u0440-u0444u0438u0448u043au0430 C\"},{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":5,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":15,\"powerUsed\":0,\"currentCell\":550,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":4880,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":true,\"name\":[],\"letter\":\"D\",\"model\":\"black\",\"place\":4,\"label\":\"Robo DJ\"}],\"gameSpeed\":1,\"labelsOn\":true,\"skipTutorial\":true,\"unlockMagnet\":true,\"unlockSMagnet\":true,\"unlockShield\":true,\"unlockIShield\":true,\"unlockTrap\":true,\"unlockVampire\":true,\"unlockImp\":true,\"unlockMop\":false,\"unlockManipulator\":true,\"conditionsCount\":18,\"knowBranch\":true,\"knowOrange\":true,\"knowBlack\":true,\"knowArrowBlue\":true,\"knowBonus\":true,\"knowStarOr\":true,\"knowStarRed\":true,\"knowMoneybag\":true,\"knowSpeed\":true,\"knowDeadend\":true,\"knowHatched\":true,\"knowAction\":false,\"knowJoker\":true,\"knowBone\":true,\"showedHintLegend\":true,\"showedHintRed\":true,\"showedHintAttack\":true,\"showedHintLog\":false,\"showedHintZone\":true,\"showedHintUseMagnet\":true,\"showedHintUseSMagnet\":true,\"showedHintUseShield\":true,\"showedHintUseIShield\":true,\"showedHintUseTrap\":true,\"showedHintUseHatched\":true,\"showedHintUseVampire\":true,\"showedHintUseIMP\":true,\"showedHintUseMop\":false,\"level\":14,\"status\":\"over\",\"slot\":2,\"reputation\":2,\"firstBite\":false,\"secondBite\":false,\"gameTime\":11587,\"winner\":{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":5,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":15,\"powerUsed\":0,\"currentCell\":550,\"protection\":false,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":4880,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":1,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":true,\"name\":[],\"letter\":\"D\",\"model\":\"black\",\"place\":4,\"label\":\"Robo DJ\"},\"impGiven\":true}},\"trophy\":{\"slot1\":{\"year\":\"2021\",\"month\":\"Mar\",\"day\":\"27\",\"hour\":\"17\",\"min\":\"34\",\"charId\":15,\"players\":[{\"type\":\"comp\",\"aiType\":\"balanced\",\"power\":0,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":0,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"A\",\"model\":\"white\",\"place\":1,\"label\":\"u0416u0430u0440u043eu0432u043du044f\"},{\"type\":\"comp\",\"aiType\":\"risky\",\"power\":0,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":0,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"B\",\"model\":\"white\",\"place\":2,\"label\":\"u0422u0438u043cu043eu043d\"},{\"type\":\"comp\",\"aiType\":\"careful\",\"power\":0,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":0,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"C\",\"model\":\"white\",\"place\":3,\"label\":\"u0411u0443u0440u0430u0442u0438u043d\"},{\"type\":\"human\",\"aiType\":\"balanced\",\"power\":0,\"bonusMoves\":0,\"skipMoves\":0,\"moves\":0,\"powerUsed\":0,\"currentCell\":0,\"protection\":true,\"armor\":0,\"iron\":false,\"circle\":0,\"finished\":false,\"shiftPos\":1,\"fore\":false,\"buyCount\":0,\"dream\":\"none\",\"speed\":-1,\"catchUp\":false,\"reverse\":false,\"nextCond\":\"none\",\"entity\":\"none\",\"capital\":0,\"bonusMoney\":0,\"magnets\":0,\"smagnets\":0,\"shields\":0,\"ishields\":0,\"trap\":false,\"vampire\":false,\"mop\":false,\"mopCheck\":false,\"imp\":0,\"impUsed\":false,\"manipulator\":false,\"name\":[],\"letter\":\"D\",\"model\":\"white\",\"place\":4,\"label\":\"svwgvs\"}],\"gameSpeed\":1.4,\"labelsOn\":true,\"skipTutorial\":false,\"unlockMagnet\":false,\"unlockSMagnet\":false,\"unlockShield\":false,\"unlockIShield\":false,\"unlockTrap\":false,\"unlockVampire\":false,\"unlockImp\":false,\"unlockMop\":false,\"unlockManipulator\":false,\"conditionsCount\":5,\"knowBranch\":false,\"knowOrange\":false,\"knowBlack\":false,\"knowArrowBlue\":false,\"knowBonus\":false,\"knowStarOr\":false,\"knowStarRed\":false,\"knowMoneybag\":false,\"knowSpeed\":false,\"knowDeadend\":false,\"knowHatched\":false,\"knowAction\":false,\"knowJoker\":false,\"knowBone\":false,\"showedHintLegend\":false,\"showedHintRed\":false,\"showedHintAttack\":false,\"showedHintLog\":false,\"showedHintZone\":false,\"showedHintUseMagnet\":false,\"showedHintUseSMagnet\":false,\"showedHintUseShield\":false,\"showedHintUseIShield\":false,\"showedHintUseTrap\":false,\"showedHintUseHatched\":false,\"showedHintUseVampire\":false,\"showedHintUseIMP\":false,\"showedHintUseMop\":false,\"level\":0,\"status\":\"start\",\"slot\":1,\"reputation\":0,\"firstBite\":true,\"secondBite\":true,\"gameTime\":0}}}');

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

--
-- Дамп данных таблицы `stat`
--

INSERT INTO `stat` (`id`, `user_id`, `moves`, `finish_first`, `items_bought`, `power_used`, `races`, `money`, `money_shop`) VALUES
(5, 9, 681, 24, 66, 37, 44, 42400, 16030),
(6, 10, 3, 3, 4, 0, 3, 700, 1050),
(7, 11, 0, 0, 0, 0, 0, 0, 0),
(8, 12, 0, 0, 0, 0, 0, 0, 0),
(9, 13, 0, 0, 0, 0, 0, 0, 0),
(10, 14, 0, 0, 0, 0, 0, 0, 0),
(11, 15, 0, 0, 0, 0, 0, 0, 0),
(12, 16, 0, 0, 0, 0, 0, 0, 0),
(13, 17, 0, 0, 0, 0, 0, 0, 0),
(14, 18, 0, 0, 0, 0, 0, 0, 0);

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
(1, 'Начало пути', 'Завершите 1 трассу', 1, 0, 1, 1),
(2, 'Вторая пройдена', 'Завершите 2 трассу', 1, 0, 1, 1),
(3, 'Цвет настроения - оранжевый', 'Завершите 3 трассу', 1, 0, 1, 1),
(4, 'Преодоление трудностей', 'Завершите 4 трассу', 1, 0, 1, 1),
(5, 'К финалу готов', 'Завершите 5 трассу', 1, 0, 1, 1),
(6, 'Повелитель швабры', 'Получите швабру', 2, 1, 1, 1),
(7, 'Ложный финал', 'Завершите основную часть имперского чемпионата', 1, 1, 1, 1),
(8, 'В гору', 'Завершите 7 трассу', 1, 0, 1, 1),
(9, 'Восьмая пройдена', 'Завершите 8 трассу', 1, 0, 1, 1),
(10, 'Взбитые сливки', 'Завершите 9 трассу', 1, 0, 1, 1),
(11, 'На вершине вулкана', 'Завершите 10 трассу', 1, 0, 1, 1),
(12, 'Чемпион!', 'Выиграйте имперский чемпионат', 3, 0, 1, 1),
(13, 'Мы больше не друзья', 'Откажитесь от предложения императора в конце чемпионата', 1, 1, 1, 1),
(14, 'Инвестор', 'Примите предложение императора в конце чемпионата', 1, 1, 1, NULL),
(15, 'Можно выдохнуть', 'Завершите имперский чемпионат', 2, 0, 1, 1),
(16, 'Череп и кости', 'Завершите 12 трассу', 1, 1, 1, 1),
(17, 'Выживший', 'Завершите 13 трассу', 1, 1, 1, 1),
(18, 'Прощайте, черепушки!', 'Завершите 14 трассу', 1, 1, 1, 1),
(19, 'Я спасу тебя!', 'Дойдите до пленницы на трассе 15', 2, 1, 1, NULL),
(20, 'Чудесное спасение', 'Дойдите живым до выхода на трассе 15', 2, 1, 1, NULL),
(21, 'Герой Империи', 'Спасите пленницу и получите звание Героя Империи', 3, 1, 1, NULL),
(22, 'Твоя фишка', 'Купите свою первую фишку', 1, 0, 1, 1),
(23, 'Увеличиваем шансы', 'Купите свой первый предмет', 1, 0, 1, 1),
(24, 'Элитный прыгун', 'Купите элитную фишку', 1, 0, 1, 1),
(25, 'Они мне все нравятся', 'Купите хотя бы 1 раз каждый предмет в магазине', 1, 0, 7, 1),
(26, 'Максимальная скорость', 'Переместитесь на максимальное число клеток за 1 ход', 1, 0, 1, NULL),
(27, 'Хищник', 'Три раза поймайте соперника в капкан', 1, 0, 3, 0),
(28, 'Кусь!', 'Три раза укусите соперника вампирскими клыками', 1, 0, 3, 0),
(29, 'Сила есть, и ум тоже', 'Три раза выкиньте соперника с трассы', 1, 0, 3, 1),
(30, 'Боец', 'Потратьте на борьбе с соперниками 10 единиц силы', 1, 0, 10, 1),
(31, 'Воин', 'Потратьте на борьбе с соперниками 50 единиц силы', 2, 0, 50, 0),
(32, 'Магнетизм', 'Финишируйте с помощью магнита', 1, 0, 1, 1),
(33, 'Это невозможно!', 'Получите невозможный кубик', 2, 1, 1, 1),
(34, 'Секретное оружие', 'Воспользуйтесь всеми секретными предметами в игре', 2, 0, 2, 1),
(35, 'Оправданный риск', 'Финишируйте на 5-й трассе через опасное первое ответвление', 1, 0, 1, NULL),
(36, 'Мастер щита', 'Соберите с помощью щита 500 $', 1, 0, 500, 1),
(37, 'Накопил на старость', 'Соберите с копилки 1000 $', 1, 0, 1000, 1),
(38, 'Сладкий вкус победы', 'Займите 1 место на любой трассе', 1, 0, 1, 1),
(39, 'Победа стала слаще', 'Займите 1 место на любой трассе 5 раз', 2, 0, 5, 1),
(40, 'Победитель по жизни', 'Займите 1 место на любой трассе 15 раз', 3, 0, 15, 0),
(41, 'Манипулятор', 'Заставьте соперника встать на зелёную клетку', 1, 0, 1, 1),
(42, 'Тупой, ещё тупее', 'Завершите имперский чемпионат с тремя тупыми соперниками', 1, 0, 1, 1),
(43, 'Спасибо за преданность!', 'Сыграйте в «Прыгунов» три раза', 3, 0, 3, 1),
(44, 'Допрыгался', 'Выбейте все достижения в «Прыгунах»', 4, 0, 43, 0),
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
  `email` varchar(64) NOT NULL,
  `hash` varchar(64) NOT NULL,
  `email_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `online` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `pass`, `email`, `hash`, `email_confirmed`, `online`) VALUES
(9, 'Олежек', 'f60dff6a736254a2525fd668d3b1dffc', '', '', 0, 0),
(10, 'trophy', 'f60dff6a736254a2525fd668d3b1dffc', '', '', 0, 0),
(11, 'qqqq', 'f60dff6a736254a2525fd668d3b1dffc', '', '', 0, 0),
(12, 'eeeeee', 'f60dff6a736254a2525fd668d3b1dffc', '', '', 0, 0),
(13, 'ttttt', 'f60dff6a736254a2525fd668d3b1dffc', '', '', 0, 0),
(14, 'qqqqy', 'f60dff6a736254a2525fd668d3b1dffc', '', '', 0, 0),
(15, 'asasa', 'e404e5feb71f60746972aa011f08e837', '', '5b854b89a086acc98e053ac8a0d609a9', 0, 0),
(16, 'htjtj', 'eb8d5ea88700db6754051a4efcf87329', 'reaktor868@yandex.ru', '3717272344a670400692ee54747104ed', 0, 0),
(17, 'qqqqqwf', 'eb8d5ea88700db6754051a4efcf87329', 'reaktor86@yandex.ru', '33d2fca999270e8e9574478b362fbdb0', 0, 0),
(18, 'saffa', 'f60dff6a736254a2525fd668d3b1dffc', 'reaktor8686@yandex.ru', '762139e22848ca4060bf52cecc77e7b5', 0, 1);

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
-- Дамп данных таблицы `user_trophies`
--

INSERT INTO `user_trophies` (`id`, `user_id`, `trophy_id`, `progress`, `achieved`, `date`) VALUES
(1, 9, 31, 43, 0, ''),
(2, 9, 30, 30, 1, '2021 Mar 28 18:59:23'),
(3, 9, 1, 3, 1, '2021 Mar 28 18:59:23'),
(4, 9, 44, 33, 0, ''),
(5, 9, 2, 3, 1, '2021 Mar 28 18:59:23'),
(6, 9, 3, 3, 1, '2021 Mar 28 18:59:23'),
(7, 9, 38, 9, 1, '2021 Mar 28 18:59:23'),
(8, 9, 39, 9, 1, '2021 Mar 28 18:59:23'),
(9, 9, 40, 14, 0, ''),
(10, 9, 22, 5, 1, '2021 Mar 28 19:18:22'),
(11, 9, 4, 2, 1, '2021 Mar 26 09:39:16'),
(12, 9, 45, 12, 1, '2021 Mar 28 18:59:23'),
(13, 9, 23, 38, 1, '2021 Mar 28 18:59:23'),
(14, 9, 25, 7, 1, '2021 Mar 28 19:18:22'),
(15, 9, 47, 6, 1, '2021 Mar 26 17:29:57'),
(16, 9, 36, 500, 1, '2021 Mar 29 17:45:00'),
(17, 9, 5, 2, 1, '2021 Mar 26 09:48:19'),
(18, 9, 32, 5, 1, '2021 Mar 26 18:07:38'),
(19, 9, 7, 2, 1, '2021 Mar 26 16:32:33'),
(20, 9, 6, 1, 1, '2021 Mar 25 09:04'),
(21, 9, 46, 8, 1, '2021 Mar 26 17:58:54'),
(22, 9, 49, 6, 1, '2021 Mar 26 17:58:59'),
(23, 9, 8, 2, 1, '2021 Mar 26 16:49:00'),
(24, 9, 24, 1, 1, '2021 Mar 25 09:24'),
(25, 9, 33, 1, 1, '2021 Mar 25 09:25'),
(26, 9, 27, 2, 0, ''),
(27, 9, 9, 2, 1, '2021 Mar 26 17:03:49'),
(28, 9, 50, 2, 1, '2021 Mar 26 17:59:02'),
(29, 9, 53, 1, 1, '2021 Mar 25 09:54'),
(30, 9, 34, 2, 1, '2021 Mar 28 19:18:22'),
(31, 9, 10, 2, 1, '2021 Mar 26 17:20:45'),
(32, 9, 48, 3, 1, '2021 Mar 26 17:58:47'),
(33, 9, 37, 1050, 1, '2021 Mar 26 17:52:01'),
(34, 9, 29, 3, 1, '2021 Mar 29 17:26:27'),
(35, 9, 28, 2, 0, ''),
(36, 9, 11, 2, 1, '2021 Mar 26 17:29:15'),
(37, 9, 15, 2, 1, '2021 Mar 26 17:54:13'),
(38, 9, 13, 1, 1, '2021 Mar 25 10:28'),
(39, 9, 43, 3, 1, '2021 Mar 29 17:36:37'),
(40, 9, 12, 2, 1, '2021 Mar 27 08:53:21'),
(41, 9, 51, 1, 1, '2021 Mar 26 17:58:30'),
(42, 9, 16, 1, 1, '2021 Mar 26 18:07:39'),
(43, 9, 52, 3, 1, '2021 Mar 26 18:27:09'),
(44, 9, 17, 1, 1, '2021 Mar 26 18:11:23'),
(45, 9, 18, 1, 1, '2021 Mar 26 18:19:42'),
(75, 9, 42, 1, 1, '2021 Mar 29 17:07:37'),
(76, 9, 41, 1, 1, '2021 Mar 29 17:47:46');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `cups`
--
ALTER TABLE `cups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `saved_games`
--
ALTER TABLE `saved_games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `stat`
--
ALTER TABLE `stat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `trophies`
--
ALTER TABLE `trophies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `user_trophies`
--
ALTER TABLE `user_trophies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

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
