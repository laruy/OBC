//contexto onde a variável foi declarada

let pokemon = "Charmander"

function evoluir(){
    pokemon = "Charmeleon"
}
//----------------------------------------------------------------------------------------------
function criarAnimal(){
    let animal = "gato"
}

criarAnimal()
console.log(animal) //undefined
//----------------------------------------------------------------------------------------------
function avaliarNota(nota){
    if(nota > 60){
        var aprovado = true
        let situacao = "Aprovado"
    }
    else{
        var aprovado = false
        let situacao = "Reprovado" 
    }
    console.log(nota)
    console.log(aprovado) //var fica disponível no escopo externo
    console.log(situacao) //not defined
}

avaliarNota(83)
avaliarNota(49)
//----------------------------------------------------------------------------------------------
function ola(){
    var texto = "ola"
}

console.log(texto) //not defined (var não fica disponível fora do escopo nesse caso)
//----------------------------------------------------------------------------------------------
console.log(nome) //undefined
console.log(sobrenome) //Cannot access before inicialization

var nome = "Lais"
let sobrenome = "Maruyama"

console.log(nome)
console.log(sobrenome)