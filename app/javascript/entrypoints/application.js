// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log(
  'Visit the guide for more information: ',
  'https://vite-ruby.netlify.app/guide/rails'
)

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'
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
