import { createStore } from 'vuex'
import createPersistedState from 'vuex-persistedstate'

export const store = createStore({
  state() {
    return {
      favoriteLeagueId: '',
      favoriteTeamId: [],
      competitorTeamId: [],
      isShowingMessage: true,
      scheduleParams: ''
    }
  },
  mutations: {
    increment(state, value) {
      state.favoriteTeamId = value
    },
    addLeague(state, value) {
      state.favoriteLeagueId = value
    },
    addCompetitor(state, value) {
      state.competitorTeamId.push(value)
    },
    deleteCompetitor(state, value) {
      state.competitorTeamId = state.competitorTeamId.filter(
        (competitor) => competitor !== value
      )
    },
    closeMessage(state) {
      state.isShowingMessage = false
    },
    openMessage(state) {
      state.isShowingMessage = true
    },
    addShedulesParams(state, value) {
      state.scheduleParams = value
    }
  },
  plugins: [createPersistedState()]
})
