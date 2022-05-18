document.addEventListener('DOMContentLoaded', () => {
  const askButton = document.getElementById('ask-button')
  const askForm = document.getElementById('ask-form')

  if (askButton) {
    askButton.addEventListener('click', (event) => {
      event.preventDefault()

      setTimeout(() => {
        const displayStyle = askForm.style.display === 'block' ? 'none' : 'block'
        askForm.style.display = displayStyle
      }, 300)
    })
  }
})
