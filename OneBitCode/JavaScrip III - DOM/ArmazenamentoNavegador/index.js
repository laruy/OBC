document.getElementById('sessionBtn').addEventListener('click', function(){
    const input = document.getElementById('session')
    window.sessionStorage.setItem('info', input.value)
    input.value = ''
})

document.getElementById('readSession').addEventListener('click', function(){
    const info = sessionStorage.getItem('info')
    alert(info)
})

document.getElementById('localBtn').addEventListener('click', function(){
    const input = document.getElementById('local')
    window.localStorage.setItem('text', input.value)
    input.value = ''
})

document.getElementById('readLocal').addEventListener('click', function(){
    const text = localStorage.getItem('text')
    alert(text)
})

document.getElementById('cookieBtn').addEventListener('click', function(){
    const input = document.getElementById('cookie')
    // coockieName = value; expires = UTCStringDate; path = /;
    const cookie = 'info=' + input.value + ';'
    const expiration = 'expires=' + new Date(2024, 2, 14) + ';'
    const path = 'path=/;'

    document.cookie = cookie + expiration + path
    input.value = ''
})


document.getElementById('cookie2Btn').addEventListener('click', function(){
    const input = document.getElementById('cookie2')
    // coockieName = value; expires = UTCStringDate; path = /;
    const cookie = 'text=' + input.value + ';'
    const expiration = 'expires=' + new Date(2024, 1, 14) + ';'
    const path = 'path=/;'

    document.cookie = cookie + expiration + path
    input.value = ''
})
