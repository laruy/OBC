const arr = ["Frodo", "Sam", "Merry", "Pippin", "Gandalf", "Aragorn", "Legolas", "Gimli"]
console.log(arr)

//-------------------------------------------------------------------------------------------------------------

// Adicionar elementos no array

//push (adiciona no fim do array)
const tamanhoArray = arr.push("Boromir")
console.log(arr)

//unshift (adiciona no início do array)
const tamanhoArray2 = arr.unshift("Boromir")
console.log(arr)    

//-------------------------------------------------------------------------------------------------------------

// Remover elementos no array

//pop (remove o último elemento do array)
const ultimoElemento = arr.pop()
console.log(ultimoElemento)

//shift (remove o primeiro elemento do array)
const primeiroElemento = arr.shift()
console.primeiroElemento

//-------------------------------------------------------------------------------------------------------------

// Pesquisar um elemento no array

//includes (retorna um booleano)
const inclui = arr.includes("Gandalf")
console.log(inclui)

//indexOf (retorna o índice do elemento)
const index = arr.indexOf("Gandalf")
console.log(index)

//-------------------------------------------------------------------------------------------------------------

// Cortar e concatenar os arrays

//slice (atribui a um novo vetor o conteúdo das posições informadas)
const hobbits = arr.slice(0, 4)
const outros  = arr.slice(-4)
console.log(hobbits)
console.log(outros)

//concat (une dois conteúdos em outra variável)
const sociedade = hobbits.concat(outros, "lais")
console.log(sociedade)

//-------------------------------------------------------------------------------------------------------------

// Substituição dos elementos

//splice (revome um grupo de elementos do array e o substitui)
const elementosRemovidos = sociedade.splice(index, 1, 'Gandalf, o Cinzento')
console.log(elementosRemovidos)

//-------------------------------------------------------------------------------------------------------------

// Iterar sobre os elementos do array

for(let index = 0; index < sociedade.length; index++){
    const elemento = sociedade[index]
    console.log("O " + elemento + "se encontra na posição " + index)
}