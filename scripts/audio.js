class AudioBase {

    playSound(name) {
        sound.soundList[name].volume = sound.soundVol;
        sound.soundList[name].play();
    }

    playMusic(name) {
        music.musicList[name].volume = music.musicVol;
        if (music.loopList.includes(name)) {
            music.musicList[name].loop = true;
        }
        music.musicList[name].play().catch((error) => {
            console.log(error);
            setTimeout(function () {
                music.playMusic(name);
            }, 500);
        });
    }

    playRandom(...sounds) {
        let index = Math.floor(Math.random() * sounds.length);
        sound.playSound(sounds[index]);
    }

    stopSound(name) {
        sound.soundList[name].load();
    }

    stopMusic() {
        for (let item in music.musicList) {
            music.musicList[item].load();
        }
    }

    checkMusicPaused(name) {
        if (music.musicList[name].paused) {
            return true;
        } else {
            return false;
        }
    }
}

class Sound extends AudioBase {

    soundVol = 1

    soundList = {

        // menu

        'menu-click': new Audio('sounds/menu-click.mp3'), // зависимость: saveAudioParams()
        'menu-clickCancel': new Audio('sounds/menu-clickCancel.mp3'),
        'menu-clickOK': new Audio('sounds/menu-clickOK.mp3'),
        'menu-denied': new Audio('sounds/menu-denied.mp3'),
        'menu-switch': new Audio('sounds/menu-switch.mp3'),

        // race

        'race-alarm': new Audio('sounds/race-alarm.mp3'),
        'race-branch': new Audio('sounds/race-branch.mp3'),
        'race-cubic1': new Audio('sounds/race-cubic1.mp3'),
        'race-cubic2': new Audio('sounds/race-cubic2.mp3'),
        'race-lagBonus': new Audio('sounds/race-lagBonus.mp3'),
        'race-pedestal': new Audio('sounds/race-pedestal.mp3'),
        'race-shiftArrow1': new Audio('sounds/race-shiftArrow1.mp3'),
        'race-shiftArrow2': new Audio('sounds/race-shiftArrow2.mp3'),
        'race-shiftArrow3': new Audio('sounds/race-shiftArrow3.mp3'),
        'race-shiftToken': new Audio('sounds/race-shiftToken.mp3'),
        'race-skipMove': new Audio('sounds/race-skipMove.mp3'),

        // actions

        'actions-meetShieldPositive': new Audio('sounds/actions-meetShieldPositive.mp3'),
        'actions-meetShieldNegative': new Audio('sounds/actions-meetShieldNegative.mp3'),
        'actions-meetTrap': new Audio('sounds/actions-meetTrap.mp3'),
        'actions-no': new Audio('sounds/actions-no.mp3'),
        'actions-useHatch': new Audio('sounds/actions-useHatch.mp3'),
        'actions-useIMP': new Audio('sounds/actions-useIMP.mp3'),
        'actions-useMagnet': new Audio('sounds/actions-useMagnet.mp3'),
        'actions-useManipulator': new Audio('sounds/actions-useManipulator.mp3'),
        'actions-useMoneybag': new Audio('sounds/actions-useMoneybag.mp3'),
        'actions-useMop': new Audio('sounds/actions-useMop.mp3'),
        'actions-usePower1': new Audio('sounds/actions-usePower1.mp3'),
        'actions-usePower2': new Audio('sounds/actions-usePower2.mp3'),
        'actions-usePower3': new Audio('sounds/actions-usePower3.mp3'),
        'actions-usePower4': new Audio('sounds/actions-usePower4.mp3'),
        'actions-usePower5': new Audio('sounds/actions-usePower5.mp3'),
        'actions-useShield': new Audio('sounds/actions-useShield.mp3'),
        'actions-useTrap': new Audio('sounds/actions-useTrap.mp3'),
        'actions-useVampire': new Audio('sounds/actions-useVampire.mp3'),

        // conditions

        'conditions-black': new Audio('sounds/conditions-black.mp3'),
        'conditions-bonus': new Audio('sounds/conditions-bonus.mp3'),
        'conditions-checkpoint': new Audio('sounds/conditions-checkpoint.mp3'),
        'conditions-deadEnd': new Audio('sounds/conditions-deadEnd.mp3'),
        'conditions-green': new Audio('sounds/conditions-green.mp3'),
        'conditions-moneybag': new Audio('sounds/conditions-moneybag.mp3'),
        'conditions-penalty': new Audio('sounds/conditions-penalty.mp3'),
        'conditions-red': new Audio('sounds/conditions-red.mp3'),
        'conditions-speed': new Audio('sounds/conditions-speed.mp3'),
        'conditions-star1': new Audio('sounds/conditions-star1.mp3'),
        'conditions-star2': new Audio('sounds/conditions-star2.mp3'),
        'conditions-star3': new Audio('sounds/conditions-star3.mp3'),
        'conditions-surprise': new Audio('sounds/conditions-surprise.mp3'),
        'conditions-surpriseGot': new Audio('sounds/conditions-surpriseGot.mp3'),
        'conditions-yellow': new Audio('sounds/conditions-yellow.mp3'),

        // result

        'result-finish': new Audio('sounds/result-finish.mp3'),
        'result-first': new Audio('sounds/result-first.mp3'),
        'result-lose': new Audio('sounds/result-lose.mp3'),

        // shop

        'shop-buy': new Audio('sounds/shop-buy.mp3'),
        'shop-enter': new Audio('sounds/shop-enter.mp3'),
        'shop-select': new Audio('sounds/shop-select.mp3'),
        'shop-sell': new Audio('sounds/shop-sell.mp3'),

        // boneworld

        'boneworld-bombBlast': new Audio('sounds/boneworld-bombBlast.mp3'),
        'boneworld-bombShow': new Audio('sounds/boneworld-bombShow.mp3'),
        'boneworld-bombTick': new Audio('sounds/boneworld-bombTick.mp3'),
        'boneworld-door': new Audio('sounds/boneworld-door.mp3'),
        'boneworld-skullBite': new Audio('sounds/boneworld-skullBite.mp3'),
        'boneworld-skullCollision': new Audio('sounds/boneworld-skullCollision.mp3'),
        'boneworld-skullMove': new Audio('sounds/boneworld-skullMove.mp3'),
        'boneworld-thanks': new Audio('sounds/boneworld-thanks.mp3'),

        // other

        'other-beer': new Audio('sounds/other-beer.mp3'),
        'other-cat': new Audio('sounds/other-cat.mp3'),
        'other-dontInvest': new Audio('sounds/other-dontInvest.mp3'),
        'other-gift': new Audio('sounds/other-gift.mp3'),
        'other-hint': new Audio('sounds/other-hint.mp3'),
        'other-invest': new Audio('sounds/other-invest.mp3'),
        'other-trophy': new Audio('sounds/other-trophy.mp3'),
    }
}

