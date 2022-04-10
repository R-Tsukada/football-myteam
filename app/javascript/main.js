import { createApp } from 'vue'
import App from './App.vue'
import { router } from './router/router.js'
import { store } from './store/store.js'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-league-list'
  const app = document.querySelector(selector)
  if (app) {
    const app = createApp(App)
    app.use(router)
    app.use(store)
    app.mount(selector)
  }
})
