const dayjs = require("dayjs")

let birthday = dayjs('2003/05/20')
let date = dayjs()

let currentAge = date.diff(birthday, 'year')
console.log(`Idade no dia atual: ${currentAge}`)

let nextBirthday = birthday.add(currentAge, 'years')
if (date >= nextBirthday) {
    nextBirthday = nextBirthday.add(1,'years');
}
console.log(`Próximo aniversário: ${nextBirthday.format('DD/MM/YYYY')}`)

let daysToNextBirthday = nextBirthday.diff(date, 'day')
console.log(`Dias para o próximo aniversário: ${daysToNextBirthday}`)