<template>
  <div class="has-text-centered">
    <div v-if="data.isChangeColorTeam.length === 0">
      <p class="is-size-4 has-text-weight-bold mt-5">
        あなたが応援しているチームを選びます。そのあとに同じリーグの中からライバルチームを選びます。
      </p>
      <p class="is-size-4 has-text-weight-bold my-5">
        まずは応援しているチームが所属しているチームを選んでください
      </p>
    </div>
    <div v-else class="has-text-right mr-5 mb-5 is-size-5 has-text-weight-bold">
      <router-link to="/competitors"> ライバルチームのみ変更する </router-link>
    </div>
    <div class="container">
      <ul v-for="league in data.leagues" :key="league.id">
        <li
          class="mt-5 mx-6 p-2"
          @click="selectLeague(league)"
          v-bind:class="{
            'has-background-link-light': data.isChangeColorLeague === league.id
          }">
          <img :src="league.logo" class="image is-128x128" />
          <p
            class="has-text-weight-semibold"
            v-bind:class="{
              'has-text-weight-bold has-text-danger':
                data.isChangeColorLeague === league.id
            }">
            {{ league.name }}
          </p>
        </li>
      </ul>
    </div>
    <div class="container">
      <ul v-for="team in teamFilter" :key="team.id">
        <li
          class="mt-5 mx-6 p-2"
          @click="selectTeam(team)"
          v-bind:class="{
            'has-background-link-light': data.isChangeColorTeam === team.id
          }">
          <img :src="team.logo" class="image is-128x128" />
          <p
            class="has-text-weight-semibold"
            v-bind:class="{
              'has-text-weight-bold has-text-danger':
                data.isChangeColorTeam === team.id
            }">
            {{ team.name }}
          </p>
        </li>
      </ul>
    </div>
    <div v-if="data.isChangeColorTeam">
      <button
        class="button is-link is-rounded m-3 is-medium mt-5"
        @click="addFavoriteTeam">
        <router-link to="/competitors" class="has-text-white"
          >応援しているチームを決定する</router-link
        >
      </button>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { reactive, onMounted, computed } from 'vue'

export default {
  setup() {
    const data = reactive({
      teams: [],
      leagueId: '',
      isShowing: false,
      isChangeColorLeague: '',
      isChangeColorTeam: ''
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

    const setFavorite = async () => {
      axios
        .get('/api/favorites')
        .then((response) => {
          data.isChangeColorTeam = response.data.team['id']
          data.isChangeColorLeague = response.data.team['league_id']
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const addFavoriteTeam = async () => {
      axios.post('api/favorites', {
        id: data.isChangeColorTeam
      })
    }

    const selectLeague = (league) => {
      data.isChangeColorLeague === league.id
        ? (data.isChangeColorLeague = '')
        : (data.isChangeColorLeague = league.id)
    }

    const teamFilter = computed(() => {
      const number = data.isChangeColorLeague
      return data.teams.filter(function (value) {
        return value.league_id === number
      })
    })

    const selectTeam = (team) => {
      data.isChangeColorTeam === team.id
        ? (data.isChangeColorTeam = '')
        : (data.isChangeColorTeam = team.id)
    }

    onMounted(setLeague(), setTeam(), setFavorite())

    return {
      data,
      selectLeague,
      teamFilter,
      selectTeam,
      addFavoriteTeam,
      setFavorite
    }
  }
}
</script>

<style scoped>
.container {
  display: flex;
  flex-wrap: wrap;
  align-items: stretch;
  justify-content: center;
}

.container ul {
  list-style: none;
}

.container li {
  border: solid 1px;
}
</style>
