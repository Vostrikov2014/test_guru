document.addEventListener('turbolinks:load', function() {
    let progress = document.querySelector('.progress')
    let progressBar = document.querySelector('.progress-bar')

    if (progress) {
        let rate = progress.dataset.testProgress
        progressBar.style.width = rate + "%"
    }
})
