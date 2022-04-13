import { createStore } from 'vuex'

export const store = createStore({
  state () {
    return {
      favoriteLeagueId: '',
      favoriteTeamId: [],
      competitorTeamId: []
    }
  },
  mutations: {
    increment (state, value) {
      state.favoriteTeamId = value
    },
    addLeague (state, value) {
      state.favoriteLeagueId = value
    },
    addCompetitor (state, value) {
      state.competitorTeamId.push(value)
    },
    deleteCompetitor (state, value) {
      state.competitorTeamId = state.competitorTeamId.filter(competitor => competitor !== value)
    }
  }
})
