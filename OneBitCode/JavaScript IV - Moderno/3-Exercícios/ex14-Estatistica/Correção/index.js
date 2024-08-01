const average = (...numbers) => {
    const sum = numbers.reduce((accum, num) => accum + num, 0);
    return sum/numbers.length;
}

const weightedAverage = (...entries) => {
    const sum = entries.reduce((accum, {number, weight}) => accum + (number * weight ?? 1)) 
    const weightSum = entries.reduce((accum, entry) => accum + entry.weight, 0)
    return sum/weightSum
}

const median = (...numbers) => {
    const orderedNumbers = [...numbers].sort((a,b) => a-b);
    const middle = Math.floor(orderedNumbers.length/2)
    if (orderedNumbers.length % 2 !== 0){
        return orderedNumbers[middle]
    }
    const firstMedian = orderedNumbers[middle - 1]
    const secondMedian = orderedNumbers[middle]
    return average(firstMedian, secondMedian)
}

const mode = (...numbers) => {
    //[[n],[qtd]]
    const quantities = numbers.map(num => [
        num,
        numbers.filter(n => num === n).length
    ])
    quantities.sort((a,b) => b[1] - a[1])
    return quantities[0][0]
}