const s_palavra = prompt("Informe uma palavra")
let s_palavraInvertida = ""


for (let i = s_palavra.length - 1; i >= 0 ; i--){
    s_palavraInvertida += s_palavra[i]
}

alert(s_palavraInvertida)

if (s_palavra === s_palavraInvertida){
    alert("A palavra informada é um palíndromo!")
}else{
    alert("A palavra informada não é um palíndromo!")
}