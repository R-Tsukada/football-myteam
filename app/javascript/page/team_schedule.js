import { createApp } from 'vue'
import App from './team_schedule.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-team-schedules'
  const app = document.querySelector(selector)
  if (app) {
    const app = createApp(App)
    app.mount(selector)
  }
})
