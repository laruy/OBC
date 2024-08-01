function ola() {
    console.log("Olá mundo!")
}

// ola()
//---------------------------------------------------------------------------------------------
function double(x){
     alert("O dobro de " + x + " é " + (x*2))
}

// double(9)
//---------------------------------------------------------------------------------------------
function dizerOla(name){
     alert("Olá, " + name + "!")
}

// dizerOla("Lais")
//---------------------------------------------------------------------------------------------
function soma(a,b){
    alert(a+b)
}

// soma(1,2)
//---------------------------------------------------------------------------------------------
function criarUsuario(nome, email, senha, tipoUsuario = "adm"){
    const usuario = {
        nome, //nome: nome,
        email,
        senha,
        tipoUsuario
    }
    console.log(usuario)
}

criarUsuario ("Lais", "laismaruyama@outlook.com", "lais123")
criarUsuario ("isaac")
//---------------------------------------------------------------------------------------------
function objetoComoParamtro(usuario){
    //...
    usuario.nome
    usuario.email
}

const dadosUsuario = {
    nom: "lais",
    telefone: "14996696377",
    email: "laismaruyama@outlook.com",
    senha: "lais123",
    endereco: "rua",
    aniversario: "2005"
}

objetoComoParamtro (dadosUsuario)