function calcular (a,b, operacao){
    console.log("Realizando uma opreação qualquer")
    const resultado = operacao(a,b)
    return resultado
}

function somar(x,y){
    console.log("Realizando uma soma")
    return x + y
}

calcular(3,5, somar)

calcular(8, 4, function(x,y){
    console.log("Realizando uma subtração")
    return x-y
})

function exibirElementos(elemento, indice, array){
    console.log({
        indice,
        elemento,
        array
    })
}

const lista = ["Maçã", "Banana", "Laranja", "Limão"]

for (let i = 0; i < lista.length; i++){
    exibirElementos(lista[i], i, lista)
}

lista.forEach(exibirElementos) // para cada elemento da lista, chama a função

lista.forEach(function (elemento, indice, array){
    elemento,
    indice,
    array
})