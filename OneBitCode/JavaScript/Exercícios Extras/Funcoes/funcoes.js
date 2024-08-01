shipName = prompt("Informe o nome da nave")
let speed = 0
let option = ""
function speedUpShip(){
    speed += 5
    alert("Nova velocidade: " + speed + "km/s")
}

function slowDownShip(){
    speed -= 5
    alert("Nova velocidade: " + speed + "km/s")
}

function printOnBoardData(){
    alert(
        "Nome da nave: " + shipName + 
        "\nVelocidade atual: " + speed
    )
}

function exibirMenu(){
    option = prompt(
        "1.Acelerar a nave em 5km/s\n" +
        "2.Desacelerar em 5km/s\n" + 
        "3.Imprimir dados de bordo\n" + 
        "4.Sair do programa"
    )
    return option
}

function executar(){
    do{
        option = exibirMenu()
        switch(option){
            case "1":
                speedUpShip()
                break
            case "2":
                slowDownShip()
                break
            case "3":
                printOnBoardData()
                break
            case "4":
                alert("Saindo...")
                break
        }

    }while(option !== "4")
}

executar()