let x, y, mult, div, sub, sum;

x = parseFloat(window.prompt("Informe um valor para X"));
y = parseFloat(window.prompt("Informe um valor para Y"));

mult = x * y;
div = x / y;
sub = x - y;
sum = x + y;

console.log(mult);
console.log(div);
console.log(sub);
console.log(sum);

alert(
    "Resultados:\n"+
    "Soma: " + sum+
    "\nSubtração: " + sub+
    "\nMultiplicação: "+ mult+
    "\nDivisão: "+div
)