class Music extends AudioBase {

    musicVol = 0.6
    
    musicList = {
        'result-championshipLose': new Audio('sounds/result-championshipLose.mp3'),
        'result-championshipWin': new Audio('sounds/result-championshipWin.mp3'),
        'jumpers-theme': new Audio('sounds/jumpers-theme.mp3'), // зависимость: saveAudioParams()
        'shop-music1': new Audio('sounds/shop-music1.mp3'),
        'shop-music2': new Audio('sounds/shop-music2.mp3'),
        'race-begin': new Audio('sounds/race-begin.mp3'),
        'boneworld-begin': new Audio('sounds/boneworld-begin.mp3'),
        'boneworld-escape': new Audio('sounds/boneworld-escape.mp3'),
        'result-rankings': new Audio('sounds/result-rankings.mp3'),
        'other-emperor': new Audio('sounds/other-emperor.mp3'),
        'other-general': new Audio('sounds/other-general.mp3'),
    }

    loopList = [
        'jumpers-theme',
        'shop-music1',
        'shop-music2',
        'boneworld-escape',
    ];
}

let sound = new Sound();
let music = new Music();

// ВСЕ кнопки вкл-выкл звуки и музыку

let musicMenu = document.querySelector('.music-turner');
let musicButton = document.querySelector('.info__music');
let soundButton = document.querySelector('.info__sound');
let musicSettings = document.querySelector('.settings__music');
let soundSettings = document.querySelector('.settings__sound');

musicButton.addEventListener('click', musicMute);
soundButton.addEventListener('click', soundMute);
musicSettings.addEventListener('click', musicMute);
soundSettings.addEventListener('click', soundMute);
musicMenu.addEventListener('click', musicMute);

