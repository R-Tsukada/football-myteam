// document.addEventListener('DOMContentLoaded', () => {
//   // ナビゲーションバーガー（navbar-burgerクラスを持つすべての要素）を取得します。
//   const $navbarBurgers = document.querySelectorAll('.navbar-burger')
//   console.log($navbarBurgers)
//   // ナビゲーションバーガーがあるかどうかを確認します。
//   if ($navbarBurgers.length > 0) {
//     // すべてのナビゲーションバーガーをループします。
//     $navbarBurgers.forEach(el => {
//       // ナビゲーションバーガーにクリックイベントを追加します。
//       el.addEventListener('click', () => {
//         // ナビゲーションバーガーのdata-target属性の値を取得します。
//         const target = el.dataset.target
//         // メニュー（data-target属性の値をIDとして持つ要素）を取得します。
//         const $target = document.getElementById(target)
//         // ナビゲーションバーガーでis-activeクラスを切り替えます。
//         el.classList.toggle('is-active')
//         // メニューでis-activeクラスを切り替えます。
//         $target.classList.toggle('is-active')
//       })
//     })
//   }
// })

document.addEventListener('DOMContentLoaded', () => {
  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(
    document.querySelectorAll('.navbar-burger'),
    0
  )

  // Add a click event on each of them
  $navbarBurgers.forEach((el) => {
    el.addEventListener('click', () => {
      // Get the target from the "data-target" attribute
      const target = el.dataset.target
      const $target = document.getElementById(target)
      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      el.classList.toggle('is-active')
      $target.classList.toggle('is-active')
    })
  })
})
