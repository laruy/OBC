let shipName = prompt("Informe o nome da nave.")
let reverseShipName = ""

for (i = (shipName.length) - 1; i>=0; i--){
    if(shipName[i] !== "e"){
        reverseShipName += shipName[i]
    }else{
        break
    }
}

alert("Nome da nave invertido: " + reverseShipName)