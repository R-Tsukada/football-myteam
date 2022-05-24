<template>
  <div class="container">
    <div
      v-if="data.competitors"
      class="has-text-right mr-5 mb-5 is-size-5 has-text-weight-bold">
      <router-link to="/competitors"> ライバルチームのみ変更する </router-link>
    </div>
    <div v-else>
      <p class="is-size-4 has-text-centered has-text-weight-bold mt-5">
        あなたが応援しているチームを選びます。そのあとに同じリーグの中からライバルチームを選びます。
      </p>
      <p class="is-size-4 has-text-centered has-text-weight-bold my-5">
        まずは応援しているチームが所属しているチームを選んでください
      </p>
    </div>
    <p class="has-text-centered is-size-3 my-6 has-text-weight-bold">リーグ一覧</p>
    <div class="columns is-mobile is-flex-wrap-wrap has-text-centered">
      <div class="column is-one-quarter has-text-centered" v-for="league in data.leagues" :key="league.id">
        <div class="card m-1">
          <div class="card-content"
               @click="selectLeague(league)"
               v-bind:class="{
            'has-background-link-light': data.isChangeColorLeague === league.id
          }">
            <div class="content">
              <img :src="league.logo" class="image is-128x128 mx-auto" />
              <p
                  class="has-text-weight-semibold mt-2"
                  v-bind:class="{
                'has-text-weight-bold': data.isChangeColorLeague === league.id
              }">
                {{ league.name }}
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="columns is-mobile is-flex-wrap-wrap has-text-centered">
      <div class="column is-one-fifth has-text-centered" v-for="team in teamFilter" :key="team.id">
        <div class="card m-1">
          <div class="card-content"
               @click="selectTeam(team)"
               v-bind:class="{
            'has-background-link-light': data.isChangeColorTeam === team.id
          }">
            <div class="content">
              <img :src="team.logo" class="image is-128x128 mx-auto" />
              <p
                  class="has-text-weight-semibold mt-2"
                  v-bind:class="{
                'has-text-weight-bold': data.isChangeColorTeam === team.id
              }">
                {{ team.name }}
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-if="data.isChangeColorTeam" class="has-text-centered">
      <button
        class="button is-rounded is-medium mt-6"
        style="background-color: #6246ea">
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
      leagues:[],
      leagueId: '',
      isShowing: false,
      isChangeColorLeague: '',
      isChangeColorTeam: '',
      competitors: ''
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

    const setCompetitors = async () => {
      axios
        .get('/api/competitors')
        .then((response) => {
          data.isChangeColorTeam = response.data
        })
        .catch((error) => {
          console.log(error.message)
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
      addFavoriteTeam(team)
    }

    const addFavoriteTeam = async (team) => {
      axios.post('api/favorites', {
        id: team.id
      })
    }

    onMounted(setLeague(), setTeam(), setFavorite(), setCompetitors())

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
<style>
.card:hover {
  cursor: pointer;
  opacity: 0.6;
}
</style>
