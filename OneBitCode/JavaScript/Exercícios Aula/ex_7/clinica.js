let arr_pacientes = ["Lais"]
let opcao = "", pacientes = "", nomePaciente = "", pacienteConsultado = ""

do {
    pacientes = ""
    for(let i = 0; i < arr_pacientes.length; i++){
        pacientes += (i+1)+"º "+ arr_pacientes[i] + "\n"
    }

    opcao = prompt(
                "Pacientes: \n" + pacientes +
                "\n1- Novo paciente." +
                "\n2- Consultar paciente." +
                "\n3- Sair."
            )

    switch (opcao){
        case "1":
            nomePaciente = prompt("Informe o nome do paciente")
            arr_pacientes.push(nomePaciente)
            break
        case "2":
            pacienteConsultado = arr_pacientes.shift()
            if(pacienteConsultado){
                alert(pacienteConsultado)
            }else{
                alert("Não há pacientes na fila")
            }
            break
        case "3":
            break
    }

}while (opcao != 3)