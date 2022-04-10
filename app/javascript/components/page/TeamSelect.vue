<template>
  <div class="main">
    <div class="container">
      <ul v-for="league in data.leagues" :key="league.id">
        <li @click="selectLeague(league)">
          <img :src="league.logo" class="logo_image" />
          <p>{{ league.name }}</p>
        </li>
      </ul>
    </div>
    <div class="container">
      <ul v-for="team in teamFilter" :key="team.id">
        <li @click="selectTeam(team)">
          <img :src="team.logo" class="team_logo_image" />
          <p>{{ team.name }}</p>
        </li>
      </ul>
    </div>
    <button class="button" v-if="data.isShowing" @click="addFavoriteTeam">
      応援しているチームを決定する
    </button>
    <br />
    <button class="button">
      <router-link to="/competitors">ライバルチームを決める</router-link>
    </button>
  </div>
</template>

<script>
import axios from 'axios'
import { createStore } from 'vuex'
import { reactive, onMounted, computed } from 'vue'

const store = createStore({
  state() {
    return {
      teamId: ''
    }
  },

  mutations: {
    increment(state, value) {
      state.teamId = value
    }
  }
})

export default {
  setup() {
    const data = reactive({
      leagues: [],
      teams: [],
      leagueId: '',
      isShowing: false
    })

    const setLeague = async () => {
      axios.get('/api/leagues').then((response) => {
        data.leagues = response.data
      })
    }

    const setTeam = async () => {
      axios.get('/api/teams').then((response) => {
        data.teams = response.data
      })
    }

    const addFavoriteTeam = async () => {
      axios.post('api/favorites', {
        id: store.state.teamId
      })
    }

    const selectLeague = (league) => {
      data.leagueId = league.id
    }

    const teamFilter = computed(() => {
      const number = data.leagueId
      return data.teams.filter(function (value) {
        return value.league_id === number
      })
    })

    const selectTeam = (team) => {
      store.state.teamId = team.id
      data.isShowing = true
    }

    onMounted(setLeague(), setTeam())

    return {
      store,
      data,
      setLeague,
      setTeam,
      selectLeague,
      teamFilter,
      selectTeam,
      addFavoriteTeam
    }
  }
}
</script>

<style scoped>
.main {
  text-align: center;
}

.container {
  display: flex;
  flex-wrap: wrap;
  align-items: stretch;
  justify-content: center;
}

ul {
  list-style: none;
}

li {
  border: solid 1px;
  border-radius: 8px;
  padding: 5px;
  text-align: center;
}

p {
  font-weight: bold;
}
</style>