function musicMute() {
    console.log('музыка ВЫКЛ');
    musicMuteBody();
    saveAudioParams();
}

function musicMuteBody() {
    for (let item in music.musicList) {
        music.musicList[item].muted = true;
    }
    musicMenu.setAttribute('src', 'img/music-off.png');
    musicButton.querySelector('img').setAttribute('src', 'img/music-off.png');
    musicSettings.setAttribute('src', 'img/music-off.png');
    musicMenu.addEventListener('click', musicUnmute);
    musicMenu.removeEventListener('click', musicMute);
    musicButton.addEventListener('click', musicUnmute);
    musicButton.removeEventListener('click', musicMute);
    musicSettings.addEventListener('click', musicUnmute);
    musicSettings.removeEventListener('click', musicMute);
    setOpt5Par.innerHTML = '0';
}

function musicUnmute() {
    console.log('музыка ВКЛ');
    musicUnmuteBody();
    saveAudioParams();
}

function musicUnmuteBody() {
    for (let item in music.musicList) {
        music.musicList[item].muted = false;
    }
    musicMenu.setAttribute('src', 'img/music-on.png');
    musicButton.querySelector('img').setAttribute('src', 'img/music-on.png');
    musicSettings.setAttribute('src', 'img/music-on.png');
    musicMenu.addEventListener('click', musicMute);
    musicMenu.removeEventListener('click', musicUnmute);
    musicButton.addEventListener('click', musicMute);
    musicButton.removeEventListener('click', musicUnmute);
    musicSettings.addEventListener('click', musicMute);
    musicSettings.removeEventListener('click', musicUnmute);
    setOpt5Par.innerHTML = '' + (music.musicVol * 10);
}

function soundMute() {
    console.log('звуки ВЫКЛ');
    soundMuteBody();
    saveAudioParams();
}

function soundMuteBody() {
    for (let item in sound.soundList) {
        sound.soundList[item].muted = true;
    }
    soundSettings.setAttribute('src', 'img/sound-off.png');
    soundButton.querySelector('img').setAttribute('src', 'img/sound-off.png');
    soundButton.addEventListener('click', soundUnmute);
    soundButton.removeEventListener('click', soundMute);
    soundSettings.addEventListener('click', soundUnmute);
    soundSettings.removeEventListener('click', soundMute);
    setOpt4Par.innerHTML = '0';
}

function soundUnmute() {
    console.log('звуки ВКЛ');
    soundUnmuteBody();
    saveAudioParams();
}

function soundUnmuteBody() {
    for (let item in sound.soundList) {
        sound.soundList[item].muted = false;
    }
    soundSettings.setAttribute('src', 'img/sound-on.png');
    soundButton.querySelector('img').setAttribute('src', 'img/sound-on.png');
    soundButton.addEventListener('click', soundMute);
    soundButton.removeEventListener('click', soundUnmute);
    soundSettings.addEventListener('click', soundMute);
    soundSettings.removeEventListener('click', soundUnmute);
    setOpt4Par.innerHTML = '' + (sound.soundVol * 10);
}

// настройки громкости в меню "настройки"

// звуки

let setOpt4a = document.querySelector(".js-sett-opt4-a");
let setOpt4b = document.querySelector(".js-sett-opt4-b");
let setOpt4Par = document.querySelector(".js-sett-opt4-par");
setOpt4a.addEventListener("click", pressSoundLower);
setOpt4b.addEventListener("click", pressSoundUpper);
setOpt4Par.innerHTML = '' + (sound.soundVol * 10);

function pressSoundLower() {
    let current = +setOpt4Par.innerHTML;
    if (current <= 0) {
        return;
    }
    let newVol = current - 1;
    console.log("звук ТИШЕ, новое значение: " + newVol);
    setOpt4Par.innerHTML = '' + newVol;
    sound.soundVol = newVol / 10;
    for (let item in sound.soundList) {
        sound.soundList[item].volume = newVol / 10;
    }
    if (newVol <= 0) {
        soundMute();
    }
}

