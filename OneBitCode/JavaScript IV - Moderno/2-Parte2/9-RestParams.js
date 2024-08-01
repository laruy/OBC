// um parâmetro rest deve ser o último declarado na função
function sum(...numbers){
    return numbers.reduce((accum, num)=> accum + num, 0)
}

console.log(sum(1,1))
console.log(sum(1,1,1,1,1,1,1)) //posso passar diferentes quantidades de parâmetros