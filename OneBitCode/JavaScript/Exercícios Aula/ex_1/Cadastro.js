let nome, sobrenome, estudo, anoNasc;

nome = window.prompt("Informe o seu nome");
sobrenome = window.prompt("Informe seu sobrenome");
estudo = window.prompt("Qual sua área de estudo?");
anoNasc = window.prompt("Qual seu ano de nascimento?");

console.log(nome, sobrenome);
console.log(estudo, anoNasc);

alert(
  "Recruta cadastrado com sucesso! \n" +
    "Nome completo: " +nome +" " +sobrenome +
    "\nCampo de estudo: " +estudo +
    "\nIdade: " +(2023 - anoNasc)
);
