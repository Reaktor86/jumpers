<?php


namespace Jumpers;


class Users
{
    protected $login = '';

    public function __construct($login)
    {
        $this->login = $login;
    }

    public function getUserId()
        // узнать id юзера в таблице users, зная логин
    {
        $query = "SELECT * FROM `users` WHERE login = '{$this->login}';";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        return $result[0]['id'];
    }

    public function setUserOnline()
    {
        $query = "UPDATE `users` SET online = 1 WHERE login = '{$this->login}';";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't set user online");
        } else {
            return 'user online';
        }
    }

    public function setUserOffline()
    {
        $query = "UPDATE `users` SET online = 0 WHERE login = '{$this->login}';";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't set user offline");
        } else {
            return 'user offline';
        }
    }

    // возвращает инф-цию о progress_total из таблицы trophies
    public function getTrophiesPT() {
        $query = "SELECT id, progress_total FROM `trophies` WHERE 1;";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if (!$result) {
            throw new \Exception("can't get progress total info");
        } else {
            return $result;
        }
    }

    /**
     * @return mixed
     * @throws \Exception
     * вернуть данные о профиле юзера
     */

    public function getProfile()
    {
        $query = "SELECT email, email_confirmed, reg_date FROM `users` WHERE login = '{$this->login}';";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if (!$result) {
            throw new \Exception("can't get profile data");
        } else {
            return current($result);
        }
    }

    /**
     * @param string $email
     * @return string
     * @throws \Exception
     * обновить email юзера
     */

    public function updateEmail($email = '')
    {
        $query = "UPDATE `users` SET email = '{$email}', email_confirmed = 0 WHERE login = '{$this->login}';";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't update email");
        } else {
            return 'email updated';
        }
    }

}