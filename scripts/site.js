if (getCookie('logged')) {
    gameEnter();
}

window.onload = function() {
    console.log("автозагрузка с index.php");
    getScreenshotsCollection();
    setTimeout(function (){
        if (!getCookie('cookiesConfirmed')) {
            cookieNote.style.display = 'block';
            setTimeout(function (){
                cookieNote.style.right = '0';
            }, 17);
        }
    }, 4000)
}

let collection;

// МЕНЮ

document.querySelectorAll('.header__button').forEach(function (item) {

    item.addEventListener('mouseover', function () {
        item.style.height = "52px";
        item.querySelector('button').style.height = "52px";
        item.querySelector('button').style.color = "white";
    });

    item.addEventListener('mouseout', function () {
        item.style.height = "40px";
        item.querySelector('button').style.height = "40px";
        item.querySelector('button').style.color = "#6E6E6E";
    });

});

document.querySelector(".header__button--community").addEventListener('click', function () {
    window.open("https://vk.com/topic-83053553_47091141");
});

document.querySelector(".header__button--gallery").addEventListener("click", function () {
    location.href = "#gallery";
});

document.querySelector(".header__button--top").addEventListener("click", function () {
    location.href = "#top";
});

document.querySelector(".header__button--stat").addEventListener("click", function () {
    location.href = "#stat";
    setTimeout(function () {
        showStatistics();
    }, 200)
});

document.querySelector(".header__button--about").addEventListener("click", function () {
    location.href = "#author";
});

// кнопка - показать статистику

let showStat = 0;
let statLoading = document.querySelector(".stat__loading");
let commonLoading = document.querySelector(".common__loading");
let tableStat = document.querySelector('.stat-scroll');
let tableCommon = document.querySelector('.common__wrap');

document.querySelector(".stat__btn").addEventListener("click", function () {
    if (showStat == 0) {
        showStatistics();
    } else {
        showStat = 0;
        document.querySelector(".stat__cont").style.height = "0";
        this.querySelector("span").innerHTML = "Показать статистику";
        this.querySelector("img").style.transform = "rotate(0deg)";
    }
});

function showStatistics() {
    showStat = 1;
    document.querySelector(".stat__cont").style.height = "507px";
    document.querySelector(".stat__btn span").innerHTML = "Скрыть статистику";
    document.querySelector(".stat__btn img").style.transform = "rotate(90deg)";

    if (window.getComputedStyle(statLoading).display === 'none' && window.getComputedStyle(commonLoading).display === 'none') {
        return;
    }

    let body = {
        method: 'getMainStat',
    };

    fetch('handle.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(body)
    }).then((response) => {
        return response.json();
    }).then((data)=>{

        if (data.error) {
            console.log(data.error);
            return;
        }

        statLoading.style.display = 'none';
        commonLoading.style.display = 'none';
        let arTrophies = data.arTrophies;
        let overall = data.overall;
        let champOver = 0;
        let champWon = 0;
        let gameEnd = 0;
        let heroes = 0;

        // рисуем статистику трофеев

        for (let i = 0; i < arTrophies.length; i++) {
            let div = document.createElement("div");
            div.classList.add("stat-item");
            tableStat.append(div);
            let tableDiv = tableStat.querySelector(".stat-item:last-child");

            let elem = document.createElement("img");
            elem.classList.add('stat__trophy');
            elem.setAttribute('src', 'site/img/trophy/trophy-' + arTrophies[i].cup + '.png');
            tableDiv.append(elem);

            elem = document.createElement("p");
            elem.classList.add('stat__name');
            if (arTrophies[i].hidden == 1) {
                elem.innerHTML = 'СКРЫТЫЙ ПРИЗ';
            } else {
                elem.innerHTML = arTrophies[i].trophy_name;
            }
            tableDiv.append(elem);

            elem = document.createElement("p");
            elem.classList.add('stat__des');
            if (arTrophies[i].hidden == 0) {
                elem.innerHTML = arTrophies[i].description;
            }
            tableDiv.append(elem);

            elem = document.createElement("p");
            elem.classList.add('stat__proc');
            elem.innerHTML = arTrophies[i].percent + ' %';
            tableDiv.append(elem);

            if (arTrophies[i].id == 15) champOver = arTrophies[i].users_achieved;
            if (arTrophies[i].id == 12) champWon = arTrophies[i].users_achieved;
            if (arTrophies[i].id == 20) gameEnd = arTrophies[i].users_achieved;
            if (arTrophies[i].id == 21) heroes = arTrophies[i].users_achieved;
        }

        // рисуем общую статистику

        tableCommon.querySelector('.common__span-total').innerHTML = overall.users;
        tableCommon.querySelector('.common__span-online').innerHTML = overall.online;
        tableCommon.querySelector('.common__span-champOver').innerHTML = '' + champOver;
        tableCommon.querySelector('.common__span-champWon').innerHTML = '' + champWon;
        tableCommon.querySelector('.common__span-ended').innerHTML = '' + gameEnd;
        tableCommon.querySelector('.common__span-heroes').innerHTML = '' + heroes;
        tableCommon.querySelector('.common__span-moves').innerHTML = overall.moves;
        tableCommon.querySelector('.common__span-races').innerHTML = overall.races;
        tableCommon.querySelector('.common__span-first').innerHTML = overall.first;
        tableCommon.querySelector('.common__span-money').innerHTML = overall.money;
        tableCommon.querySelector('.common__span-moneyShop').innerHTML = overall.shop;
        tableCommon.querySelector('.common__span-items').innerHTML = overall.items;
        tableCommon.querySelector('.common__span-power').innerHTML = overall.power;
        tableCommon.style.display = 'flex';
    });
}

