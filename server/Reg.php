<?php


namespace Jumpers;

use PHPMailer\PHPMailer\PHPMailer;

/**
 * Class Reg
 * @package Jumpers
 */
class Reg
{
    protected $errors = [];
    protected $login = '';
    protected $pass = '';
    protected $pass2 = '';
    protected $email = '';
    protected $hash = '';
    protected $passOld = '';
    protected $siteAddress = 'jumpersgame.ru';
    protected $mailLogin = '';
    protected $mailFull = '';
    protected $mailPass = '';
    protected $captcha = '';
    protected $stopNames = [
        'admin',
        'name',
        'test',
        'имя',
        'логин',
        'админ',
        'login',
        'http',
        'www',
        '.ru',
        '.com',
        '.рф',
    ];

    public function __construct($login, $pass, $pass2, $email = '', $passOld = '', $captcha = '')
    {
        $this->login = trim(filter_var($login, FILTER_SANITIZE_STRING));
        $this->pass = trim(filter_var($pass, FILTER_SANITIZE_STRING));
        $this->pass2 = trim(filter_var($pass2, FILTER_SANITIZE_STRING));
        $this->email = $email;
        $this->passOld = $passOld;
        $this->hash = md5($this->login . time());
        $objMail = new SetMail();
        $objMail = $objMail->getMailParams();
        $this->mailLogin = $objMail['mailLogin'];
        $this->mailPass = $objMail['mailPass'];
        $this->mailFull = $objMail['mailFull'];
        $this->captcha = $captcha;
    }

    public function checkInputs($changePass = false)
        // проверить поля при регистрации
    {
        if (mb_strlen($this->pass) < 6) {
            $this->errors['errorPass'] = 'пароль не менее 6 символов';
        }
        if ($this->pass != $this->pass2) {
            $this->errors['errorPass2'] = 'пароли не совпадают';
        }
        if ($changePass) {
            if ($this->pass === $this->passOld) {
                $this->errors['errorOldPass'] = 'старый и новый пароли совпадают';
            } else {
                if(!$this->checkOldPass()) {
                    $this->errors['errorOldPass'] = 'неверный пароль';
                }
            }
        } else {
            foreach ($this->stopNames as $item) {
                if (strripos($this->login, $item) !== false) {
                    $this->errors['errorLogin'] = 'недопустимое имя';
                }
            }
            if (mb_strlen($this->login) < 2 || mb_strlen($this->login) > 20) {
                $this->errors['errorLogin'] = 'логин не менее 2, не более 20 символов';
            }
            if ($this->checkUserExist($this->login)) {
                $this->errors['errorLogin'] = 'такой пользователь уже существует';
            }
            if ($this->email !== '' && $this->checkEmailExist($this->email)) {
                $this->errors['errorEmail'] = 'email занят';
            }
            if ($this->captcha == 0) {
                $this->errors['errorCap'] = 'неверная капча';
            } else if ($this->captcha != 1) {
                $this->errors['errorCap'] = 'данные капчи не получены';
            }
        }
        if (!empty($this->errors)) {
            return $this->errors;
        } else {
            return 'проверка инпутов прошла успешно';
        }
    }

