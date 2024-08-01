const arr_vagas = []

function listarVagas(){
    const vagasEmTexto = arr_vagas.reduce(function(textoFinal, vaga, indice){
        // 1. nome, (x candidatos)
        textoFinal += indice + ". "
        textoFinal += vaga.nome
        textoFinal += " (" + vaga.arr_candidatos.length + " candidatos)"
        return textoFinal
    }, "")
    alert(vagasEmTexto)
}

function novaVaga(){
    const nome = prompt("Informe um nome para a vaga")
    const descricao = prompt("Informe uma descrição para a vaga")
    const dtLimite = prompt("Informe uma data limite (dd/mm/aaaa)")

    const confirmacao = confirm("Deseja criar uma nova vaga com essas informações?\n"+
                                "Nome: " + nome + "\nDescrição: " + descricao + "\nData limite: " + dtLimite)
    
    if (confirmacao){
        const novaVaga = { nome, descricao, dtLimite, candidatos: []}
        arr_vagas.push(novaVaga)
        alert("Vaga criada com sucesso!")
    }
}

function exibirVaga(){
    const indice = prompt("Informe o índice da vaga que deseja exibir")
    
    if (indice >= arr_vagas.length || indice < 0){
        alert("Índice inválido.")
        return 
    }

    const vaga = arr_vagas[indice]

    const candidatosEmTexto = vaga.arr_candidatos.reduce(function(textoFinal, candidato){
        return textoFinal + "\n - " + candidato
    }, "")

    alert("Vaga nº " + indice + 
           "\nNome: " + vaga.nome + 
           "\nDescrição: " + vaga.descricao + 
           "\nData limite: " + vaga.dtLimite + 
           "\nQuantidade de candidatos: " + vaga.arr_candidatos.length + 
           "\nCandidatos inscritos: " + candidatosEmTexto)
}

function inscreverCandidato(){
    const candidato = prompt("Informe o nome do candidato(a): ")
    const indice = prompt("Informe o índice da vaga para qual deseja se inscrever")
    const vaga = arr_vagas[indice]

    const confirmacao = confirm("Deseja inscrever o candidato " + candidato + "na vaga" + indice + "?\n" + 
                                "Nome" + vaga.nome + "\nDescrição: " + vaga.descricao + "\nData limite: " + vaga.dtLimite)

    if(confirmacao){
        vaga.arr_candidatos.push(candidato)
        alert("Inscrição realizada com sucesso!")
    }
}

function excluirVaga() {
    const indice = prompt("Informe o índice da vaga que deseja excluir")
    const vaga = arr_vagas[indice]

    const confirmacao = confirm("Tem certeza que deseja excluir a vaga " + indice + "?\n" + 
                                "Nome" + vaga.nome + "\nDescrição: " + vaga.descricao + "\nData limite: " + vaga.dtLimite)
}

if (confirmacao) {
    arr_vagas.splice(indice, 1)
    alert("Vaga excluída")
}

function exibirMenu(){
    const opcao = prompt("Cadastro de Vagas de Emprego" + 
                         "\n\n Escolha uma das opções: " +
                         "\n1. Listar vagas disponíveis" +
                         "\n2. Criar uma nova vaga" + 
                         "\n3. Exibir uma vaga" + 
                         "\n4. Inscrever um candidato" + 
                         "\n5. Excluir uma vaga" +
                         "\n6. Sair")
    return opcao
}

function executar(){
    let opcao = ""
    do{
        opcao = exibirMenu()
        switch(opcao){
            case "1":
                listarVagas()
                break
            case "2":
                novaVaga()
                break  
            case "3":
                exibirVaga()
                break
            case "4":
                inscreverCandidato()
                break
            case "5":
                excluirVaga()
                break
            case "6":
                alert("Saindo...")
                break
            default:
                alert("Opção inválida!")
        }
    }while(opcao !== "6")
}

executar()
