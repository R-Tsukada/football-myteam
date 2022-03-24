import { createApp } from 'vue'
import App from './team_select.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-league-list'
  if (document.querySelector(selector)) {
    createApp(App).mount(selector)
  }
})
