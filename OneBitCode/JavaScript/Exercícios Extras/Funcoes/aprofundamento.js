function slowDownShip(velocity, printer){
    let decelarion = 20

    while (velocity > 0){
        printer(velocity)
        velocity -= decelarion
    }

    alert("Nave parada. As comportas podem ser abertas.")
}

let spaceShipVelocity = 150

slowDownShip(spaceShipVelocity, function(velocity){
    console.log("Velocidade atual = " + velocity + "km/s")
})