// попапы

const overlayHard = document.querySelector(".overlay__popup-hard");

function showPopup(main, content, width, height, view) {
    let unitWidth = 'px';
    let unitHeight = 'px';
    if (view) {
        unitWidth = 'vw';
        unitHeight = 'vh';
    }
    overlayHard.style.display = "block";
    main.style.display = "block";
    setTimeout(function () {
        main.style.width = width + unitWidth;
        main.style.height = height + unitHeight;
        setTimeout(function () {
            if (content) content.style.display = "block";
            main.style.transition = "0s";
        }, 400);
    }, 17);
}

function hidePopup(main, content) {
    content.style.display = "none";
    main.style.transition = ".4s";
    main.style.display = "none";
    main.style.width = "1px";
    main.style.height = "1px";
    overlayHard.style.display = "none";
}

// ссылка "регистрация"
let popupReg = document.querySelector(".reg");
let popupRegContent = document.querySelector(".reg .popup__content");

let enterReg = document.querySelectorAll(".enter__reg");
enterReg.forEach(function (item){
    item.addEventListener("click", function (){
        showPopup(popupReg, popupRegContent, 365, 523);
    });
});

// кнопка отмены регистрации

document.querySelector(".reg__cancel").addEventListener("click", function (){
    hidePopup(popupReg, popupRegContent);
    register.querySelector(".reg__login").value = '';
    register.querySelector(".reg__pass").value = '';
    register.querySelector(".reg__pass2").value = '';
    register.querySelector(".reg__email").value = '';
    errorLogin.style.display = 'none';
    errorCap.style.display = 'none';
    errorPass.style.display = 'none';
    errorPass2.style.display = 'none';
    errorEmail.style.display = 'none';
});

// кнопка регистрации нового пользователя

let errorLogin = document.querySelector('.reg__error--login');
let errorPass = document.querySelector('.reg__error--pass');
let errorPass2 = document.querySelector('.reg__error--pass2');
let errorEmail = document.querySelector('.reg__error--email');
let errorCap = document.querySelector('.reg__error--cap');
let register = document.querySelector('.reg__form');
register.addEventListener('submit', function (e) {
    e.preventDefault();

    let captcha = grecaptcha.getResponse();

    fetch('captcha.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify({'g-recaptcha-response': captcha}),
    }).then((capData) => {
        return capData.json();
    }).then((capRes) => {

        let body = {
            method: 'reg',
            login: this.querySelector(".reg__login").value,
            pass: this.querySelector(".reg__pass").value,
            pass2: this.querySelector(".reg__pass2").value,
            email: this.querySelector(".reg__email").value,
            captcha: capRes,
        };

        fetch('handle.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: JSON.stringify(body)
        }).then((response) => {
            return response.json();
        }).then((data) => {

            if (data.error) {
                console.log(data.error);
                return;
            }

            console.log(data.sendResult);

            if (data.errorLogin || data.errorPass || data.errorPass2 || data.errorEmail || data.errorCap) {
                if (data.errorLogin) {
                    errorLogin.innerHTML = data.errorLogin;
                    errorLogin.style.display = 'block';
                }
                if (data.errorPass) {
                    errorPass.innerHTML = data.errorPass;
                    errorPass.style.display = 'block';
                }
                if (data.errorPass2) {
                    errorPass2.innerHTML = data.errorPass2;
                    errorPass2.style.display = 'block';
                }
                if (data.errorEmail) {
                    errorEmail.innerHTML = data.errorEmail;
                    errorEmail.style.display = 'block';
                }
                if (data.errorCap) {
                    errorCap.innerHTML = data.errorCap;
                    errorCap.style.display = 'block';
                }
            } else {
                console.log('вход на сайт');
                gameEnter();
            }
        });
    });
});

