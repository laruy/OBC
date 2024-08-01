function areaTriangulo(){
    const base = prompt("Informe a base do triângulo")
    const altura = prompt("Informe a altura do triângulo")
    return base * altura / 2
}

function areaRetangulo(){
    const base = prompt("Informe a base do retângulo.")
    const altura = prompt("Informe a altura do retângulo")
    return base * altura
}

function areaQuadrado(){
    const lado = prompt("Informe o lado do quadrado")
    return lado*lado
}

function areaTrapezio(){
    const baseMaior = parseFloat(prompt("Informe a base maior do trapézio"))
    const baseMenor = parseFloat(prompt("Informe a base menor do trapézio"))
    const altura = prompt("Informe a altura do trapézio")
    return(baseMaior+baseMenor) * altura / 2
}

function calcularAreaCirculo(){
    const raio = prompt("Informe o raio do círculo")
    return 3.14 * raio * raio
}

function exibirMenu(){
    return prompt(
        "Selecione uma figura geométrica para calcular a área"+
        "\n1- Triângulo"+
        "\n2- Retângulo"+
        "\n3- Quadrado"+
        "\n4- Trapézio"+
        "\n5- Círculo"+
        "\n6- Sair"
    )
}

function executar(){
    let opcao = ""

    do{
        opcao = exibirMenu
        let resultado

        switch (opcao){
            case "1":
                resultado = areaTriangulo
            case "2":
                resultado = areaRetangulo
            case "3":
                resultado = areaQuadrado
            case "4":
                resultado = areaTrapezio
            case "5":
                resultado = calcularAreaCirculo
            case "6":
                alert("saindo...")
                break
            default:
                alert("Opção inválida!")
        }

        if (resultado){
            alert("Área = " + resultado)
        }
    }while(opcao !== "6")
}

executar()