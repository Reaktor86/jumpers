<?php
require ('vendor/autoload.php');
error_reporting(E_ALL);
ini_set("display_errors", 1);
$request = json_decode(file_get_contents('php://input'),1);

if ($request['method'] == 'reg')
    // регистрация нового юзера
{
    try {
        $objReg = new \Jumpers\Reg($request['login'], $request['pass'], $request['pass2'], $request['email'], '', $request['captcha']);
        $check = $objReg->checkInputs(); // проверяем правильность введённых данных
        if (is_array($check) && !empty($check)) {
            echo json_encode($check);
            exit(); // выходим, если у юзера есть ошибки
        }

        $login = $objReg->createUser(); // создаем аккаунт
        if ($request['email'] === '') {
            $sendResult = 'email не указан';
        } else {
            $sendResult = $objReg->sendEmail(); // если указан email, отправляем почту
        }
        $objUsers = new \Jumpers\Users($login);
        $userId = $objUsers->getUserId(); // аккаунт создан. Какой у него id в базе?
        $objStat = new \Jumpers\Stat();
        $objStat->setUserId($userId);
        $objStat->createStatRow();
        $objUsers->setUserOnline();
        setcookie('logged', $login, 0, '/');
        echo json_encode(['login' => $login, 'sendResult' => $sendResult]);
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'exit')
    // выход из игры, разлогин
{
    try {
        $objUsers = new \Jumpers\Users($_COOKIE['logged']);
        $result = $objUsers->setUserOffline();
        setcookie('logged', '', time() - 1, '/');
        echo json_encode($result);
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'enter')
    // вход в игру
{
    try {
        $objEnter = new \Jumpers\Enter($request['login'], $request['pass']);
        $check = $objEnter->getUserMatch(); // возвращает чистый login
        if ($check) {
            $objUsers = new \Jumpers\Users($check);
            $objUsers->setUserOnline();
            if ($request['remember']) {
                setcookie('logged', $check, time() + 3600 * 24 * 7, '/');
            } else {
                setcookie('logged', $check, 0, '/');
            }
            echo json_encode('ok');
        } else {
            echo json_encode('not ok');
        }
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'createChar')
    // создание нового персонажа (новая игра)
{
    try {
        $objChar = new \Jumpers\Character();
        $objChar->createCharacter($request['nameD'], 'NULL', $request['nameA'], $request['nameB'], $request['nameC']);
        echo $objChar->getLastCharacterId();
        // возвращает только что созданный character id
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'addRatingRow')
    // добавление новой строки в личном рейтинге
{
    try {
        $objChar = new \Jumpers\Character();
        $charId = $request['charId'];
        if ($objChar->checkRatingExist($charId)) {
            // если статистика персонажа уже заполнена, то создать новую строку
            $objChar->createCharacter($request['charName']);
            $charId = $objChar->getLastCharacterId();
        }
        $objChar->updateRatingRow($charId, $request['score'],
            $request['map'], $request['reputation'], $request['time'], $request['date']);
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'addManyRatingRows')
    // добавление нескольких новых строк в личном рейтинге
{
    try {
        $objChar = new \Jumpers\Character();
        foreach ($request['base'] as $val) {
            $objChar->createCharacter($val['name'], $request['charId']);
            $objChar->updateRatingRow($request['charId'], $val['money'],
                $val['map'], $val['rep'], $val['time'], $val['date']);
        }
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'getRatingRow')
    // вернуть строки из личного рейтинга
{
    try {
        $objChar = new \Jumpers\Character();
        echo json_encode($objChar->getRatingRows());
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'getRatingCommon')
    // вернуть строки из общего рейтинга
{
    try {
        $objChar = new \Jumpers\Character();
        echo json_encode($objChar->getRatings());
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'sendStat')
    // отправить статистику
{
    try {
        $objStat = new \Jumpers\Stat();
        if (!$objStat->checkStatExist()) {
            $objStat->createStatRow();
        }
        $objStat->increaseUserStat($request['moves'], $request['finish_first'], $request['items_bought'], $request['power_used'], $request['races'], $request['money'], $request['money_shop']);

    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'getStat')
    // получить статистику
{
    try {
        $objStat = new \Jumpers\Stat();
        echo json_encode($objStat->getUserStat());
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'updateStat')
    // обновить статистику
{
    try {
        $objStat = new \Jumpers\Stat();
        if (!$objStat->checkStatExist()) {
            $objStat->createStatRow();
        }
        foreach ($request['base'] as $key => $val) {
            $objStat->updateUserStat($key, $val);
        }
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'goOnline')
    // стать онлайн
{
    try {
        $objUsers = new \Jumpers\Users($_COOKIE['logged']);
        $progressTotal = $objUsers->getTrophiesPT();
        $online = $objUsers->setUserOnline();
        echo json_encode(['progressTotal' => $progressTotal, 'online' => $online]);
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'goOffline')
    // уйти оффлайн
{
    try {
        $objUsers = new \Jumpers\Users($_COOKIE['logged']);
        $obj = new \Jumpers\UserTrophies(0);
        $obj->updateUsersAchieved();
        echo $objUsers->setUserOffline();
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'getLogin')
    // узнать логин текущего юзера
{
    echo $_COOKIE['logged'];
}
elseif ($request['method'] == 'getScreens')
    // получить пути до скриншотов
{
    try {
        $ssPng = \Jumpers\Gallery::getScreenshotsPath('png');
        $ssJpg = \Jumpers\Gallery::getScreenshotsPath('jpg');
        echo json_encode([
            'ssPng' => $ssPng,
            'ssJpg' => $ssJpg,
        ]);
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'getMainStat')
    // получить статистику для отображение под кнопкой "показать статистику" в index.php
{
    try {
        $objStat = new \Jumpers\Stat();
        $overall = $objStat->getOverallStat();
        $objTrophy = new \Jumpers\UserTrophies(0);
        $objTrophy->updateUsersAchieved();
        $arTrophies = $objTrophy->getAllTrophyParams();
        foreach ($arTrophies as &$val) {
            if ($val['cup'] === 'бронза') $val['cup'] = 'bronze';
            if ($val['cup'] === 'серебро') $val['cup'] = 'silver';
            if ($val['cup'] === 'золото') $val['cup'] = 'gold';
            if ($val['cup'] === 'платина') $val['cup'] = 'platinum';
            if (!$val['users_achieved']) {
                $val['users_achieved'] = 0;
                $val['percent'] = 0;
            } else {
                $val['percent'] = round($val['users_achieved'] / $overall['users'] * 100, 1);
            }
        }
        echo json_encode(['arTrophies' => $arTrophies, 'overall' => $overall]);
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'getGameTrophies')
    // получить всю статистику по трофеям для game.html, пункт меню "Трофеи"
{
    try {
        $objStat = new \Jumpers\Stat();
        $count = $objStat->getUsersCount();
        $objTrophies = new \Jumpers\UserTrophies(0);
        $objTrophies->updateUsersAchieved();
        $objTrophies = $objTrophies->getAllUserTrophies();
        $trophyCount = count($objTrophies);
        $trophyAchieved = 0;
        $trophyBronze = 0;
        $trophySilver = 0;
        $trophyGold = 0;
        $trophyPlatinum = 0;
        foreach ($objTrophies as &$val) {
            if ($val['achieved'] == 1) {
                $trophyAchieved++;
                if ($val['cup'] === 'бронза') $trophyBronze++;
                if ($val['cup'] === 'серебро') $trophySilver++;
                if ($val['cup'] === 'золото') $trophyGold++;
                if ($val['cup'] === 'платина') $trophyPlatinum++;
            }
            if ($val['cup'] === 'бронза') $val['cup'] = 'bronze';
            if ($val['cup'] === 'серебро') $val['cup'] = 'silver';
            if ($val['cup'] === 'золото') $val['cup'] = 'gold';
            if ($val['cup'] === 'платина') $val['cup'] = 'platinum';
            $val['usersAchieved'] = round($val['usersAchieved'] / $count * 100, 1);
        }
        echo json_encode([
            'objTrophies' => $objTrophies,
            'trophyAchieved' => $trophyAchieved,
            'trophyBronze' => $trophyBronze,
            'trophySilver' => $trophySilver,
            'trophyGold' => $trophyGold,
            'trophyPlatinum' => $trophyPlatinum,
            'usersCount' => $count,
        ]);
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'updateTrophiesUsersAchieved')
    // обновить колонку users_achieved в таблице trophies
{
    try {
        $objTrophy = new \Jumpers\UserTrophies(0);
        $objTrophy->updateUsersAchieved();
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'setTrophy')
    // бизнес-логика трофеев, срабатывает при активации триггера прогресса в игре
{
    try {
        /*
         Коды возврата:
        100 - ошибка создания новой строки
        101 - ошибка обновления прогресса
        102 - ошибка установки трофея как полученный
        1 - трофей уже получен
        2 - прогресса недостаточно
        при выбивании трофея возвращает его данные
         */

        $objTrophies = new \Jumpers\UserTrophies($request['trophyId']);
        $dateTime = date('Y M d H:i:s');

        if ($objTrophies->checkTrophyExist()) {
            if ($objTrophies->checkTrophyAchieve()) {
                echo 1;
                exit();
            }
        } else {
            $result = $objTrophies->createNewTrophy();
            if ($result != 1) echo 100;
        }
        $result = $objTrophies->updateProgress($request['progress']);
        if ($result != 1) echo 101;

        $check = $objTrophies->checkTrophyProgress();

        // доп. проверка для особых трофеев
        if ($request['trophyId'] == 44) {
            if ($objTrophies->countAchieved() < 43) {
                $check = false;
            } else {
                $check = true;
            }
        } elseif ($request['trophyId'] == 25) {
            if ($objTrophies->countAchieved('items') < 7) {
                $check = false;
            } else {
                $check = true;
            }
        } elseif ($request['trophyId'] == 34) {
            if ($objTrophies->countAchieved('secret') < 2) {
                $check = false;
            } else {
                $check = true;
            }
        }

        if ($check) {
            $result = $objTrophies->setTrophyAchieve(false, $dateTime);
            if ($result == 1) {
                echo json_encode($objTrophies->getTrophyParams());
            } else {
                echo 102;
            }
        } else {
            echo 2;
        }
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'getAllTrophyProgress')
    // достать массив с прогрессом трофеев (синхронизация)
{
    try {
        $obj = new \Jumpers\UserTrophies(1);
        echo json_encode($obj->getAllTrophyProgress());
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'refreshTrophies')
    // обновить данные по прогрессу трофеев (синхронизация)
{
    try {
        $objTrophies = new \Jumpers\UserTrophies(0);
        $dateTime = date('Y M d H:i:s');

        foreach ($request['base'] as $key => $val) {
            $id = substr($key, 2);

            if (!$objTrophies->checkTrophyExist($id)) {
                $objTrophies->createNewTrophy($id);
            }
            $objTrophies->updateProgress($request['base'][$key], $id);

            if ($objTrophies->checkTrophyProgress($id)) {
                $objTrophies->setTrophyAchieve($id, $dateTime);
            }
        }

        // доп. проверка для особых трофеев
        if ($objTrophies->countAchieved() >= 43) {
            $objTrophies->setTrophyAchieve(44, $dateTime);
        }
        if ($objTrophies->countAchieved('items') >= 7) {
            $objTrophies->setTrophyAchieve(25, $dateTime);
        }
        if ($objTrophies->countAchieved('secret') >= 2) {
            $objTrophies->setTrophyAchieve(34, $dateTime);
        }
        echo 'удачное обновление трофеев в БД';

    } catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'backupSavedGames')
    // сохранить слот на сервере
{
    try {
        $save = json_encode($request['save']);
        $obj = new \Jumpers\SavedGames();
        if (!$obj->checkSaveRowExist()) {
            $obj->createSaveRow($save);
            exit();
        }
        echo $obj->updateSaveRow($save);
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'getSavedGames')
    // вернуть json-сохранение
{
    try {
        $obj = new \Jumpers\SavedGames();
        echo $obj->getSave();
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'getProfile')
    // вернуть данные профиля игрока
{
    try {
        $obj = new \Jumpers\Users($request['login']);
        echo json_encode($obj->getProfile());
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'updateEmail')
    // обновить email
{
    try {
        $check = \Jumpers\Reg::checkEmailExist($request['email']);
        if ($check) {
            echo json_encode(['errorEmail' => 'email занят']);
            exit();
        }
        $obj = new \Jumpers\Users($request['login']);
        $updResult = $obj->updateEmail($request['email']);
        $objReg = new \Jumpers\Reg($request['login'], '', '', $request['email']);
        $objReg->updateEmailHash();
        $sendResult = $objReg->sendEmail(true);
        echo json_encode(['updResult' => $updResult, 'sendResult' => $sendResult]);
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'sendEmailAgain')
    // еще раз послать почту с подтверждением регистрации
{
    try {
        $objReg = new \Jumpers\Reg($request['login'], '', '', $request['email']);
        $objReg->updateEmailHash();
        echo json_encode($objReg->sendEmail(true));
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'changePass')
    // изменить пароль
{
    try {
        $objReg = new \Jumpers\Reg($request['login'], $request['passNew'], $request['passNew2'], '', $request['passOld']);
        $check = $objReg->checkInputs(true);
        if (is_array($check) && !empty($check)) {
            echo json_encode($check);
            exit();
        }
        echo json_encode($objReg->changePass());
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'recoverSendEmail')
    // отправить письмо с восстановлением пароля
{
    try {
        $email = \Jumpers\Reg::checkUserText($request['userText']);
        if (!$email) {
            echo json_encode('0');
            exit();
        }
        $obj = new \Jumpers\Reg('', '', '');
        $result = $obj->sendRecoverEmail($email);
        echo json_encode($result);
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
elseif ($request['method'] == 'recoverPass')
    // восстановить пароль
{
    try {
        $hash = $request['hash'];
        $objReg = new \Jumpers\Reg('', $request['pass'], $request['pass2']);
        $check = $objReg->checkRecoverData($hash);
        if (is_array($check) && !empty($check)) {
            echo json_encode($check);
            exit();
        }
        $result = $objReg->changePass(true, $hash);
        if ($result == 1) {
            $objReg->eraseHash($hash);
        }
        echo json_encode($result);
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
/*elseif ($request['method'] == 'test')
    // поле для экспериментов
{
    try {
        //$objTrophy = new \Jumpers\UserTrophies(0);
        //$objTrophy->updateUsersAchieved();
    }
    catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}*/
