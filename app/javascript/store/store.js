import { createStore } from 'vuex'
import createPersistedState from 'vuex-persistedstate'

export const store = createStore({
  state() {
    return {
      teamId: ''
    }
  },
  mutations: {
    teamId(state, value) {
      state.teamId = value
    }
  },
  plugins: [createPersistedState({ storage: window.sessionStorage })]
})
