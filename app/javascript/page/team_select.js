import { createApp } from 'vue'
import App from './team_select.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-league-list'
  const app = document.querySelector(selector)
  if (app) {
    const app = createApp(App)
    app.mount(selector)
  }
})