function pressSoundUpper() {
    let cur = +setOpt4Par.innerHTML;
    if (cur >= 10) {
        return;
    }
    let newVol = cur + 1;
    console.log("звук ГРОМЧЕ, новое значение: " + newVol);
    setOpt4Par.innerHTML = '' + newVol;
    sound.soundVol = newVol / 10;
    for (let item in sound.soundList) {
        sound.soundList[item].volume = newVol / 10;
    }
    if (cur == 0) {
        soundUnmute();
    }
}

// музыка

let setOpt5a = document.querySelector(".js-sett-opt5-a");
let setOpt5b = document.querySelector(".js-sett-opt5-b");
let setOpt5Par = document.querySelector(".js-sett-opt5-par");
setOpt5a.addEventListener("click", pressMusicLower);
setOpt5b.addEventListener("click", pressMusicUpper);
setOpt5Par.innerHTML = '' + (music.musicVol * 10);

function pressMusicLower() {
    let current = +setOpt5Par.innerHTML;
    if (current <= 0) {
        return;
    }
    let newVol = current - 1;
    console.log("музыка ТИШЕ, новое значение: " + newVol);
    setOpt5Par.innerHTML = '' + newVol;
    music.musicVol = newVol / 10;
    for (let item in music.musicList) {
        music.musicList[item].volume = newVol / 10;
    }
    if (newVol <= 0) {
        musicMute();
    }
}

function pressMusicUpper() {
    let current = +setOpt5Par.innerHTML;
    if (current >= 10) {
        return;
    }
    let newVol = current + 1;
    console.log("музыка ГРОМЧЕ, новое значение: " + newVol);
    setOpt5Par.innerHTML = '' + newVol;
    music.musicVol = newVol / 10;
    for (let item in music.musicList) {
        music.musicList[item].volume = newVol / 10;
    }
    if (current == 0) {
        musicUnmute();
    }
}

// КУКИС настройки аудио

function refreshAudioParams() {
    let getSettings = getCookie('audioSettings');
    if (!getSettings) return;
    let params = JSON.parse(getSettings);

    // звуки
    console.log("громкость звука из куки: " + params.soundVol);
    setOpt4Par.innerHTML = '' + (params.soundVol * 10);
    sound.soundVol = +params.soundVol;
    for (let item in sound.soundList) {
        sound.soundList[item].volume = +params.soundVol;
    }
    if (params.soundVol == 0 || params.soundMute) {
        soundMuteBody();
        console.log('звук ВЫКЛ из-за куки');
    }

    // музыка
    console.log("громкость музыки из куки: " + params.musicVol);
    setOpt5Par.innerHTML = '' + (params.musicVol * 10);
    music.musicVol = +params.musicVol;
    for (let item in music.musicList) {
        music.musicList[item].volume = +params.musicVol;
    }
    if (params.musicVol == 0 || params.musicMute) {
        musicMuteBody();
        console.log('музыка ВЫКЛ из-за куки');
    }
}

function saveAudioParams() {
    let saveData = {
        'soundVol': sound.soundVol,
        'musicVol': music.musicVol,
        'soundMute': sound.soundList["menu-click"].muted,
        'musicMute': music.musicList["jumpers-theme"].muted,
    }
    let save = JSON.stringify(saveData);
    setCookie('audioSettings', save, {expires: 3600 * 24 * 31});
    console.log('настройки звука сохранены: ');
    console.log(saveData);
}

// звук ui

document.querySelectorAll('.js-popup-ok, .js-popup-yes, .js-button-ok, .js-ok, .js-popup-confirm, .js-button-yes, .js-button-watch, .shop__button-over').forEach(function (item) {
    item.addEventListener('click', function () {
        sound.playSound('menu-clickOK');
    });
});

document.querySelectorAll('.js-popup-cancel, .js-button-cancel, .js-popup-no, .js-button-no, .js-popup-decline, .js-button-next').forEach(function (item) {
    item.addEventListener('click', function () {
        sound.playSound('menu-clickCancel');
    });
});

document.querySelectorAll('.settings button, .info__control .inventory-item, .info__control .info__trophy, .start-menu .popup__button, .js-popup-other').forEach(function (item) {
    item.addEventListener('click', function () {
        sound.playSound('menu-click');
    });
});

document.querySelectorAll('.js-settings .settings__buttons-1, .js-settings .settings__buttons-2').forEach(function (item) {
    item.addEventListener('click', function () {
        sound.playSound('menu-switch');
    });
});
