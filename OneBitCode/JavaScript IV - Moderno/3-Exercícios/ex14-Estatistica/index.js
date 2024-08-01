const mediaAritmeticaSimples = (...n) => {
    let soma = 0
    soma = n.reduce((accum, num)=> accum + num, 0)
    return soma/n.length
}

console.log(`Média aritmética simples: ${mediaAritmeticaSimples(1,2,3,4,5,6)}`)

//-------------------------------------------------------

const mediaAritmeticaPonderada = (pesos, ...valores) => {

    if (pesos.length !== valores.length || valores.length === 0) {
        return null;
    }

    let somaProdutos = valores.reduce((accum, num, i) => accum + num * (pesos[i] ?? 1), 0);
    let somaPesos = pesos.reduce((accum, peso) => accum + (peso ?? 1), 0);

    return somaProdutos/somaPesos;
}

console.log(`Média aritmética ponderada: ${mediaAritmeticaPonderada([2,100,8,4,4],2,3,4,5,6)}`)

//-------------------------------------------------------

const mediana = (...valores) => {
    valores.sort((a,b) => a-b);

    const meio = Math.floor(valores.length / 2);

    // Verifica se o comprimento do array é par ou ímpar
    if (valores.length % 2 === 0) {
        // Se for par, a mediana é a média dos dois valores do meio
        return (valores[meio - 1] + valores[meio]) / 2;
    } else {
        // Se for ímpar, a mediana é o valor do meio
        return valores[meio];
    }
}

console.log(`Mediana: ${mediana(10,9,8,3,12,27,5)}`)

//-------------------------------------------------------

const moda = (...valores) => {
    let contagem = {};

    // Loop para contar a frequência de cada elemento no array
    valores.forEach( (elemento) => {
        contagem[elemento] = (contagem[elemento] || 0) + 1;
    });

    // Encontrar valores com a maior frequência
    let modaValores = [];
    let maxFrequencia = 0;

    for (let chave in contagem) {
        if (contagem[chave] > maxFrequencia) {
            maxFrequencia = contagem[chave];
            modaValores = [chave];
        } else if (contagem[chave] === maxFrequencia) {
            modaValores.push(chave);
        }
    }

    // Se todos os elementos ocorrerem com a mesma frequência, não há moda
    if (modaValores.length === Object.keys(contagem).length) {
        return null;
    }

    return modaValores.map(Number); // Converte a moda para números, se necessário

}

console.log("A moda é: " + moda(10, 9, 8, 3, 12, 27, 5, 10, 12, 9));

