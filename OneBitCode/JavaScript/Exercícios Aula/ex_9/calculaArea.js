let opcao = ""
let area = 0, altura = 0, baseMaior = 0, baseMenor = 0, raio = 0

function multiplicaElementos(x,y){
    return x*y
}
function dividePor2(x){
    return x/2
}
function mostraArea(area){
    alert("Área = "+area)
}

do{
     opcao = prompt(
            "Selecione uma figura geométrica para calcular a área"+
            "\n1- Triângulo"+
            "\n2- Retângulo"+
            "\n3- Quadrado"+
            "\n4- Trapézio"+
            "\n5- Círculo"+
            "\n6- Sair"
            )
    switch (opcao){
        case "1":
            base   = prompt("Informe a base do triângulo.")
            altura = prompt("Informe a altura do triângulo.")
            mostraArea(dividePor2(multiplicaElementos(base, altura)))
            break
        case "2":
            base   = prompt("Informe a base do retângulo.")
            altura = prompt("Informe a altura do retângulo.")
            mostraArea(multiplicaElementos(base, altura))
            break
        case "3":
            lado = prompt("Informe o lado do quadrado.")
            mostraArea(multiplicaElementos(lado, lado))
            break
        case "4":
            baseMaior = parseFloat(prompt("Informe a base maior do trapézio."))
            baseMenor = parseFloat(prompt("Informe a base menor do trapézio"))
            altura    = prompt("informe a altura do trapézio.")
            mostraArea(dividePor2(multiplicaElementos(baseMaior+baseMenor, altura)))
            break
        case "5":
            raio = prompt("Informe o raio do círculo.")
            mostraArea(3.14 * multiplicaElementos(raio,raio))
            break
        case "6":
            alert("encerrando...")
            break
    }
}while(opcao !== "6")