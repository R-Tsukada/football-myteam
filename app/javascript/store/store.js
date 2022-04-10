import { createStore } from 'vuex'

export const store = createStore({
  state() {
    return {
      favoriteTeamId: '',
      competitorTeamId: ''
    }
  },
  mutations: {
    increment(state, value) {
      state.favoriteTeamId = value
    },
    addCompetitor(state, value) {
      state.competitorTeamId = value
    }
  }
})
