function dividir(numero){
    console.log(numero)
    if (numero % 2 === 0){
        dividir(numero)
    }else{
        return numero
    }
}

// dividir(40)

function dobrar (numero){
    console.log(numero)
    dobrar(numero * 2)
}

// dobrar(1)

function fatorial(numero){
    console.log("Número: " + numero)
    if(numero === 0){ //caso base
        return 1
    }else if(numero === 1){
        return 1
    }else{
        console.log(numero + " * !" + (numero - 1))
        return numero * fatorial(numero - 1)
    }
}

console.log(fatorial(5))