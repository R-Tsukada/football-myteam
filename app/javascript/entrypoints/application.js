import Rails from '@rails/ujs'
import '../src/head.js'
import '../src/flash_message.js'
import './application.scss'
import * as ActiveStorage from '@rails/activestorage'
import { createApp } from 'vue'
import App from '../src/App.vue'
import { router } from '../src/router/router.js'
import { store } from '../src/store/store.js'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faUserSecret } from '@fortawesome/free-solid-svg-icons'

library.add(faUserSecret)

Rails.start()
ActiveStorage.start()

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
