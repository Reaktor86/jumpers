// СИНХРОНИЗАЦИЯ local storage и базы данных сервера при входе в игру

function synchroniseTrophies(login) {
    // проверка прогресса трофеев
    // если данные отсутствуют, то копировать из резервной копии
    // если значение больше, то копировать большее в меньшее

    let trophies = 53;
    let storage = JSON.parse(localStorage.getItem('jumpers-trophies'));
    if (!storage) {
        storage = {};
    }
    if (!storage[login]) {
        storage[login] = {};
    }
    /*
    { Login:
     { id26: 1, id44: 2} }
     }
    */

    let body = {
        method: 'getAllTrophyProgress',
    };
    fetch('handle.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(body)
    }).then((response)=>{
        return response.json();
    }).then((data)=>{

        if (data.error) {
            console.log(data.error);
            return;
        }

        if (!Array.isArray(data)) {
            data = [];
        }
        // [{trophy_id: "1", progress: "1"},{trophy_id: "26", progress: "1"}]

        let base = {};
        for (let i = 0; i < data.length; i++) {
            base['id' + data[i].trophy_id] = +data[i].progress;
        }

        //console.log(storage[login]);
        //console.log(base);

        let baseChangeList = {};
        let storageChangeList = {};
        for (let i = 1; i < (trophies + 1); i++) {
            let checkStorage = storage[login]['id' + i];
            let checkBase = base['id' + i];

            if (checkStorage && !checkBase) {
                // создать значение в базе
                baseChangeList['id' + i] = checkStorage;
                continue;
            }
            if (!checkStorage && checkBase) {
                // создать значение в хранилище
                storageChangeList['id' + i] = checkBase;
                continue;
            }
            if (!checkStorage && !checkBase) continue;

            if (checkStorage > checkBase) {
                // копировать из локала в БД
                baseChangeList['id' + i] = checkStorage;
            }
            if (checkStorage < checkBase) {
                // копировать из БД в локал
                storageChangeList['id' + i] = checkBase;
            }
        }

        // ТРОФЕИ: провести все изменения
        if (!isObjEmpty(storageChangeList)) {

            for (let key in storageChangeList) {
                storage[login][key] = storageChangeList[key];
            }
            localStorage.setItem('jumpers-trophies', JSON.stringify(storage));
            console.log('Несоответствия трофеев: ряд значений в базе новее, чем в хранилище. Изменения проведены');
            console.log(storageChangeList);
        }

        if (!isObjEmpty(baseChangeList)) {

            let body = {
                method: 'refreshTrophies',
                base: baseChangeList,
            };
            fetch('handle.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify(body)
            }).then((response) => {
                return response.text();
            }).then(() => {
                console.log('Несоответствия трофеев: ряд значений в хранилище новее, чем в базе. Изменения проведены');
                console.log(baseChangeList);
            });
        }
    });
}

function synchroniseStats(login) {
    // проверка статистики юзера
    // если одно значение больше другого, то копировать большее в меньшее
    // если строка отсутствует, то создать её и скопировать значение

    let storage = JSON.parse(localStorage.getItem('jumpers-stat'));
    if (!storage) {
        storage = {};
    }
    if (!storage[login]) {
        storage[login] = {};
    }

    let body = {
        method: 'getStat',
    };
    fetch('handle.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(body)
    }).then((response)=>{
        return response.json();
    }).then((data)=>{

        if (data.error) {
            console.log(data.error);
            return;
        }

        if (typeof data !== 'object') {
            data = {};
        }

        let baseChangeList = {};
        let storageChangeList = {};

        for (let i = 0; i < 7; i++) {
            let key;
            if (i === 0) key = 'finish_first';
            if (i === 1) key = 'items_bought';
            if (i === 2) key = 'money';
            if (i === 3) key = 'money_shop';
            if (i === 4) key = 'power_used';
            if (i === 5) key = 'moves';
            if (i === 6) key = 'races';

            if (+storage[login][key] && !+data[key]) {
                // создать значение в базе
                baseChangeList[key] = +storage[login][key];
            }
            if (!+storage[login][key] && +data[key]) {
                // создать значение в хранилище
                storageChangeList[key] = +data[key];
            }
            if (+storage[login][key] > +data[key]) {
                // скопировать значение из хранилища в БД
                baseChangeList[key] = +storage[login][key];
            }
            if (+storage[login][key] < +data[key]) {
                // скопировать значение из БД в хранилище
                storageChangeList[key] = +data[key];
            }
        }
        //console.log(baseChangeList);
        //console.log(storageChangeList);

        // СТАТИСТИКА: провести все изменения
        if (!isObjEmpty(storageChangeList)) {

            for (let key in storageChangeList) {
                storage[login][key] = storageChangeList[key];
            }
            localStorage.setItem('jumpers-stat', JSON.stringify(storage));
            console.log('Несоответствия статистики: ряд значений в базе новее, чем в хранилище. Изменения проведены');
            console.log(storageChangeList);
        }

        if (!isObjEmpty(baseChangeList)) {

            let body = {
                method: 'updateStat',
                base: baseChangeList,
            };
            fetch('handle.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify(body)
            }).then((response) => {
                return response.text();
            }).then(() => {
                console.log('Несоответствия статистики: ряд значений в хранилище новее, чем в базе. Изменения проведены');
                console.log(baseChangeList);
            });
        }
    });
}

