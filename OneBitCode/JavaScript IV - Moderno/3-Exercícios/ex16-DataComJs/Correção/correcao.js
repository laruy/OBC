const dayjs = require("dayjs")

function birthday(date) { 
    const birthday = dayjs(date)
    const today = dayjs()

    const ageInYears = today.diff(birthday, 'year')
    console.log(`Idade: ${ageInYears}`)

    const nextBirthday = birthday.add(ageInYears + 1, 'year')
    console.log(`Próximo aniversário: ${nextBirthday.format('DD/MM/YYYY')}`)

    const daysToNextBirthday = nextBirthday.diff(today, 'day') + 1
    console.log(`Dias até completar ${ageInYears + 1} anos: ${daysToNextBirthday}`)
}

birthday("1995-09-02")