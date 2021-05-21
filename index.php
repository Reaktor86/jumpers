<?php
require ('vendor/autoload.php');
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Прыгуны - бесплатная однопользовательская игра</title>
    <link rel="icon" href="favicon.png">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/media.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&family=Roboto:wght@100;300;400;700&family=Russo+One&display=swap" rel="stylesheet">
    <meta name="description" content="Бесплатная однопользовательская браузерная игра. Простая и азартная. Кидаешь кубик и ходишь по клеточкам! Рассчитываешь риски, ставишь подножки компьютерным соперникам, чтобы дойти до финиша первым. Для одного игрока.">
    <script src="https://www.google.com/recaptcha/api.js"></script>
</head>
<body>

<header class="header bg-design" id="header">
    <nav class="header__cont">
        <div class="header__button header__button--community">
            <button>Общение</button>
        </div>
        <div class="header__button header__button--gallery">
            <button>Галерея</button>
        </div>
        <div class="header__button header__button--top">
            <button>ТОП игроки</button>
        </div>
        <div class="header__button header__button--stat">
            <button>Статистика</button>
        </div>
        <div class="header__button header__button--about">
            <button>Об авторе</button>
        </div>
    </nav>
</header>

<section class="start-screen">

    <div class="start-screen__jungles jungles">
        <img class="jungles__left" src="site/img/bg-jungles-left.png">
        <img class="jungles__top" src="site/img/bg-jungles-top.png">
        <img class="jungles__right" src="site/img/bg-jungles-right.png">
    </div>

    <div class="start-screen__div">
        <img class="start-screen__logo" src="img/logo.png">
        <img class="start-screen__d" src="site/img/token-d.png">
        <h1>бесплатная однопользовательская игра</h1>
    </div>

    <div class="start-screen__enter enter">
        <img class="enter__cubic" src="site/img/cubic.png">
        <form class="enter__form" data-posing="first">
            <input type="text" name="login" placeholder="логин / email" class="enter__login" required>
            <p class="enter__error">неверный логин или пароль</p>
            <input type="password" name="pass" placeholder="пароль" class="enter__pass" required>
            <div class="enter__check-div">
                <input type="checkbox" name="remember">
                <p>запомнить</p>
                <p class="enter__forgot">забыли пароль?</p>
            </div>
            <button class="enter__button" type="submit">ВОЙТИ</button>
        </form>
        <div class="enter__footer">
            <p class="enter__reg" data-posing="first">регистрация</p>
            <div class="enter__socials">
                <!--<a class="enter__vk" href="#"><img src="site/img/social-vk.png"></a>
                <a class="enter__fb" href="#"><img src="site/img/social-fb.png"></a>
                <a class="enter__google" href="#"><img src="site/img/social-google.png"></a>-->
            </div>
        </div>
    </div>

    <div class="start-screen__menu menu">
        <img class="menu__burger" src="site/img/menu.png">
    </div>
    <div class="menu__cont">
        <img class="menu__close" src="site/img/menu_close.svg">
        <p class="menu__option menu__option--community">Сообщество</p>
        <hr>
        <p class="menu__option menu__option--gallery">Галерея</p>
        <hr>
        <p class="menu__option menu__option--about">Об авторе</p>
        <hr>
    </div>

</section>

