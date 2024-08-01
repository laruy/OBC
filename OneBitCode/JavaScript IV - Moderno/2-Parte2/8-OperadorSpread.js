const towns = ['Prontera', 'Izlude', 'Payon', 'Alberta', 'Geffen', 'Morroc']


console.log(...towns) //Prontera Izlude Payon Alberta Geffen Morroc
console.log(...towns[0]) // P r o n t e r a

//--------------------------------------------------------------------------------
const townsCopy = towns

townsCopy.pop()
townsCopy.pop()
townsCopy.push('Juno')

console.log({towns, townsCopy})
//realizou as alterações em ambos os arrays
//a variável aponta para o mesmo lugar de memória da outra e não cria uma cópia

//--------------------------------------------------------------------------------
const townsClone = [...towns]
townsClone.push("Aldebaran")
console.log({towns, townsCopy, townsClone})
//a alteração se dá apenas no townsClone, a variável não é apenas uma referência ao vetor original

//--------------------------------------------------------------------------------
const townsObj = {...towns}
const townsObjClone = {...townsObj}
townsObjClone.test = "teste"
console.log({townsObj, townsObjClone}) //apenas o townsObjClone tem a propriedade test adicionada