    public function checkUserExist($userLogin): bool
        //проверка существования юзера
    {
        $query = "SELECT * FROM `users` WHERE login = '{$userLogin}';";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    public function checkOldPass(): bool
        //проверка старого пароля при его смене
    {
        $pass = md5($this->passOld . 'Tgh5aQpo990f');
        $query = "SELECT * FROM `users` WHERE login = '{$this->login}' AND pass = '{$pass}';";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    public static function checkEmailExist($email): bool
        //проверка существования е-мейла
    {
        $query = "SELECT * FROM `users` WHERE email = '{$email}';";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    public function createUser(): string
        // создать нового юзера
    {
        $encryptedPass = md5($this->pass . 'Tgh5aQpo990f');
        $date = date('Y M d H:i');
        $query = "INSERT INTO `users` (`login`, `pass`, `online`, `email`, `hash`, `email_confirmed`, `reg_date`, `lastMailSend`) 
VALUES ('{$this->login}', '$encryptedPass', 0, '{$this->email}', '{$this->hash}', 0, '{$date}', 0);";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't create a new user");
        } else {
            return $this->login;
        }
    }

    /**
     * @param bool $needTimeCheck
     * @return string
     * @throws \PHPMailer\PHPMailer\Exception
     * отправить почту с верификацией
     */

    public function sendEmail($needTimeCheck = false): string
    {
        if ($needTimeCheck) {
            $timeCheck = $this->checkLastMailSend($this->email);
            if ($timeCheck !== 'ok') {
                return $timeCheck;
            }
        }

        $title = 'Подтверждение E-Mail';
        $message = '
                <html>
                <head>
                <title>Подтвердите Email</title>
                </head>
                <body>
                <p>Спасибо за регистрацию в "Прыгунах"!</p>
                <p>Ваш логин: <b>' . $this->login . '</b></p>
                <p>Чтобы подтвердить почту, перейдите по <a href="http://' . $this->siteAddress . '/confirm.php?hash=' . $this->hash . '">ссылке</a></p>
                <p>Это сообщение сгенерировано автоматически. Отвечать на него не нужно.</p>
                </body>
                </html>
                ';

        $mail = new PHPMailer();
        $mail->CharSet = 'UTF-8';
        $mail->isSMTP();                   // Отправка через SMTP
        $mail->Host   = 'ssl://smtp.mail.ru';  // Адрес SMTP сервера
        $mail->SMTPAuth   = true;          // Enable SMTP authentication
        $mail->Username   = $this->mailLogin;       // ваше имя пользователя (без домена и @)
        $mail->Password   = $this->mailPass;    // ваш пароль
        $mail->SMTPSecure = 'ssl';         // шифрование ssl
        $mail->Port   = 465;               // порт подключения
        $mail->setFrom($this->mailFull, 'Прыгуны'); // от кого (email и имя)
        $mail->addAddress($this->email); // кому (email и имя)
        $mail->Subject = $title; // тема письма

        $mail->msgHTML($message);

        if ($mail->send()) {
            $result = 'Письмо отправлено!';
            $this->updateLastMailSend($this->email);
        } else {
            $result = 'Ошибка: ' . $mail->ErrorInfo;
        }

        return $result;
    }

    /**
     * @param $hash
     * @return bool
     * подтвердить email - сюда приходим при клике на ссылке в письме
     */

    public static function confirmEmail($hash): bool
    {
        $query = "SELECT * FROM `users` WHERE hash = '{$hash}';";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    public static function setEmailConfirmed($hash): bool
    {
        $query = "UPDATE `users` SET email_confirmed = 1 WHERE hash = '{$hash}';";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't set email confirmed");
        } else {
            return true;
        }
    }

    /**
     * @return bool
     * @throws \Exception
     * обновить хэш почты
     */

    public function updateEmailHash(): bool
    {
        $query = "UPDATE `users` SET hash = '{$this->hash}' WHERE login = '{$this->login}';";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't update email hash");
        } else {
            return true;
        }
    }

    /**
     * @param bool $useHash
     * @param string $hash
     * @return int
     * @throws \Exception изменить пароль
     */

