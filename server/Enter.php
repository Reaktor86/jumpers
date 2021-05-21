<?php


namespace Jumpers;


class Enter
{
    protected $login = '';
    protected $pass = '';

    public function __construct($login, $pass)
    {
        $this->login = trim(filter_var($login, FILTER_SANITIZE_STRING));
        $cleanedPass = trim(filter_var($pass, FILTER_SANITIZE_STRING));
        $this->pass = md5($cleanedPass . 'Tgh5aQpo990f'); // !!!соль должна быть такой же, как в Reg.php!!!
    }

    public function getUserMatch()
        // проверка логина и пароля у юзера
    {
        $query = "SELECT * FROM `users` WHERE login = '{$this->login}' AND pass = '{$this->pass}';";
        $test = Db::query($query);
        if (!$test) {
            throw new \Exception("can't get user match");
        }
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if ($result) {
            return $this->login;
        } else {
            return false;
        }
    }
}