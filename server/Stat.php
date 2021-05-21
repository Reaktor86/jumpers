<?php


namespace Jumpers;


class Stat
{
    protected $userId = '';

    public function __construct()
    {
        if (isset($_COOKIE['logged'])) {
            $login = $_COOKIE['logged'];
        } else {
            $login = false;
        }

        if ($login) {
            $objUsers = new \Jumpers\Users($login);
            $this->userId = $objUsers->getUserId();
        }
    }

    public function setUserId($id) {
        $this->userId = $id;
    }

    public function checkStatExist()
        // проверить строку статистики на существование
    {
        $query = "SELECT * FROM `stat` WHERE user_id = {$this->userId};";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if ($result) {
            return true;
        }
    }

    public function createStatRow()
        // создать строку статистики для нового юзера
    {
        $query = "INSERT INTO `stat` (`user_id`, `moves`, `finish_first`, `items_bought`, `power_used`, `races`, `money`, `money_shop`) 
            VALUES ({$this->userId}, 0,0,0,0,0,0,0);";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't create a stat row for the new user");
        }
    }

    public function getUserStat()
        // узнать текущую статистику по юзеру
    {
        $query = "SELECT * FROM `stat` WHERE user_id = {$this->userId};";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        $stat = current($result);
        if ($stat['moves'] == null) $stat['moves'] = 0;
        if ($stat['finish_first'] == null) $stat['finish_first'] = 0;
        if ($stat['items_bought'] == null) $stat['items_bought'] = 0;
        if ($stat['power_used'] == null) $stat['power_used'] = 0;
        if ($stat['races'] == null) $stat['races'] = 0;
        if ($stat['money'] == null) $stat['money'] = 0;
        if ($stat['money_shop'] == null) $stat['money_shop'] = 0;
        return $stat;
    }

    public function increaseUserStat($moves, $fin, $items, $pow, $races, $money, $moneyShop)
        // добавить статистику по юзеру
    {
        $stat = $this->getUserStat();
        $query = "UPDATE `stat` SET
             moves = {$stat['moves']} + {$moves},
             finish_first = {$stat['finish_first']} + {$fin},
             items_bought = {$stat['items_bought']} + {$items},
             power_used = {$stat['power_used']} + {$pow},
             races = {$stat['races']} + {$races},
             money = {$stat['money']} + {$money},
             money_shop = {$stat['money_shop']} + {$moneyShop}
             WHERE user_id = {$this->userId};";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't increase user stat");
        }
    }

    public function updateUserStat($statName, $value)
    {
        $query = "UPDATE `stat` SET {$statName} = {$value} WHERE user_id = {$this->userId};";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't update user stat");
        }
    }

    public function getOverallStat()
        // добыть общую статистику для index.php, кроме связанных с трофеями
    {
        /*
         Всего зарегистрировано: users
        Онлайн: online
        Сделано ходов: moves
        Всего заездов: races
        Выиграно заездов: first
        Очков заработано ($): money
        Потрачено в магазине ($): moneyShop
        Куплено предметов: itemsBought
        Сил использовано: powerUsed
         */
        $usersCount = $this->getUsersCount();

        $queryOnline = "SELECT count(*) AS 'online' FROM `users` WHERE online = 1;";
        $testOnline = Db::query($queryOnline);
        $resultOnline = $testOnline->fetch_all(MYSQLI_ASSOC);
        if (!$resultOnline) {
            throw new \Exception("can't get online count");
        }
        $onlineCount = current($resultOnline)['online'];

        $queryStat = "SELECT SUM(moves) AS moves, SUM(finish_first) AS first, SUM(items_bought) AS items, 
       SUM(power_used) AS power, SUM(races) AS races, SUM(money) AS money, 
       SUM(money_shop) AS shop FROM `stat` WHERE 1;";
        $testStat = Db::query($queryStat);
        $resultStat = $testStat->fetch_all(MYSQLI_ASSOC);
        if (!$resultStat) {
            throw new \Exception("can't get overall stat");
        }

        $stat = current($resultStat);
        $stat['users'] = $usersCount;
        $stat['online'] = $onlineCount;
        return $stat;
    }

    public function getUsersCount()
        // вернуть общее число юзеров
    {
        $queryUsers = "SELECT count(*) AS 'count' FROM `users` WHERE 1";
        $testUsers = Db::query($queryUsers);
        $resultUsers = $testUsers->fetch_all(MYSQLI_ASSOC);
        return current($resultUsers)['count'];
    }

}