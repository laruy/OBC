let opcaoMenu

do{
    opcaoMenu = prompt("Selecione uma opcao do menu "+
    "\n1-Arroz\n2-Feijão\n3-Batata\n4-Macarrão\n5-Encerrar") 

    if(opcaoMenu === "5-Encerrar"){
        break
    }

    alert(opcaoMenu)

}while (opcaoMenu !== "5-Encerrar")

alert("O programa está sendo finalizado!")