let saldoInicial = parseFloat(prompt("Informe seu saldo disponível"))
let movimentacao, operacao

do {
    movimentacao = 0
    operacao = prompt (
        "Saldo disponível: " + saldoInicial +
        "\n\n Informe a operação desejada: " +
        "\n\n 1-Adicionar\n 2-Remover\n 3-Sair"
    )

    switch (operacao){
        case "1":
            movimentacao = parseFloat(prompt("Informe a quantidade a ser adicionada."))
            alert(
                saldoInicial += movimentacao
            )
            break
        case "2":
            movimentacao = parseFloat(prompt("Informe a quantidade a ser removida."))
            alert(
                saldoInicial -= movimentacao
            )
            break
        case "3":
            break
    }
}while(operacao != 3)
