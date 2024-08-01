
let turista = prompt("Informe seu nome.")
let s_respostaTurista = prompt("Voce já visitou alguma cidade?")
let nomeCidades = ""
let contagem = 0


while (s_respostaTurista === "sim"){
    nomeCidades += ", " + prompt("Informe o nome da cidade visitada.")
    contagem ++
    s_respostaTurista = prompt("Voce já visitou alguma cidade?")
}


alert (
    "Turista: "+ turista +
    "\nCidades: " + nomeCidades + "\n" +
    "\nNúmero de cidades visitadas: " + contagem
)