    public function changePass($useHash = false, $hash = ''): int
    {
        if ($useHash) {
            $str = "hash = '{$hash}';";
        } else {
            $str = "login = '{$this->login}';";
        }
        $encryptedPass = md5($this->pass . 'Tgh5aQpo990f');
        $query = "UPDATE `users` SET pass = '{$encryptedPass}' WHERE {$str}";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't change pass");
        } else {
            return 1;
        }
    }

    /**
     * @param $text
     * @return array|false
     * проверить то, что ввел юзер при восстановлении пароля
     * @throws \Exception
     */

    public static function checkUserText($text)
    {
        $query = "SELECT * FROM `users` WHERE email = '{$text}';";
        $testEmail = Db::query($query);
        if (!$testEmail) {
            throw new \Exception("can't check user email (recover)");
        }
        $result = $testEmail->fetch_all(MYSQLI_ASSOC);
        if ($result) {
            return $text;
        } else {
            $query2 = "SELECT * FROM `users` WHERE login = '{$text}';";
            $testLogin = Db::query($query2);
            if (!$testLogin) {
                throw new \Exception("can't check user login (recover)");
            }
            $result2 = $testLogin->fetch_all(MYSQLI_ASSOC);
        }
        if ($result2) {
            $query3 = "SELECT email FROM `users` WHERE login = '{$text}';";
            $getEmail = Db::query($query3);
            if (!$getEmail) {
                throw new \Exception("can't get user email (recover)");
            }
            $result3 = $getEmail->fetch_all(MYSQLI_ASSOC);
            return $result3[0]['email'];
        } else {
            return false;
        }
    }

    /**
     * @param $email
     * @return string
     * @throws \PHPMailer\PHPMailer\Exception
     * отправить письмо с восстановлением пароля
     */

    public function sendRecoverEmail($email): string
    {
        $timeCheck = $this->checkLastMailSend($email);
        if ($timeCheck !== 'ok') {
            return $timeCheck;
        }

        $hash = md5($email . time());
        $query = "UPDATE `users` SET hash = '{$hash}' WHERE email = '{$email}';";
        $test = Db::query($query);
        if (!$test) {
            throw new \Exception("can't update hash (recover)");
        }

        $title = 'Восстановление пароля';
        $message = '
                <html>
                <head>
                <title>Восстановление пароля</title>
                </head>
                <body>
                <p>Получен запрос на восстановление пароля.</p>
                <p>Чтобы изменить пароль, пройдите по данной <a href="http://' . $this->siteAddress . '/recover.php?hash=' . $hash . '">ссылке</a></p>
                </body>
                </html>
                ';

        $mail = new PHPMailer();
        $mail->CharSet = 'UTF-8';
        $mail->isSMTP();                   // Отправка через SMTP
        $mail->Host   = 'ssl://smtp.mail.ru';  // Адрес SMTP сервера
        $mail->SMTPAuth   = true;          // Enable SMTP authentication
        $mail->Username   = $this->mailLogin;       // ваше имя пользователя (без домена и @)
        $mail->Password   = $this->mailPass;    // ваш пароль
        $mail->SMTPSecure = 'ssl';         // шифрование ssl
        $mail->Port   = 465;               // порт подключения
        $mail->setFrom($this->mailFull, 'Прыгуны'); // от кого (email и имя)
        $mail->addAddress($email); // кому (email и имя)
        $mail->Subject = $title; // тема письма
        $mail->msgHTML($message);

        if ($mail->send()) {
            $result = 'Письмо отправлено!';
            $this->updateLastMailSend($email);
        } else {
            $result = 'Ошибка: ' . $mail->ErrorInfo;
        }

        return $result;
    }

    public function checkRecoverHash($hash): bool
    {
        $query = "SELECT * FROM `users` WHERE hash = '{$hash}';";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    public function checkRecoverData($hash)
        //проверка данных, введенных юзером, при восстановлении пароля
    {
        if (mb_strlen($this->pass) < 6) {
            $this->errors['errorPass'] = 'пароль не менее 6 символов';
        }
        if ($this->pass != $this->pass2) {
            $this->errors['errorPass2'] = 'пароли не совпадают';
        }
        if (!$this->checkRecoverHash($hash)) {
            $this->errors['errorHash'] = 'хэш не найден';
        }
        if (!empty($this->errors)) {
            return $this->errors;
        } else {
            return 'проверка инпутов прошла успешно';
        }
    }

    /**
     * @param $hash
     * @return bool
     * @throws \Exception
     * стереть хэш после успешного восстановления пароля
     */

    public function eraseHash($hash): bool
    {
        $newHash = md5(time());
        $query = "UPDATE `users` SET hash = '{$newHash}' WHERE hash = '{$hash}';";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't erase the hash");
        } else {
            return true;
        }
    }

    public function updateLastMailSend($email)
    {
        $time = time();
        $query = "UPDATE `users` SET lastMailSend = '{$time}' WHERE email = '{$email}';";
        $result = Db::query($query);
        if (!$result) {
            throw new \Exception("can't update last mail send");
        }
    }

    public function getLastMailSend($email)
    {
        $query = "SELECT lastMailSend FROM `users` WHERE email = '{$email}';";
        $test = Db::query($query);
        $result = $test->fetch_all(MYSQLI_ASSOC);
        return $result[0]['lastMailSend'];
    }

    public function checkLastMailSend($email)
    {
        $time = time();
        $getTime = $this->getLastMailSend($email);
        if ($time - $getTime > 60) {
            return 'ok';
        } else {
            return $time - $getTime;
        }
    }

}