function synchroniseRating(login) {
    // проверка рейтинга
    // проверять только заполненность date: заполнено/не заполнено

    let storage = JSON.parse(localStorage.getItem('jumpers-rating'));
    if (!storage) {
        storage = {};
    }
    if (!storage[login]) {
        storage[login] = [];
    }

    let body = {
        method: 'getRatingRow',
    };
    fetch('handle.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(body)
    }).then((response)=>{
        return response.json();
    }).then((result)=>{

        if (result.error) {
            console.log(result.error);
            return;
        }

        if (!Array.isArray(result)) {
            result = [];
        }

        let baseChangeList = [];
        let storageChangeList = [];

        for (let i = 0; i < storage[login].length; i++) {
            // проверить, что в строке есть дата
            // если есть, то проверить, есть ли она в базе
            // если в базе нет, то копировать в базу
            if (storage[login][i].date) {
                let check = false;
                for (let k = 0; k < result.length; k++) {
                    if (result[k].date === storage[login][i].date) check = true;
                }
                if (!check) baseChangeList.push(storage[login][i]);
            }
        }
        for (let i = 0; i < result.length; i++) {
            if (result[i].date) {
                let check = false;
                for (let k = 0; k < storage[login].length; k++) {
                    if (storage[login][k].date === result[i].date) check = true;
                }
                if (!check) storageChangeList.push(result[i]);
            }
        }

        //console.log(baseChangeList);
        //console.log(storageChangeList);

        // РЕЙТИНГ: провести все изменения
        if (storageChangeList.length > 0) {

            for (let i = 0; i < storageChangeList.length; i++) {
                for (let item in storageChangeList[i]) {
                    if (item === 'id') {
                        storageChangeList[i].charId = storageChangeList[i][item];
                        delete storageChangeList[i][item];
                    }
                    if (item === 'user_id') delete storageChangeList[i][item];
                    if (item === 'score') {
                        storageChangeList[i].money = storageChangeList[i][item];
                        delete storageChangeList[i][item];
                    }
                    if (item === 'reputation') {
                        storageChangeList[i].rep = storageChangeList[i][item];
                        delete storageChangeList[i][item];
                    }
                }
                storage[login].push(storageChangeList[i]);
            }
            localStorage.setItem('jumpers-rating', JSON.stringify(storage));
            console.log('Несоответствия рейтинга: ряд значений в базе новее, чем в хранилище. Изменения проведены');
            console.log(storageChangeList);
        }

        if (baseChangeList.length) {

            let body = {
                method: 'addManyRatingRows',
                base: baseChangeList,
            };

            fetch('handle.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify(body)
            }).then((response) => {
                return response.text();
            }).then(() => {
                console.log('Несоответствия рейтинга: ряд значений в хранилище новее, чем в базе. Изменения проведены');
                console.log(baseChangeList);
            });
        }
    });
}

function synchroniseSavedGames(login) {
    // проверка сохраненных игр
    // проверка только на НАЛИЧИЕ сейвов
    if (!login) login = getCookie('logged');

    let storage = JSON.parse(localStorage.getItem('jumpers-savedGames'));
    if (!storage) {
        storage = {};
    }
    if (!storage[login]) {
        storage[login] = {};
    }

    let body = {
        method: 'getSavedGames',
    };
    fetch('handle.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(body)
    }).then((response)=>{
        return response.json();
    }).then((result)=>{
        if (result.error) {
            console.log(result.error);
            return;
        }
        console.log(result);
    });
}
