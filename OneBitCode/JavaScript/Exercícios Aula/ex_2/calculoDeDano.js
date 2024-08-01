const nomePersonagem = prompt("Informe o nome do personagem.")
const poderPersonagem = prompt("Informe o poder do personagem")

const nomeInimigo = prompt("Informe o nome do inimigo.")
const poderInimigo = prompt("Informe o poder do inimigo")
let pontosDeVida = prompt("Informe a quantidade de pontos de vida do inimigo.")
const poderDefesa = prompt("Informe o poder de defesa do inimigo.")
const possuiEscudo = prompt("O inimigo possui escudo?")

let danoCausado = 0

if (poderPersonagem > poderDefesa && possuiEscudo === "n"){
    danoCausado = poderPersonagem - poderDefesa
}

else if (poderPersonagem > poderDefesa && possuiEscudo == "s"){
    danoCausado = (poderPersonagem - poderDefesa) / 2
}

pontosDeVida -= danoCausado

alert(
    "Personagem \n\n" +
    "Nome: "+ nomePersonagem+
    "\nPoder: "+ poderPersonagem+
    "\n\nInimigo\n\n"+
    "Nome: "+ nomeInimigo+
    "\nPoder: "+ poderInimigo+
    "\nPontos de vida: "+ pontosDeVida
)