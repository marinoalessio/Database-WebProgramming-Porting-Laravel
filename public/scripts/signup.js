function fetchResponse(response) {
    if (!response.ok) return null;
    return response.json();
}

function checkName(event) {
    const input = event.currentTarget;
    const p = input.parentNode.querySelector('p')
    status[input.name] = false
    if(input.value.match(/^[A-Za-z'à-ù]+$/) && input.value.length > 0){
        p.classList.add("hidden")
        status[input.name] = true
    } else {
        p.classList.remove("hidden")
    }
    checkForm();
}

function checkUsername(event) {

    function jsonCheckUsername(json) {
        console.log
        const p = document.querySelector('.username p')
        if (status.username = !json.exists) {  
            p.classList.add('hidden')
        } else {
            p.textContent = "Username non disponibile";
            p.classList.remove('hidden');
        }
        checkForm();
    }

    const input = document.querySelector('input[name="username"]');
    const p = input.parentNode.querySelector('p')
    if(!input.value.match(/^[A-Za-z0-9à-ù_\-\.]{1,15}$/)){
        //primo controllo di validità
        p.textContent = "Puoi inserire solo lettere, numeri, punti e underscore. Massimo 15 caratteri";
        p.classList.remove('hidden')
        status.username = false;
        checkForm();
    } else {
        fetch("signup/checkUsername/"+encodeURIComponent(input.value)).then(fetchResponse).then(jsonCheckUsername);
    }    
}

function checkEmail(event) {

    function jsonCheckEmail(json) {
        const p = document.querySelector('.email p')
        if (status.email = !json.exists) {
            p.classList.add('hidden');
        } else {
            p.textContent = "Un account è già associato a questa email";
            p.classList.remove('hidden');
        }
        checkForm();
    }
    
    const email = String(document.querySelector('input[name="email"]').value.toLowerCase());
    const p = event.currentTarget.parentNode.querySelector('p')
    const validation = /^([A-Za-z0-9à-ù_\-\.])+\@([A-Za-z0-9à-ù_\-\.])+\.([A-Za-zà-ù]{2,4})$/;
    if(!email.match(validation)){
        p.textContent = "Email non valida";
        p.classList.remove('hidden');
        status.email = false;
        checkForm();
    } else {
        fetch("signup/checkEmail/"+encodeURIComponent(email)).then(fetchResponse).then(jsonCheckEmail);
    }
}

function checkPassword(event){
    const password = document.querySelector('input[name="password"]');
    const p = password.parentNode.querySelector('p')
    status.password = false
    const checkPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,20}$/
    if (password.value.match(checkPassword)) {
        p.classList.add('hidden')
        status.password = true
    } else {
        p.textContent = "La password deve contenere da 8 a 20 caratteri, almeno un numero, una lettera maiuscola e una minuscola";
        p.classList.remove('hidden')
    }
    const confirmPassword = document.querySelector('input[name="confirm_password"]')
    if(confirmPassword.value.length > 0) checkConfirmPassword()
    checkForm();
}

function checkConfirmPassword(event) {
    const confirmPassword = document.querySelector('input[name="confirm_password"]')
    const p = confirmPassword.parentNode.querySelector('p')
    status.confirmPassword = false;
    if (confirmPassword.value === document.querySelector('input[name="password"]').value) {
        status.confirmPassword = true;
        p.classList.add('hidden')
    } else {
        p.textContent = "Le password non coincidono";
        p.classList.remove('hidden')
    }
    checkForm();
}

function checkForm() {
    if(Object.values(status).includes(false) || 
    !document.querySelector('input[name="allow"]').checked || 
    Object.keys(status).length !== 6) document.getElementById('submit').disabled = true
    else document.getElementById('submit').disabled = false
}

const status = {};

document.querySelector('input[name="name"]').addEventListener('blur', checkName);
document.querySelector('input[name="surname"]').addEventListener('blur', checkName);
document.querySelector('input[name="username"]').addEventListener('blur', checkUsername);
document.querySelector('input[name="email"]').addEventListener('blur', checkEmail);
document.querySelector('input[name="password"]').addEventListener('blur', checkPassword);
document.querySelector('input[name="confirm_password"]').addEventListener('blur', checkConfirmPassword);

document.querySelector('input[name="allow"]').addEventListener('change', checkForm);
