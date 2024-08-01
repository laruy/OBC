let arr_vagas = []
const arr_candidatos = []
let opcao = ""

function criarVaga(){
    const nome          = prompt("Informe o nome da vaga.")
    const descricao     = prompt("Informe a descrição da vaga.")
    const dataLimite    = prompt("Informe a data limite.")

    arr_candidatos.qtdCandidatos = 0

    const confirmacao = confirm("Confirma os dados da vaga?" + "\n" +
                                   "\nNome:                 " + nome +
                                   "\nDescrição:            " + descricao +
                                   "\nData Limite:          " + dataLimite
                           )

    if(confirmacao){
        const o_vagas = { nome, descricao, dataLimite, arr_candidatos }
        arr_vagas.push(o_vagas)
        alert("Vaga criada com sucesso")
    }
    else{
        alert("Voltando ao menu")
    }
}

function listarVagas(){

    if (arr_vagas.length === 0){
        alert("Não há vagas.")
        return
    }

    const vagasEmTexto = arr_vagas.reduce(function(textoFinal, vaga, indice){
        //Texto Final = valor acumulado
        //Vaga = valor atual (do array)
        // 1. nome, (x candidatos)
        textoFinal += indice + ". "
        textoFinal += vaga.nome
        textoFinal += " (" + vaga.arr_candidatos.length + " candidatos)"
        textoFinal += "\n"
        return textoFinal
    }, "")
    alert(vagasEmTexto)
}

function visualizarVaga(){

    if (arr_vagas.length === 0){
        alert("Não há vagas.")
        return
    }

    indice = prompt(
        "Informe o índice da vaga"
    )

    if(indice >= (arr_vagas.length) || indice < 0){
        alert("Índice inválido")
        return
    }

    const candidatosEmTexto = arr_vagas[indice].arr_candidatos.reduce(function(textoFinal, candidato){
        return textoFinal + "\n - " + candidato
    }, "" )

    alert("Índice:      " + indice + "\n" +
          "Nome:        " + arr_vagas[indice].nome + "\n" + 
          "Descrição:   " + arr_vagas[indice].descricao + "\n" +
          "Data Limite: " + arr_vagas[indice].dataLimite + "\n"+
          "Quantidade de candidatos: " + arr_vagas[indice].arr_candidatos.qtdCandidatos + "\n" + 
          "Candidatos: " + candidatosEmTexto)
}

function inscreverCandidato(){

    if (arr_vagas.length === 0){
        alert("Não há vagas.")
        return
    }

    nomeCandidato = prompt("Informe seu nome")
    indice        = prompt("Informe o índice da vaga desejada")

    if (indice >= arr_vagas.length || indice < 0){
        alert("Não há vagas.")
        return
    }

    confirmacao = confirm("Confirma sua inscrição nesta vaga?\n"+
                          "Índice:      " + indice + "\n" +
                          "Nome:        " + arr_vagas[indice].nome + "\n" + 
                          "Descrição:   " + arr_vagas[indice].descricao + "\n" +
                          "Data Limite: " + arr_vagas[indice].dataLimite + "\n"+
                          "Quantidade de candidatos: " + arr_vagas[indice].arr_candidatos.qtdCandidatos
                         )
    if(confirmacao){
        arr_vagas[indice].arr_candidatos.qtdCandidatos++
        arr_candidatos.push(nomeCandidato)
        alert("Inscrição realizada com sucesso!")
    }
    else{
        alert("Voltando ao menu")
    }
}

function excluirVaga(){
    if (arr_vagas.length === 0){
        alert("Não há vagas.")
        return
    }

    let indice = prompt("Informe o índice da vaga que deseja excluir.")

    confirm("Confirma exclusão da vaga?\n\n" +
           "Índice:      " + indice + "\n" +
           "Nome:        " + arr_vagas[indice].nome + "\n" + 
           "Descrição:   " + arr_vagas[indice].nome + "\n" +
           "Data Limite: " + arr_vagas[indice].dataLimite + "\n"+
           "Quantidade de candidatos: " + arr_vagas[indice].arr_candidatos.qtdCandidatos)

    //A partir do índice é removido um elemento
    if (confirm) {
        arr_vagas.splice(indice, 1)
        alert("Vaga excluída com sucesso!")
    }
    else{
        alert("Voltando ao menu.")
    }
}

function exibirMenu(){
    return prompt(
        "VAGAS EMPREGO\n\n"+
        "1- Listar vagas disponíveis\n"+
        "2- Criar nova vaga\n"+
        "3- Visualizar uma vaga\n"+
        "4- Inscrever-se em uma vaga\n"+
        "5- Excluir uma vaga\n"+
        "6- Sair"
    )
}

function executar(){
    do{
        opcao = exibirMenu()
        switch (opcao){
            case "1": 
                listarVagas()
                break
            case "2":
                criarVaga()
                break
            case "3":
                visualizarVaga()
                break
            case "4":
                inscreverCandidato()
                break
            case "5": 
                excluirVaga()
                break
            case "6": 
                alert("Encerrando aplicação")
                break
            default:
                alert("Opcao inválida!")
                break
        }
    }while(opcao !== "6")
}

executar()