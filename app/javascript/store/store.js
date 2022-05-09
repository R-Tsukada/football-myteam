import { createStore } from 'vuex'

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
  }
})
