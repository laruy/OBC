const a = 0 //false
const b = null //false
const c = "teste" //true

console.log(a || b || c) //retorna "teste"

console.log(a ?? b ?? c) //verifica se o valor é nulo ou undefined. Retorna "0"

b = a ?? 42
console.log({a, b}) //retorna a

