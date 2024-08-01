const hitchedSpaceships = [
    ["Fênix", 8, true],
    ["Golias", 10, true],
    ["Helmet", 10, false],
    ["Elemental", 3, true],
    ["Darwin", 15, false]
]

let crewGreaterThan9 = hitchedSpaceships.filter(spaceship =>{
    return spaceship[1] > 9
}) .map(spaceship => {
    return spaceship[0]
})