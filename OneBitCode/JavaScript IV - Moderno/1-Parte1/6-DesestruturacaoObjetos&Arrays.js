// desestruturação de objetos

const person = {
    name: "luke",
    job: "farmer",
    parents: ["anakin, padme"]
}

const name = person.name

const { job, parents } = person

// desestruturação de array

const [father, mother] = parents

function createUser({name, job, parents}){
    const id = math.floor(math.random() * 9999)
    return {
        id,
        name,
        job,
        parents
    }
}

const luke = createUser(person)