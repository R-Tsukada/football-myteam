import { createApp } from 'vue'
import App from './competitor_team_select.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-competitors-select'
  const app = document.querySelector(selector)
  if (app) {
    const app = createApp(App)
    app.mount(selector)
  }
})
