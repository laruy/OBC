const form = document.getElementById('devForm')
const addTech_Button = document.getElementById('addTech')

addTech_Button.addEventListener('submmit' , function(ev){

    //método para evitar que a página seja recarregada
    ev.preventDefault()

    //Seleciona a section onde o formulário de adicionar tecnologia será criado
    const newTechForm = document.getElementById('newTech')
    
    //Label e input "Nome da tecnologia"
    const nameTech_Label     = document.createElement('label')
    nameTech_Label.innerText = "Nome da tecnologia: "
    const nameTech_Input     = document.createElement('input')
    nameTech_Input.type      = 'text'
    nameTech_Input.name      = "nameTech"

    //Labels e inputs tipo radio para "Tempo de experiência"
    const experience1_Label     = document.createElement('label')
    experience1_Label.innerText = "0-2 anos  "
    const experience1_Input     = document.createElement('input')
    experience1_Input.type      = 'radio'
    experience1_Input.name      = "experiece"

    const experience2_Label     = document.createElement('label')
    experience2_Label.innerText = "2-5 anos  "
    const experience2_Input     = document.createElement('input')
    experience2_Input.type      = 'radio'
    experience2_Input.name      = "experiece"

    const experience3_Label     = document.createElement('label')
    experience3_Label.innerText = "5-10 anos"
    const experience3_Input     = document.createElement('input')
    experience3_Input.type      = 'radio'
    experience3_Input.name      = "experiece"

    const br = document.createElement('br')

    //Adiciona os labels e inputs criados na section "newTechForm"
    newTechForm.append(nameTech_Label, nameTech_Input,
                      experience1_Input, experience1_Label, 
                      experience2_Input, experience2_Label, 
                      experience3_Input, experience3_Label,  br)
})


