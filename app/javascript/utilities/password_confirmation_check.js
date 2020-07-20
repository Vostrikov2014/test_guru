document.addEventListener('turbolinks:load', function() {
    let password = document.querySelector('#user_password')
    let passwordConfirmation = document.querySelector('#user_password_confirmation')

    if (password && passwordConfirmation) {
        password.addEventListener('keyup', comparePasswords)
        passwordConfirmation.addEventListener('keyup', comparePasswords)
    }
})

function comparePasswords() {
    let password = document.querySelector('#user_password')
    let passwordConfirmation = document.querySelector('#user_password_confirmation')
    let icon = document.querySelector('.octicon-verified')

    if (password.value === "" || passwordConfirmation.value === "") {
        icon.classList.add('hide')
        return
    }

    if (password.value == passwordConfirmation.value) {
        icon.classList.add('accept-icon')
        icon.classList.remove('error-icon')
    } else {
        icon.classList.add('error-icon')
        icon.classList.remove('accept-icon')
    }

    icon.classList.remove('hide')
}
