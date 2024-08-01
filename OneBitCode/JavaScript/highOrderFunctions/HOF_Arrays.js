const personagens = [
    { nivel: 42, nome: "Thrall", raca: "Orc", classe: "Xamã" },
    { nivel: 28, nome: "Garrosh", raca: "Orc", classe: "Guerreiro" },
    { nivel: 35, nome: "Varok", raca: "Orc", classe: "Guerreiro" },
    { nivel: 35, nome: "Uther", raca: "Humano", classe: "Paladino" },
    { nivel: 26, nome: "Jaina", raca: "Humano", classe: "Maga" },
    { nivel: 39, nome: "Tyrande", raca: "Elfo Noturno", classe: "Sacerdotisa" },
    { nivel: 29, nome: "Muradin", raca: "Anão", classe: "Guerreiro" },
  ]
//----------------------------------------------------------------------------

// Map

// const nomes = []
// for (let i = 0; i < personagens.length; i++) {
//   const personagem = personagens[i]
//   nomes.push(personagem.nome)
// }

// map: permite obter um novo array a partir de um array existente
const nomes = personagens.map(function (personagem) {
  return personagem.nome
})
  console.log(nomes)

//----------------------------------------------------------------------------

// Filter

//   const orcs = []
//   for(let i = 0; i<personagens.length; i++){
//     if(personagens[i].raca = "Orc"){
//         orcs.push(personagens[i])
//     }
//   }

const orcs = personagens.filter(function(personagem){
    return personagem.raca === "Orc"
})

  console.log(orcs)

//----------------------------------------------------------------------------

//Reduce

const nivel = personagens.reduce(function(valorAcumulado, personagem){
return valorAcumulado + personagem.nivel
}, 0)

console.log(valorAcumulado)

const racas = personagens.reduce(function(valorAcumulado, personagem){
    if (valorAcumulado[personagem.raca]){
        valorAcumulado[personagem.raca].push(personagem)
    }
    else{
        valorAcumulado[personagem.raca] = [personagem]
    }
    return valorAcumulado
}, {})

//----------------------------------------------------------------------------

// Sort
// realiza comparações em pares para ordenar o elemento
const personagensOrdenados = personagens.slice().sort(function(a,b){
    return a.nivel - b.nivel
})

console.log(personagens)
