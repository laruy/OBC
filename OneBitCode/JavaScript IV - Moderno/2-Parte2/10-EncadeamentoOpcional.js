const user = {
    name: "John Doe",
    email: "doejohn@email.com",
    friends: [{
      name: "Mary",
      address: {
        street: "Some Street",
        number: 89
      }
    }],
    age: 42,
    phone: {
      countryCode: "+55",
      ddd: "22",
      number: "998765432"
    }
  }

console.log(user.friends[0].phone.ddd)
//error - cannot read propreties of undefined (reading 'ddd')

console.log(user?.friends[0]?.phone?.ddd)
//undefined

console.log(user.friends?.[5].name)
//valida se existe a posição do array