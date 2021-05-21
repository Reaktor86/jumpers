<?php


namespace Jumpers;


class UserTrophies
{
    protected $userId = '';
    protected $trophyId = '';

    public function __construct($trophyId)
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
        $this->trophyId = $trophyId;
    }

    public function checkTrophyExist($trophyId = 0)
        // проверить, существует ли строчка с этим трофеем
    {
        if ($trophyId == 0) {
            $trophyId = $this->trophyId;
        }
        $query = "SELECT * FROM `user_trophies` WHERE user_id = {$this->userId} AND trophy_id = {$trophyId};";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if ($result) {
            return true;
        }
    }

    public function createNewTrophy($trophyId = 0)
        // создать новую строку с трофеем
    {
        if ($trophyId == 0) {
            $trophyId = $this->trophyId;
        }
        $query = "INSERT INTO `user_trophies` (`user_id`, `trophy_id`, `progress`, `achieved`, `date`) 
            VALUES ({$this->userId}, {$trophyId}, 0, 0, '');";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't create a new trophy row");
        } else {
            return 1;
        }
    }

    public function updateProgress($progress, $id = false)
        // обновить прогресс трофея юзера
    {
        if (!$id) {
            $id = $this->trophyId;
        }
        $query = "UPDATE `user_trophies` SET progress = {$progress} WHERE user_id = {$this->userId} AND trophy_id = {$id};";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't update the trophy progress");
        } else {
            return 1;
        }
    }

    public function checkTrophyProgress($trophyId = 0)
        // проверить, достаточно ли прогресса, чтобы объявить трофей полученным
    {
        if ($trophyId == 0) {
            $trophyId = $this->trophyId;
        }
        $query = "SELECT trophy_id, progress, progress_total
             FROM `user_trophies`
             INNER JOIN `trophies`
             ON user_trophies.trophy_id = trophies.id
             WHERE user_id = {$this->userId} AND trophy_id = {$trophyId};";
        $test = Db::query($query);
        $result = current($test->fetch_all(MYSQLI_ASSOC));
        if ($result['progress'] >= $result['progress_total']) {
            return true;
        } else {
            return false;
        }
    }

    public function checkTrophyAchieve($trophyId = 0)
        // проверить статус трофея (получен/не получен)
    {
        if ($trophyId == 0) {
            $trophyId = $this->trophyId;
        }
        $query = "SELECT * FROM `user_trophies` WHERE user_id = {$this->userId} AND trophy_id = {$trophyId};";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        return current($result)['achieved'];
    }

    public function setTrophyAchieve($trophyId = 0, $date = '')
        // сделать трофей полученным
    {
        if ($trophyId == 0) {
            $trophyId = $this->trophyId;
        }
        $query = "UPDATE `user_trophies` SET achieved = 1, date = '{$date}'
            WHERE user_id = {$this->userId} AND trophy_id = {$trophyId};";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't achieve the trophy");
        } else {
            return 1;
        }
    }

    public function countAchieved($getSub = false)
        // посчитать, сколько трофеев получено у юзера (служебные сроки с 45 считаются через $getSub)
    {
        if (!$getSub) {
            $getSub = 'trophy_id < 44';
        } elseif ($getSub == 'items') {
            $getSub = 'trophy_id >= 45 AND trophy_id <= 51';
        } elseif ($getSub == 'secret') {
            $getSub = 'trophy_id >= 52';
        }
        $query = "SELECT SUM(achieved) AS 'count' FROM `user_trophies` WHERE user_id = {$this->userId} AND {$getSub};";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if (!$result) {
            throw new \Exception("can't get achieved count");
        }
        $result = current($result)['count'];
        if ($result === null) {
            $result = 0;
        }
        return $result;
    }

    public function getTrophyParams()
        // вернуть параметры трофея для отображения юзеру: id, trophy_name, cup, date
    {
        $query = "SELECT trophies.id, trophies.name AS trophy_name, cups.name AS cup, date
         FROM `user_trophies`
         INNER JOIN `trophies`
         ON trophies.id = user_trophies.trophy_id
         INNER JOIN `cups`
         ON cups.id = trophies.type_id
         WHERE user_id = {$this->userId} AND trophies.id = {$this->trophyId};";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if (!$result) {
            throw new \Exception("can't get trophy params");
        }
        return current($result);
    }

    public function getAllTrophyParams()
        // вернуть параметры всех трофеев для отображения в index.php
    {
        $query = "SELECT trophies.id, trophies.name AS trophy_name, cups.name AS cup, description, hidden, users_achieved
FROM `trophies`
INNER JOIN `cups`
ON cups.id = trophies.type_id
WHERE trophies.id <= 44
ORDER BY trophies.id;";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if (!$result) {
            throw new \Exception("can't get all trophy params");
        }
        return $result;
    }

    public function getAllTrophyProgress()
        // вернуть массив с данными о прогрессе всех трофеев юзера
        // получится массив со значениями типа {trophy_id: "1", progress: "1"}
    {
        $query = "SELECT trophy_id, progress, achieved FROM `user_trophies` WHERE user_id = {$this->userId} ORDER BY trophy_id;";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if (!$result) {
            throw new \Exception("can't get all trophy progress");
        }
        return $result;
    }

    public function getAllUserTrophies()
        // вернуть все трофеи юзера, в т.ч. те, которые он не добыл (1-44)
    {
        $query = "SELECT id, name, description, cup, hidden, progress, achieved, date, total, usersAchieved
FROM

(SELECT trophies.id, trophies.name, description, cups.name AS cup, hidden, trophies.progress_total AS total, trophies.users_achieved AS usersAchieved
 FROM `trophies`
 INNER JOIN `cups`
 ON cups.id = trophies.type_id
 WHERE trophies.id <= 44) AS result1

LEFT JOIN 

(SELECT trophy_id, progress, achieved, date
FROM `user_trophies`
 WHERE user_id = {$this->userId}) AS result2
 
ON result1.id = result2.trophy_id
ORDER BY id";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if (!$result) {
            throw new \Exception("can't get trophy user params");
        }
        return $result;
    }

    public function updateUsersAchieved()
        // обновить колонку users_achieved у всех достижений до 44 вкл.
    {
        $query = "UPDATE trophies
   SET users_achieved = 
(SELECT newCount FROM
(SELECT trophies.id, trophies.users_achieved FROM trophies WHERE trophies.id <= 44) AS result1
INNER JOIN 
(SELECT user_trophies.trophy_id, SUM(user_trophies.achieved) AS newCount
FROM user_trophies
GROUP BY trophy_id) AS result2
ON result1.id = result2.trophy_id
WHERE result1.id = trophies.id AND trophies.id <= 44);";
        $test = Db::query($query);
        if (!$test) {
            throw new \Exception("can't get trophies achieve percent");
        } else {
            return 'кол-во выбиваний в таблице trophies обновлены';
        }
    }
}