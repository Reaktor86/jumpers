<?php
require ('vendor/autoload.php');
$hash = $_GET['hash'];
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="favicon.png">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/recover.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&family=Roboto:wght@100;300;400;700&family=Russo+One&display=swap" rel="stylesheet">
    <title>Прыгуны - восстановление пароля</title>
</head>
<body>
<section class="start-screen">

    <div class="start-screen__jungles jungles">
        <img class="recover__logo" src="img/logo.png">
        <img class="jungles__top" src="site/img/bg-jungles-top.png">
    </div>

    <?php if (!$hash):?>
    <div class="recover__false">
        <p>Ошибка: хэш не получен</p>
        <button class="popup__button">Назад</button>
    </div>
    <?php else: ?>

    <div class="popup popup__center popup__profile">
        <div class="popup__content">
            <div class="popup__head">
                <div class="popup__warn popup__icon-settings"><img src="img/icons/icon-settings.png"></div>
                <h2>Восстановление пароля</h2>
            </div>

            <div class="recover__result">
                <p>result</p>
                <button class="popup__button">ОК</button>
            </div>

            <div class="profile__cont profile__cont--loading">
                <img src="img/loading.gif">
            </div>

            <div class="profile__cont profile__cont--pass" data-hash="<?php echo $hash?>">
                <form>
                    <p class="reg__label">Новый пароль <span class="reg__note">(от 6 символов)</span> <span class="span__red">*</span></p>
                    <input type="password" name="pass-change__new" required>
                    <p class="reg__error reg__error--pass">ошибка</p>
                    <p class="reg__label">Повторите пароль <span class="span__red">*</span></p>
                    <input type="password" name="pass-change__new2" required>
                    <p class="reg__error reg__error--pass2">ошибка</p><br>
                    <div class="popup__button-flex">
                        <button type="button" class="popup__button popup__button--cancel"><img src="img/icons/icon-x-mark.png">Отмена</button>
                        <button type="submit" class="popup__button js-popup-ok">OK</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <?php endif; ?>

</section>
<script src="scripts/recover.js"></script>
</body>
</html>