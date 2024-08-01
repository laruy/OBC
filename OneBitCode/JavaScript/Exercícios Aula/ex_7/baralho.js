let arr_baralho = []
let carta = "", baralho = "", cartaPuxada 

do{ 
    contCartas = ""
    for(let i = 0; i < arr_baralho.length; i++){
        contCartas++
    }

    opcao = prompt(
        contCartas +
        "\n1- Adicionar uma carta\n"+
        "2- Puxar uma carta\n"+
        "3- Sair"
    )

    switch (opcao){
        case "1":
            carta = prompt("Informe o nome da carta")
            arr_baralho.push(carta)
            break
        case "2":
            cartaPuxada = arr_baralho.pop()
            if (!cartaPuxada){
                alert("Não há cartas no baralho")
            }
            alert(carta)
            break
        case "3": 
            break
    }

}while (opcao != 3)