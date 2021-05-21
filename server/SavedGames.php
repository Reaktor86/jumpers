<?php


namespace Jumpers;


class SavedGames
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

    /**
     * @param $saveData
     * @return string
     * @throws \Exception
     * Создать новую строку
     */
    public function createSaveRow($saveData) {

        $query = "INSERT INTO `saved_games` (`user_id`, `save`) VALUES({$this->userId}, '{$saveData}');";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't create a new saved games row");
        } else {
            return 'создана новая строка';
        }
    }

    /**
     * @param $saveData
     * @return string
     * @throws \Exception
     * Обновить строку
     */
    public function updateSaveRow($saveData) {

        $query = "UPDATE `saved_games` SET save = '{$saveData}' WHERE user_id = {$this->userId};";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't update the saved games row");
        } else {
            return 'save data обновлена';
        }
    }

    /**
     * @return mixed
     * Вернуть сохранение
     */
    public function getSave() {

        $query = "SELECT save FROM `saved_games` WHERE user_id = {$this->userId};";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if (!$result) {
            throw new \Exception("can't get the saved game");
        }
        return current($result)['save'];
    }

    /**
     * @return bool
     * @throws \Exception
     * Проверить строку на существование
     */
    public function checkSaveRowExist() {

        $query = "SELECT save FROM `saved_games` WHERE user_id = {$this->userId};";
        $test = Db::query($query);
        if (!$test) {
            throw new \Exception("can't check saved game row exist");
        }
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }
}