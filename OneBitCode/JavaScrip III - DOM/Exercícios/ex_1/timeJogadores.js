function confirmPlayer(){
    const positionValue = document.getElementById('position').value 
    const nameValue = document.getElementById('name').value
    const shirtValue = document.getElementById('shirt').value

    const confirmation = confirm("Confirma a escalação do jogador "+nameValue+"?")

    if(confirmation){
        teamList = document.getElementById('teamList')
        playerLi = document.createElement('li')
        playerLi.innerText = nameValue + " - " + positionValue + " - " + shirtValue
        playerLi.id = 'player-'+shirtValue
        teamList.appendChild(playerLi)
        
        document.getElementById('position').value = ''
        document.getElementById('name').value = ''
        document.getElementById('shirt').value = ''
    }
}

function removePlayer(){
    const numberToRemove = document.getElementById('removedPlayer').value 
    const playerToRemove = document.getElementById('player-'+numberToRemove)
    const confirmation = confirm("Confirma remoção? player-"+numberToRemove)
    if (confirmation){
        document.getElementById('teamList').removeChild(playerToRemove)
        document.getElementById('removedPlayer').value = ''
    }
}
