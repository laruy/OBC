function register(element){
    const userName = element.children.username.value
    const password = element.children.password.value
    const passwordConfirmation = element.children.passwordConfirmation.value

    console.log({userName, password, passwordConfirmation})

    if (password === passwordConfirmation){
        alert("Usuário " + userName + " registrado!")
    }else{
        alert("As senhas não conferem!")
    }
}