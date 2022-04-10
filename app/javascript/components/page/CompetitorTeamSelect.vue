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
      class="button"
      v-if="data.isAdding"
      @click="addCompetitorTeams">
      ライバルチームとして登録する
    </button>
    <br>
    <button class="button"><router-link to="/">応援しているチームを選び直す</router-link></button>
    <br>
    <button class="button"><router-link to="/schedules">ライバルチームの選択を終了する</router-link></button>
  </div>
</template>

<script>
import axios from 'axios'
import { createStore } from 'vuex'
import { reactive, onMounted, computed } from 'vue'

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
  setup() {
    const data = reactive({
      teams: [],
      favorite: '',
      isAdding: true
    })

    const setTeam = async () => {
      axios.get('/api/competitors').then((response) => {
        data.teams = response.data
      })
    }

    const setFavoriteTeam = async () => {
      axios.get('/api/favorites').then((response) => {
        data.favorite = response.data
      })
    }

    const addCompetitorTeams = async () => {
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
    }

    const selectTeam =  async (team) => {
      store.commit('increment', team.id)
    }

    const teamFilter = computed(() => {
      const number = data.favorite.id
      return data.teams.filter(function (value) {
        return value.id != number
      })
    })

    onMounted(() => {
      setTeam(),
      setFavoriteTeam()
    })

    return {
      data,
      setTeam,
      setFavoriteTeam,
      addCompetitorTeams,
      selectTeam,
      teamFilter,
      store
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
