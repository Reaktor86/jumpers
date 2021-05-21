document.querySelectorAll('.recover__false button, .popup__profile .popup__button--cancel, .recover__result button').forEach(function (item){
    item.addEventListener('click', function (){
        location.href = 'index.php';
    });
});

let load = document.querySelector('.profile__cont--loading');
let recoverDiv = document.querySelector('.profile__cont--pass');
let recoverErrorPass = document.querySelector('.reg__error--pass');
let recoverErrorPass2 = document.querySelector('.reg__error--pass2');
let recoverResult = document.querySelector('.recover__result');
let recoverResultP = document.querySelector('.recover__result p');

document.querySelector('.profile__cont--pass').addEventListener('submit', function (e){
    e.preventDefault();

    recoverDiv.style.display = 'none';
    load.style.display = 'flex';

    let body = {
        method: 'recoverPass',
        pass: this.querySelector("input[name=pass-change__new]").value,
        pass2: this.querySelector("input[name=pass-change__new2]").value,
        hash: this.dataset.hash,
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

        if (data.errorPass || data.errorPass2 || data.errorHash) {
            if (data.errorPass) {
                recoverErrorPass.innerHTML = data.errorPass;
                recoverErrorPass.style.display = 'block';
                recoverDiv.style.display = 'block';
            }
            if (data.errorPass2) {
                recoverErrorPass2.innerHTML = data.errorPass2;
                recoverErrorPass2.style.display = 'block';
                recoverDiv.style.display = 'block';
            }
            if (data.errorHash) {
                recoverResultP.innerHTML = data.errorHash;
                recoverResultP.style.color = 'red';
                recoverResult.style.display = 'block';
            }
        } else if (data == 1) {
            recoverResultP.innerHTML = 'пароль успешно изменён!';
            recoverResultP.style.color = 'green';
            recoverResult.style.display = 'block';
        } else {
            recoverResultP.innerHTML = 'неизвестная ошибка';
            recoverResultP.style.color = 'red';
            recoverResult.style.display = 'block';
        }

        load.style.display = 'none';
    });
});