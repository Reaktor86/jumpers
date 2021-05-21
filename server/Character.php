<?php


namespace Jumpers;


/**
 * Class Character
 * @package Jumpers
 */
class Character
{
    /**
     * @var mixed|string
     */
    protected $userId = '';
    /**
     * @var Db|null
     */

    /**
     * Character constructor.
     */
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

    /**
     * создать нового персонажа (новая игра)
     * @param $name
     * @param string $charId
     * @param string $nameA
     * @param string $nameB
     * @param string $nameC
     * @throws \Exception
     */
    public function createCharacter($name, $charId = 'NULL', $nameA = '', $nameB = '', $nameC = '')
    {
        $query = "INSERT INTO `characters` (`id`, `user_id`, `name`, `score`, `map`, `reputation`, `time`, `date`, `name-A`, `name-B`, `name-C`)
        VALUES ({$charId}, {$this->userId}, '{$name}', 0, 1, 0, 0, '', '{$nameA}', '{$nameB}', '{$nameC}');";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't create a new character");
        }
    }

    /**
     * @return mixed
     * @throws \Exception
     */
    public function getLastCharacterId()
        // узнать id последнего созданного персонажа
    {
        $query = "SELECT max(`id`) as 'id' FROM `characters` WHERE user_id = {$this->userId};";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if (!$result) {
            throw new \Exception("can't get the last created character id");
        }
        return $result[0]['id'];
    }

    /**
     * @param $charId
     * @param $score
     * @param $map
     * @param $reputation
     * @param $time
     * @param $date
     * @throws \Exception
     */
    public function updateRatingRow($charId, $score, $map, $reputation, $time, $date)
        // обновить статистику персонажа по завершению его истории
    {
        $query = "UPDATE `characters` SET score = {$score}, map = {$map}, reputation = {$reputation}, 
                        time = '{$time}', date = '{$date}' WHERE id = {$charId};";
        var_dump($query);
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't update a new rating row");
        }
    }

    /**
     * @param $charId
     * @return bool
     * @throws \Exception
     */
    public function checkRatingExist($charId)
        // проверить, заполнена ли строка рейтинга у данного charId
    {
        $query = "SELECT date FROM `characters` WHERE id = {$charId};";
        $test = Db::query($query);
        if (!$test) {
            throw new \Exception("can't check rating exist");
        }
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if ($result[0]['date']) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * @return mixed
     * @throws \Exception
     */
    public function getRatingRows()
        // достать все строки рейтинга юзера
    {
        $query = "SELECT * FROM `characters` WHERE user_id = {$this->userId};";
        $test = Db::query($query);
        if (!$test) {
            throw new \Exception("can't get rating rows");
        }
        $result = $test->fetch_all(MYSQLI_ASSOC);
        return $result;
    }

    /**
     * @return mixed
     * @throws \Exception
     */
    public function getRatings()
        // достать рейтинг по всем персонажам всех юзеров
        // исключить незаполненные строки
        // сортировка 1- по репутации 2- по деньгам 3- по номеру трассы
    {
        $query = "SELECT characters.id, users.login, characters.name, characters.score, 
             characters.map, characters.reputation, characters.time, characters.date
             FROM characters
             INNER JOIN users
             ON characters.user_id = users.id
             WHERE characters.date != ''
             ORDER BY reputation DESC, score DESC, map DESC;";
        $test = Db::query($query);
        if (!$test) {
            throw new \Exception("can't get ratings");
        }
        return $test->fetch_all(MYSQLI_ASSOC);
    }

}