// скрыть сообщения об ошибке

document.querySelector('.reg__login').addEventListener('focus', function (){
    errorLogin.style.display = 'none';
    errorCap.style.display = 'none';
});
document.querySelector('.reg__pass').addEventListener('focus', function (){
    errorPass.style.display = 'none';
    errorCap.style.display = 'none';
});
document.querySelector('.reg__pass2').addEventListener('focus', function (){
    errorPass2.style.display = 'none';
    errorCap.style.display = 'none';
});
document.querySelector('.reg__email').addEventListener('focus', function (){
    errorEmail.style.display = 'none';
    errorCap.style.display = 'none';
});

let enterInput = document.querySelectorAll(".enter__form .enter__login, .enter__form .enter__pass");
enterInput.forEach(function (e){
    e.addEventListener('focus', function (){
        let errors = document.querySelectorAll('.enter__error');
        errors.forEach(function (item){
            item.style.visibility = "hidden";
        });
    });
});

// форма входа

document.querySelectorAll(".enter__form").forEach(function (item){
    item.addEventListener('submit', function (e){
        e.preventDefault();
        let posing = this.dataset.posing;
        let formPath = document.querySelector("[data-posing=" + CSS.escape(posing) + "]");
        let body = {
            method: 'enter',
            login: formPath.querySelector("input[name=login]").value,
            pass: formPath.querySelector("input[name=pass]").value,
            remember: formPath.querySelector("input[name=remember]").checked,
        };

        fetch('handle.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: JSON.stringify(body)
        }).then((response) => {
            return response.json();
        }).then((data) => {
            if (data.error) {
                console.log(data.error);
                return;
            }
            if (data === 'ok') {
                gameEnter();
            } else {
                console.log('пользователь не найден');
                item.querySelector('.enter__error').style.visibility = "visible";
            }
        });
    });
});

// забыли пароль?

let recover = document.querySelector('.recover');
let recoverCont = document.querySelector('.recover .popup__content');
let recoverMessage = document.querySelector('.recover__message');
let recoverBtn = document.querySelector('.recover__form button[type=submit]');

document.querySelectorAll('.enter__forgot').forEach(function (item){
    item.addEventListener('click', function (){
        console.log('восстановление пароля');
        recoverMessage.style.display = 'none';
        recoverBtn.style.display = 'block';
        showPopup(recover, recoverCont, 300, 330);
    });
});

document.querySelector('.recover__cancel').addEventListener('click', function (){
    hidePopup(recover, recoverCont);
});

document.querySelector('.recover__form').addEventListener('submit', function (e){
    e.preventDefault();
    recoverBtn.style.display = 'none';

    let body = {
        method: 'recoverSendEmail',
        userText: this.querySelector("input[name=recover__email]").value,
    };

    fetch('handle.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(body)
    }).then((response) => {
        return response.json();
    }).then((data) => {
        if (data.error) {
            console.log(data.error);
            return;
        }
        console.log(data);
        if (data == 0) {
            recoverMessage.style.color = 'red';
            recoverMessage.innerHTML = 'пользователь или email не найдены';
            recoverBtn.style.display = 'block';
        } else if (data === 'Письмо отправлено!') {
            recoverMessage.style.color = 'green';
            recoverMessage.innerHTML = 'письмо отправлено! проверьте почту';
        } else {
            recoverMessage.style.color = 'red';
            recoverMessage.innerHTML = 'неизвестная ошибка';
            recoverBtn.style.display = 'block';
        }
        recoverMessage.style.display = 'block';
    });
});

document.querySelector('.recover__form input[name=recover__email]').addEventListener('focus', function (){
    recoverMessage.style.display = 'none';
});

// галерея

let galleryImg = document.querySelector('.gallery__sc2');
let galleryImg1 = document.querySelector('.gallery__sc1');
let galleryImg3 = document.querySelector('.js-gallery__sc3');
let galleryImgBig = document.querySelector('.gallery__big');
let galleryCont = document.querySelector('.gallery__cont');
galleryImg.addEventListener('click', function (){
    this.style.display = 'none';
    galleryImgBig.style.display = 'block';
    galleryCont.style.height = window.getComputedStyle(galleryImgBig).height;
});
galleryImgBig.addEventListener('click', function (){
    this.style.display = 'none';
    galleryImg.style.display = 'block';
    galleryCont.style.height = window.getComputedStyle(galleryImg).height;
});