<section>

    <div class="pres bg-design">

        <h2 class="pres__head">Окунитесь в воспоминания из детства!</h2>
        <p class="pres__des">...в мир тех игр, где Вы просто кидали кубик и ходили по клеточкам.<br>Только в этот раз всё намного веселее.</p>

        <div class="pres__ss-cont">
            <img class="pres__ss pres__ss-1" src="site/img/main_01.jpg">
            <img class="pres__ss pres__ss-2" src="site/img/main_02.jpg">
            <img class="pres__ss pres__ss-3" src="site/img/main_03.jpg">
        </div>

        <h1 class="pres__head pres__head--russo">Ключевые особенности</h1>

        <div class="pres__bullets-cont">
            <div class="pres__bullet">
                <p>Используйте свою интуицию и рассчитывайте риски на лету, чтобы финишировать первым.</p>
            </div>
            <div class="pres__bullet">
                <p>Тормозите соперников, устраивайте им козни с помощью силы и игровых предметов.</p>
            </div>
            <div class="pres__bullet">
                <p>Покупайте новые фишки и предметы, чтобы получить преимущество.</p>
            </div>
        </div>

        <h1 class="pres__head pres__head--russo">Также Вас порадуют</h1>

        <div class="pres__more-cont">
            <p class="pres__more-p1">Ироничный сюжет с атмосферой готического средневековья.<br><br>Два чудаковатых персонажа, которые научат полезным игровым навыкам и скрасят Ваш досуг шутками-прибаутками.</p>
            <img class="pres__speed" src="img/speed.png">
        </div>

        <div class="pres__more-cont">
            <img class="pres__cup" src="img/jumpers-cup.png">
            <p class="pres__more-p2">Полное отсутствие внутриигровых покупок! Никаких лутбоксов или надоедливых школьников из чата – чистый рафинированный олдскул 90-х годов для одного игрока.</p>
        </div>

        <?
        try {
            $ssJpg = \Jumpers\Gallery::getScreenshotsPath('jpg');
        }
        catch (Exception $e) {
            echo json_encode($e->getMessage());
        }
        ?>

        <div class="gallery-mobile" id="galleryMobile">
            <? foreach ($ssJpg as $item) : ?>
            <img class="gallery-mobile__sc" src="<?=$item?>">
            <? endforeach; ?>
        </div>

    </div>

    <div class="gallery" id="gallery">

        <h1>Галерея</h1>

        <!--<p class="debug"><?/*=print_r($ssJpg)*/?></p>-->
        <div class="gallery__cont">
            <img class="gallery__left" src="site/img/slide-white.png">
            <img class="gallery__sc1" src="<?=$ssJpg[count($ssJpg) - 1]?>">
            <div class="gallery__sc1 gallery__black"></div>
            <img class="gallery__sc2" src="<?=$ssJpg[0]?>">
            <img class="gallery__big" src="<?=$ssJpg[0]?>">
            <div class="gallery__sc3 gallery__black"></div>
            <img class="gallery__sc3 js-gallery__sc3" src="<?=$ssJpg[1]?>">
            <img class="gallery__right" src="site/img/slide-white.png">
            <div class="gallery__slide gallery__slide-left" data-side="left"></div>
            <div class="gallery__slide gallery__slide-right" data-side="right"></div>
        </div>

    </div>

    <div class="stat bg-design" id="top">

        <h1>ТОП-15 игроков</h1>

        <div class="top-heading">
            <p class="top-heading__place">Место</p>
            <p class="top-heading__username">Пользователь</p>
            <p class="top-heading__character">Имя в игре</p>
            <p class="top-heading__money">Счёт, $</p>
            <p class="top-heading__rep">Репутация</p>
            <p class="top-heading__time"><span class="media-hide">Время </span>в игре</p>
            <p class="top-heading__date">Дата<span class="media-hide"> рекорда</span></p>
        </div>

        <?
        $objRating = new \Jumpers\Character();
        try {
            $arRatings = $objRating->getRatings();
        }
        catch (Exception $e) {
            echo json_encode($e->getMessage());
        }
        $count = 0;
        if (is_array($arRatings) && !empty($arRatings)) {
            $count = count($arRatings);
            if ($count > 15) {
                $count = 15;
            }
        }
        ?>

        <? for ($i = 0; $i < $count; $i++) : ?>
        <div class="top-item">
            <p class="top__place"><?=$i + 1?></p>
            <p class="top__username"><?=$arRatings[$i]['login']?></p>
            <p class="top__character"><?=$arRatings[$i]['name']?></p>
            <p class="top__money"><?=$arRatings[$i]['score']?></p>
            <div class="top__rep-div">
                <? if ($arRatings[$i]['reputation'] > 0) : ?>
                <? for ($k = 0; $k < $arRatings[$i]['reputation']; $k++) : ?>
                <img class="top__rep" src="img/rep.png">
                <? endfor; ?>
                <? else : ?>
                <p>нет</p>
                <? endif; ?>
            </div>
            <p class="top__time"><?=$arRatings[$i]['time']?></p>
            <p class="top__date"><span class="media-hide"><?=$arRatings[$i]['date']?></span></p>
        </div>
        <? endfor; ?>

        <div class="stat__cont-btn" id="stat">
            <button class="stat__btn"><span>Показать статистику</span><img src="site/img/list-arrow.png"></button>
        </div>

        <div class="stat__cont">

            <div class="stat__table">

                <div class="stat-heading">
                    <p class="stat-heading__name">Достижение</p>
                    <p class="stat-heading__des">Описание</p>
                    <p class="stat-heading__proc">% игроков</p>
                </div>

                <div class="stat-scroll">
                    <div class="stat__loading loading-div">
                        <img src="img/loading.gif">
                    </div>
                    <!--<div class="stat-item">
                        <img class="stat__trophy" src="site/img/trophy/trophy-bronze.png">
                        <p class="stat__name">Название трофея</p>
                        <p class="stat__des">Описание трофея</p>
                        <p class="stat__proc">95 %</p>
                    </div>-->
                </div>

            </div>

            <div class="stat__common common">

                <h2 class="common__h2">Общая статистика</h2>

                <div class="common__loading loading-div">
                    <img src="img/loading.gif">
                </div>

                <div class="common__wrap">
                    <p>Всего зарегистрировано: <span class="common__span-total">0</span></p>
                    <p>Онлайн: <span class="common__span-online">0</span></p><br>
                    <p>Закончили чемпионат: <span class="common__span-champOver">0</span></p>
                    <p>Выиграли чемпионат: <span class="common__span-champWon">0</span></p>
                    <p>Дошли до конца: <span class="common__span-ended">0</span></p>
                    <p>Стали героями Империи: <span class="common__span-heroes">0</span></p><br>
                    <p>Сделано ходов: <span class="common__span-moves">0</span></p>
                    <p>Всего заездов: <span class="common__span-races">0</span></p>
                    <p>Выиграно заездов: <span class="common__span-first">0</span></p>
                    <p>Очков заработано ($): <span class="common__span-money">0</span></p>
                    <p>Потрачено в магазине ($): <span class="common__span-moneyShop">0</span></p>
                    <p>Куплено предметов: <span class="common__span-items">0</span></p>
                    <p>Сил использовано: <span class="common__span-power">0</span></p>
                </div>

            </div>

        </div>

        <div class="stat__reg">

            <img src="site/img/emperor-rating.png">
            <div class="stat__enter enter">
                <form class="enter__form" data-posing="second">
                    <input type="text" name="login" placeholder="логин" class="enter__login" required>
                    <p class="enter__error">неверный логин или пароль</p>
                    <input type="password" name="pass" placeholder="пароль" class="enter__pass" required>
                    <div class="enter__check-div">
                        <input type="checkbox" name="remember">
                        <p>запомнить</p>
                        <p class="enter__forgot">забыли пароль?</p>
                    </div>
                    <button class="enter__button" type="submit">ВОЙТИ</button>
                </form>
                <div class="enter__footer">
                    <p class="enter__reg" data-posing="second">регистрация</p>
                    <div class="enter__socials">
                        <!--<a class="enter__vk" href="#"><img src="site/img/social-vk.png"></a>
                        <a class="enter__fb" href="#"><img src="site/img/social-fb.png"></a>
                        <a class="enter__google" href="#"><img src="site/img/social-google.png"></a>-->
                    </div>
                </div>
            </div>

        </div>

    </div>

    <div class="about" id="author">

        <h1>Об авторе</h1>

        <div class="about__cont">

            <div class="about__block about__block--reaktor">
                <img src="site/img/reaktor.jpg">
                <div>
                    <h2>Олег “Reaktor” Верушкин</h2>
                    <p>В прошлом – автор и разработчик сюжетных модов для <b>Half-Life</b> (видеоигра компании Valve). Всего
                        было выпущено 3 больших по продолжительности истории, которые имели успех среди поклонников
                        оригинальной игры.</p>
                </div>
            </div>

            <div class="about__block about__block--prison">
                <div class="about__imgs">
                    <img class="about__img" src="site/img/mods-prison.jpg">
                    <img class="adult" src="site/img/adult.png">
                </div>
                <div>
                    <h2>Half-Life Prison (2007)</h2>
                    <p>Рейтинг на <a href="https://www.moddb.com/mods/half-life-prison" target="_blank">moddb.com</a>: <b>8.1 / 10</b></p>
                </div>
            </div>

            <div class="about__block about__block--trap">
                <div>
                    <h2>The Trap (2011)</h2>
                    <p>Рейтинг на <a href="https://www.moddb.com/mods/the-trap" target="_blank">moddb.com</a>: <b>9.3 / 10</b></p>
                </div>
                <div class="about__imgs">
                    <img class="about__img" src="site/img/mods-thetrap.jpg">
                    <img class="adult" src="site/img/adult.png">
                </div>
            </div>

            <div class="about__block about__block--trap2">
                <div class="about__imgs">
                    <img class="about__img" src="site/img/mods-thetrap2.jpg">
                    <img class="adult" src="site/img/adult.png">
                </div>
                <div>
                    <h2>The Trap 2: Mindlock (2017)</h2>
                    <p>Отзывы в <a href="https://store.steampowered.com/app/638800/The_Trap_2_Mindlock_beta" target="_blank">Steam</a>: <b>“в основном положительные”</b></p>
                </div>
            </div>

            <div class="about__block about__block--jumpers">
                <img src="img/logo.png">
                <p>«Прыгуны» стали первой полноценной игрой Reaktor. Проект сделан с нуля на чистом JavaScript и является его дипломной работой.</p>
            </div>

        </div>

    </div>


