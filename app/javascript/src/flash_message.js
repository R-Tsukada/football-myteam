document.addEventListener('DOMContentLoaded', () => {
  const $flash = document.querySelectorAll('#flash')
  $flash.forEach((flash) => {
    function timeOut(targetId) {
      targetId.classList.toggle('flash-none-display')
    }
    setTimeout(() => {
      timeOut(flash)
    }, 5000)
  })
})
