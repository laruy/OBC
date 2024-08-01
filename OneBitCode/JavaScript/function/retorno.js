function calcularMedia(a,b){
    const media = (a + b)
    return media
}

const resultado = calcularMedia(2,2)
console.log(resultado)
//----------------------------------------------------------------------------------------------
function criarProduto (nome, preco){
    const produto = {
        nome, //nome: nome
        preco,
        estoque: 1
    }
        return produto
}

console.log(notebook = criarProduto("Notebook Intel Core i3 8GB", 5000))
//----------------------------------------------------------------------------------------------
function areaRetangular(base, altura){
    const area = base * altura
    return area
}

function areaQuadrada(lado){
    return areaRetangular(lado, lado)
}

console.log(areaRetangular(2,3))
//----------------------------------------------------------------------------------------------
function ola(){
    let texto = "..."
    return texto
    texto = "Olá mundo!" //código inalcansável
    console.log(texto) 
}

console.log(ola())
//----------------------------------------------------------------------------------------------
function maioridade(idade){
    if(idade >= 18){
        return "Maior de idade"
    }else{
        return "Menor de idade"
    }
}

console.log(maioridade(19))