</section>

<footer class="bg-design">

    <div class="footer__cont">

        <div class="footer__block">
            <a href="https://vk.com/mindlockstudios" target="_blank">Посетить ВК-блог автора</a>
            <a href="https://vk.com/topic-83053553_46718914" target="_blank">Сообщить о проблеме</a>
            <a href="https://vk.com/topic-83053553_47091141" target="_blank">Задать вопрос</a>
            <a href="https://www.youtube.com/channel/UC8tzDjVpZnJ7-9t01uJhgKg" target="_blank">YouTube-канал</a>
        </div>

        <div class="footer__block">
            <p>&#169; Mindlock Studios</p>
            <p>"Прыгуны"</p>
            <p>Бесплатная однопользовательская<br>браузерная игра</p>
        </div>

    </div>

</footer>

<!--попапы-->

<div class="popup reg">
    <div class="popup__head">
        <div class="popup__warn"><img src="img/icons/icon-check.png"></div>
        <h2>Регистрация нового игрока</h2>
    </div>
    <div class="popup__content">
        <form class="reg__form" method="post">
            <p class="reg__label">Логин <span class="reg__note">(2-20 символов)</span> <span class="span__red">*</span></p>
            <input type="text" class="reg__login" name="login" required>
            <p class="reg__error reg__error--login">ошибка</p>
            <p class="reg__label">Пароль <span class="reg__note">(от 6 символов)</span> <span class="span__red">*</span></p>
            <input type="password" class="reg__pass" name="pass" required>
            <p class="reg__error reg__error--pass">ошибка</p>
            <p class="reg__label">Повторите пароль <span class="span__red">*</span></p>
            <input type="password" class="reg__pass2" name="pass2" required>
            <p class="reg__error reg__error--pass2">ошибка</p>
            <p class="reg__label">E-mail <span class="reg__note">(нужен для восстановления пароля)</span></p>
            <input type="email" class="reg__email" name="email">
            <p class="reg__error reg__error--email">ошибка</p>

            <div class="g-recaptcha" data-sitekey="6LdXqqgaAAAAALwj_RB-25pqraDyszrWcbJRGy6s"></div>
            <p class="reg__error reg__error--cap">ошибка</p>

            <p class="reg__note">* обязательное поле</p>
            <div class="popup__button-flex">
                <button type="button" class="popup__button popup__button--cancel reg__cancel"><img src="img/icons/icon-x-mark.png">Отмена</button>
                <button type="submit" class="popup__button">регистрация</button>
            </div>
        </form>

    </div>
