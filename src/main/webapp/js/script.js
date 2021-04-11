
window.onload = () => {
    let colorBackground = (localStorage.getItem('colorBackground') == null) ? '#A4AABE' : localStorage.getItem('colorBackground')
    this.document.body.style.backgroundColor = colorBackground
    /*const buttom = document.querySelectorAll('.btn-light');
    buttom.forEach(element => {
        element.style.backgroundColor = colorBackground
    });*/
    let div = document.getElementById('circles-color5')
    div.style.backgroundColor = colorBackground
    div.title = `Random color (${colorBackground})`
}

function insertTask() {

    let task = document.getElementById(`new-task`).value
    if (task.length > 255) {
        window.alert("Insira uma task com no máximo 255 caracteres!")
    }
}

function deleteTask() {
    window.alert("Tarefa deletada com sucesso!")
}

function checkboxClick(id) {
    let checkbox = document.getElementById(`checkbox${id}`)
    let li = document.getElementById(`id-task${id}`)
    if (checkbox.checked == true) {
        li.className = `list-group-item list-group-item-action list-group-item-success`
    } else if (checkbox.checked == false) {
        li.className = `list-group-item list-group-item-action`
    }
}

function colorGenerator() {
    let hex = '0123456789ABCDEF';
    let color = '#';

    for (let i = 0; i < 6; i++) {
        color += hex[Math.floor(Math.random() * 16)];
    }
    return color;
}

function Color0() {
    let color = '#A993BF'
    setColor(color)
}

function Color1() {
    let color = '#6A36D9'
    setColor(color)
}

function Color2() {
    let color = '#762EA6'
    setColor(color)
}

function Color3() {
    let color = '#5B2A8C'
    setColor(color)
}

function Color4() {
    let color = '#A4AABE'
    setColor(color)
}

function Color5() {
    let color = colorGenerator()
    document.body.style.backgroundColor = color
    let div = document.getElementById('circles-color5')
    div.style.backgroundColor = color
    /*const buttom = document.querySelectorAll('.btn-light');
    buttom.forEach(element => {
        element.style.backgroundColor = color
    });*/
    div.title = `Random color (${color})`
    localStorage.setItem('colorBackground', color)
}

function setColor(color) {
    document.body.style.backgroundColor = color
    localStorage.setItem('colorBackground', color)
    /*const buttom = document.querySelectorAll('.btn-light');
    buttom.forEach(element => {
        element.style.backgroundColor = color
    });*/
}