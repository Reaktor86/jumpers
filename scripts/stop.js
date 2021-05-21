document.querySelector('.popup__stop .popup__button--ok').addEventListener('click', function (){
    document.cookie = 'logged=;path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT';
    location.href = 'index.php';
});