</div>

<div class="popup recover">
    <div class="popup__head">
        <div class="popup__warn"><img src="img/icons/icon-warn.png"></div>
        <h2>Восстановление пароля</h2>
    </div>
    <div class="popup__content">
        <form class="recover__form" method="post">
            <p class="reg__label">Введите E-Mail или логин, указанный при регистрации</p>
            <input type="text" name="recover__email" required>
            <p class="reg__error recover__message">результат</p>
            <p class="reg__note">На электронную почту будет отправлено письмо со ссылкой на страницу изменения пароля.</p>

            <div class="popup__button-flex">
                <button type="button" class="popup__button popup__button--cancel recover__cancel"><img src="img/icons/icon-x-mark.png">Закрыть</button>
                <button type="submit" class="popup__button">Готово</button>
            </div>
        </form>

    </div>
</div>

<div class="popup popup__cookies">
    <div class="popup__head">
        <div class="popup__warn"><img src="img/icons/icon-warn.png"></div>
        <h2>Политика применения Cookie</h2>
    </div>
    <div class="popup__content">
        <p>Игра «Прыгуны» использует файлы Cookie с целью персонализации сервисов и повышения удобства пользования веб-сайтом <b>jumpersgame.ru</b> (далее – Сайт). Cookie представляют собой небольшие файлы, содержащие информацию о предыдущих посещениях Сайта.</p>
        <p>Cookie-файлы позволяют, например, сохранить единожды выполненные текстовые вводы в полях формуляров Сайта, благодаря чему их не требуется вводить заново при следующем посещении Сайта или при переходе между отдельными функциями Сайта. Продолжая использовать Сайт и нажимая на кнопку «Согласен», вы даете согласие на обработку файлов Cookie. Указанная информация обрабатывается в целях функционирования настоящего сайта и идентификации пользователя.</p>
        <p>Если вы не согласны на использование файлов Cookie, измените настройки своего браузера или покиньте сайт, если вы не согласны с настоящими условиями.</p>

        <div class="popup__button-flex">
            <button class="popup__button popup__button--ok">OK</button>
        </div>
    </div>
</div>

<div class="overlay__popup-hard"></div>

<div class="cookie__cont">
    <p>Данный сайт использует cookies для лучшего пользовательского опыта</p>
    <p class="cookie__more">Узнать больше</p>
    <img src="site/img/cookis.svg">
    <button>ХОРОШО</button>
</div>

</body>

<script src="scripts/cookies.js"></script>
<script src="scripts/site.js"></script>

</html>