<template>
  <div class="main">
    <div class="container">
      <ul v-for="team in teamFilter" :key="team.id">
        <li @click="selectTeam(team)">
          <p>{{ team.name }}</p>
          <img :src="team.logo" />
        </li>
      </ul>
    </div>
    <button
      class="add_favorite_team"
      v-if="isAdding"
      @click="addCompetitorTeams">
      ライバルチームとして登録する
    </button>
  </div>
</template>

<script>
import axios from 'axios'
import { createStore } from 'vuex'

const store = createStore({
  state() {
    return {
      teamId: []
    }
  },
  mutations: {
    increment(state, value) {
      state.teamId = value
    }
  }
})

export default {
  data() {
    return {
      teams: [],
      favorite: '',
      isAdding: true
    }
  },
  methods: {
    setTeam: function () {
      axios.get('/api/competitors').then((response) => {
        this.teams = response.data
      })
    },
    setFavoriteTeam: function () {
      axios.get('/api/favorites').then((response) => {
        this.favorite = response.data
      })
    },
    addCompetitorTeams: function () {
      axios
        .post('/api/competitors', {
          id: store.state.teamId
        })
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    selectTeam: function (team) {
      store.commit('increment', team.id)
    }
  },
  computed: {
    teamFilter() {
      const number = this.favorite.id
      return this.teams.filter(function (value) {
        return value.id != number
      })
    }
  },
  mounted() {
    this.setTeam()
    this.setFavoriteTeam()
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
