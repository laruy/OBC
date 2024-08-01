let arr_imoveis = []
let opcao = ""

let imoveisCadastrados

do{
    opcao = prompt(
            "Quantidade de imóveis: " + arr_imoveis.length +
            "\n\n1- Cadastrar um imóvel" +
            "\n2- Mostrar imóveis" +
            "\n3- Sair"
    )

    switch (opcao) {
        case "1":
            const imoveis = {}
            imoveis.nomeProprietario = prompt("Informe o nome do proprietário: \n")
            imoveis.qtdQuartos       = prompt("Informe a quantidade de quartos: \n")
            imoveis.qtdBanheiros     = prompt("Informe a quantidade de banheiros: \n")
            imoveis.possuiGaragem    = prompt("O imóvel possui garagem? (s/n)")
            
            const confirmacao = confirm(
                "Salvar este imóvel?" +
                "\nProprietário:        " + imoveis.nomeProprietario + 
                "\nNúmero de quartos:   " + imoveis.qtdQuartos +
                "\nNúmero de banheiros: " + imoveis.qtdBanheiros +
                "\nPossui garagem:      " + imoveis.possuiGaragem
            )
            if (confirmacao) {
                arr_imoveis.push(imoveis)
                alert("Imóvel salvo com sucesso!")
            }else{
                alert("Voltando ao menu...")
            }
            break
        case "2":
            for (let i = 0; i < arr_imoveis.length; i++){
                alert(
                    "Imóvel " + (i+1) +
                    "\nProprietário:   " + arr_imoveis[i].nomeProprietario + 
                    "\nQuartos:        " + arr_imoveis[i].qtdQuartos +
                    "\nBanheiros:      " + arr_imoveis[i].qtdBanheiros +
                    "\nPossui Garagem: " + arr_imoveis[i].possuiGaragem
                )
            }
            break
        case "3":
            alert("Encerrando...")
            break
        default:
            alert("Opção inválida!")
    }
}while (opcao !== "3")