let valor = prompt("Informe um valor em metros.")
const unidadeMedida = prompt("Informe a unidade de medida para qual deseja converter o valor:")

switch (unidadeMedida) {
    case "mm":
        valor *= 1000
        break;
    case "cm":
        valor *= 100
        break;
    case "dm":
        valor *= 10
        break;
    case "dam":
        valor /= 10
        break;
    case "hm":
        valor /= 100
        break;
    case "km":
        valor /= 1000
        break;
    default:
        alert("Opção inválida!")
}

alert(valor)

