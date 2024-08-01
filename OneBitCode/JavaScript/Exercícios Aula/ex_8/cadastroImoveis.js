let arr_imoveis = []
let opcao = ""
let qtdImoveis = 0

let imoveisCadastrados

do{
    opcao = prompt(
            "Quantidade de imóveis: " + arr_imoveis.length +
            "\n1- Cadastrar um imóvel" +
            "\n2- Mostrar imóveis" +
            "\n3- Sair"
    )

    switch (opcao) {
        case "1":
            let imoveis = {}
            imoveis.nomeProprietario = prompt("Informe o nome do proprietário.")
            imoveis.qtdQuartos       = prompt("Informe a quantidade de quartos.")
            imoveis.qtdBanheiros     = prompt("Informe a quantidade de banheiros.")
            imoveis.possuiGaragem    = prompt("O imóvel possui garagem: (sim/nao)")
            arr_imoveis.push(imoveis)
            break
        case "2":
            for(let i = 0; i < arr_imoveis.length; i++){
                alert(arr_imoveis[i].nomeProprietario + "\n" +
                arr_imoveis[i].qtdQuartos + "\n" +
                arr_imoveis[i].qtdBanheiros + "\n" +
                arr_imoveis[i].possuiGaragem + "\n\n")
            }
            break
        case "3":
            alert("Encerrando...")
            break
        default:
            alert("Opção inválida!")
    }
}while (opcao !== "3")