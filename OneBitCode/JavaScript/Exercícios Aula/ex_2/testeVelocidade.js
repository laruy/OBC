const nomeVeiculo1 = prompt("Informe o nome do veículo 1.")
const velocidade1 = parseFloat(prompt("Informe a velocidade do veículo 1"))

const nomeVeiculo2 = prompt("Informe o nome do veículo 2.")
const velocidade2 = parseFloat(prompt("Informe a velocidade do veículo 2"))

if(velocidade1 > velocidade2){
    alert(
    "O veículo " + nomeVeiculo1 + " é mais rápido."
    )
}
else{
    alert(
        "O veículo " + nomeVeiculo2 + " é mais rápido."
    )   
}