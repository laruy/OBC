const player1 = document.getElementById('player1');
const player2 = document.getElementById('player2');
const winner  = document.getElementById('currentPlayer'); 
let countRounds = 0;
let checkTie = true;

function setBoard(activateBoard){
    arr_spots.forEach(function(spotId){
        const spot = document.getElementById(spotId);
        if (activateBoard){
            spot.style.opacity = '1';
            spot.style.pointerEvents = 'initial';
            spot.innerText = "-"
            spot.style.backgroundColor = 'rgb(192, 146, 236)'
        }else{
            spot.style.pointerEvents = 'none';
            spot.style.opacity = '0.5';
        }

    })
}

function highligthCurrentPlayer(currentPlayer, player){
    currentPlayer.style.backgroundColor = 'rgb(192, 146, 236)';
    currentPlayer.style.padding = '6px';
    player.style.padding = '1px 2px 1px 2px';
    player.style.backgroundColor = 'rgb(42, 14, 68)'
}

//Inicia o jogo
document.getElementById('gameStart').addEventListener('click', function(){

    //Recebe o nome dos jogadores e informa nos campos para dar início ao jogo
    const inputPlayer1 = document.getElementById('inputPlayer1')
    const inputPlayer2 = document.getElementById('inputPlayer2')

    winner.innerText = "Tic - Tac - Toe"

    if (inputPlayer1.value.length < 1 || inputPlayer2.value.length < 1) {
        inputPlayer1.style.backgroundColor = "rgb(185, 70, 70)";
        inputPlayer2.style.backgroundColor = "rgb(185, 70, 70)";
        return
    }

    player1.value = inputPlayer1.value;
    player2.value = inputPlayer2.value;

    //Limpa campos de inserir nomes
    inputPlayer1.style.backgroundColor = "white";
    inputPlayer2.style.backgroundColor = "white";
    inputPlayer1.value = ""
    inputPlayer2.value = ""

    highligthCurrentPlayer(player1, player2)

    //Libera o tabuleiro do jogo
    setBoard(true);
});


//Itera sobre os campos do quadro do jogo para adicionar o evento de click 
const arr_spots = ['spot1', 'spot2', 'spot3', 'spot4', 'spot5', 'spot6', 'spot7', 'spot8', 'spot9'];

var currentPlayer = true;

arr_spots.forEach(function (spotId) {
    const spot = document.getElementById(spotId);

    spot.addEventListener('click', function () {
        countRounds++;
        this.innerText = currentPlayer ? 'X' : 'O';
        this.style.opacity = '0.5';
        this.style.pointerEvents = 'none';

        highligthCurrentPlayer(currentPlayer ? player2 : player1, currentPlayer ? player1 : player2);
        winnerCheck();

        console.log(countRounds)

        if (countRounds === 9 && checkTie) {
            setBoard(false);
            winner.innerText = "Empate";
            return
        }

        currentPlayer = !currentPlayer; // Alternar jogador
    });
});

function highligthWinner(spot1, spot2, spot3){

    if (currentPlayer){
        winner.innerText = player1.value
    }else{
        winner.innerText = player2.value
    }

    player1.style.backgroundColor = 'rgb(42, 14, 68)';
    player2.style.backgroundColor = 'rgb(42, 14, 68)';

    spot1.style.backgroundColor = 'blue';
    spot2.style.backgroundColor = 'blue';
    spot3.style.backgroundColor = 'blue';

    setBoard(false);

    spot1.style.opacity = 1;
    spot2.style.opacity = 1;
    spot3.style.opacity = 1;
    
}

function checkColumns(index1, index2, index3){

    spot1 = document.getElementById(arr_spots[index1]);
    spot2 = document.getElementById(arr_spots[index2]);
    spot3 = document.getElementById(arr_spots[index3]);

    if (spot1.innerText === "X" || spot1.innerText === "O") {
        if (spot1.innerText === spot2.innerText && spot1.innerText === spot3.innerText) {
            highligthWinner(spot1, spot2, spot3);
            checkTie = false
        }
    }
}

function winnerCheck() {

    // Verificação das colunas
    for (let i = 0; i <= 6; i += 3) {
        checkColumns(i, i+1, i+2);
    }

    // Verificação das linhas
    for (let i = 0; i < 3; i++) {
        checkColumns(i, i+3, i+6);
    }

    // Verificação da diagonal principal
    checkColumns(0, 4, 8);

    // Verificação da diagonal secundária
    checkColumns(2, 4, 6);
}