function getScreenshotsCollection() {
    let body = {
        method: 'getScreens',
    };

    fetch('handle.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(body)
    }).then((response) => {
        return response.json();
    }).then((data) => {
        if (data.error) {
            console.log(data.error);
            return;
        }
        collection = data;
    });
}

let gallerySliders = document.querySelectorAll('.gallery__slide');
gallerySliders.forEach(function (item) {
    item.addEventListener('click', function () {

        let collectionJpg = collection.ssJpg;
        let side = item.dataset.side;
        let curImgPath = galleryImg.getAttribute('src');
        let curIndex;
        for (let i = 0; i < collectionJpg.length; i++) {
            if (collectionJpg[i] === curImgPath) {
                curIndex = i;
                break;
            }
        }
        //console.log(curIndex);
        let path1;
        let path2;
        let path3;
        if (side === 'right') {
            path1 = collectionJpg[curIndex];
            path2 = collectionJpg[curIndex + 1];
            if (curIndex + 1 >= collectionJpg.length) {
                path2 = collectionJpg[0];
            }
            path3 = collectionJpg[curIndex + 2];
            if (curIndex + 2 >= collectionJpg.length) {
                path3 = collectionJpg[1];
            }
        } else {
            path3 = collectionJpg[curIndex];
            path2 = collectionJpg[curIndex - 1];
            if (curIndex - 1 < 0) {
                path2 = collectionJpg[collectionJpg.length - 1];
            }
            path1 = collectionJpg[curIndex - 2];
            if (curIndex - 2 < 0) {
                path1 = collectionJpg[collectionJpg.length - 2];
            }
        }
        //console.log(path1);
        //console.log(path2);
        //console.log(path3);
        galleryImg1.setAttribute('src', path1);
        galleryImg.setAttribute('src', path2);
        galleryImg3.setAttribute('src', path3);
        galleryImgBig.setAttribute('src', path2);
    });
});

// меню бургер (мобильная версия)

let color1 = '#E9971E';
let color2 = '#FFFFFF';
let menuCommunity = document.querySelector(".menu__option--community");
menuCommunity.addEventListener('click', function () {
    menuCommunity.style.color = color1;
    setTimeout(function (){
        menuCommunity.style.color = color2;
    }, 2000);
    setTimeout(function (){
        window.open("https://vk.com/topic-83053553_47091141");
    },200);
});

let menuGallery = document.querySelector(".menu__option--gallery");
menuGallery.addEventListener("click", function () {
    menuGallery.style.color = color1;
    setTimeout(function (){
        menuGallery.style.color = color2;
    }, 500);
    setTimeout(function (){
        location.href = "#galleryMobile";
    },200);
});

let menuAbout = document.querySelector(".menu__option--about");
menuAbout.addEventListener("click", function () {
    menuAbout.style.color = color1;
    setTimeout(function (){
        menuAbout.style.color = color2;
    }, 500);
    setTimeout(function (){
        location.href = "#author";
    },200);
});

let burger = document.querySelector('.menu__burger');
let menuCont = document.querySelector('.menu__cont');
let menuClose = document.querySelector('.menu__close');

burger.addEventListener('click', function (){
    burger.style.display = 'none';
    menuCont.style.display = 'block';
    setTimeout(function (){
        menuCont.style.right = '0';
    }, 17);
    setTimeout(function (){
        menuClose.style.display = 'block';
    }, 400);
});

menuClose.addEventListener('click', function (){
    menuClose.style.display = 'none';
    menuCont.style.display = 'none';
    burger.style.display = 'block';
    menuCont.style.right = '-200px';
});

// КУКИ

let popupCookie = document.querySelector('.popup__cookies');
let popupCookieCont = document.querySelector('.popup__cookies .popup__content');
let popupCookieOK = document.querySelector('.popup__cookies .popup__button--ok');

let cookieNote = document.querySelector('.cookie__cont');
document.querySelector('.cookie__cont img').addEventListener('click', function (){
    cookieNote.style.display = 'none';
});
document.querySelector('.cookie__cont button').addEventListener('click', function (){
    setCookie('cookiesConfirmed', true, {expires: 3600 * 24 * 31});
    cookieNote.style.display = 'none';
});
document.querySelector('.cookie__more').addEventListener('click', function (){
    showPopup(popupCookie, popupCookieCont, 500, 477);
});
popupCookieOK.addEventListener('click', function (){
    hidePopup(popupCookie, popupCookieCont);
});

// вход в игру

function gameEnter() {
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        // код для мобильных устройств
        location.href = 'stop.html';
    } else {
        // код для обычных устройств
        location.href = 'game.html';
    }
}