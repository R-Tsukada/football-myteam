import { createApp } from 'vue'
import App from './App.vue'
import { router } from './router/router.js'
import { store } from './store/store.js'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faUserSecret } from '@fortawesome/free-solid-svg-icons'

library.add(faUserSecret)

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-league-list'
  const app = document.querySelector(selector)
  if (app) {
    const app = createApp(App)
    app.use(router)
    app.use(store)
    app.component('font-awesome-icon', FontAwesomeIcon)
    app.config.productionTip = false
    app.mount(selector)
  }
})
