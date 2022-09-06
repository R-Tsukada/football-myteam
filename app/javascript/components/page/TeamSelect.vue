<template>
  <div class="container">
    <h2
      class="has-text-centered is-size-2-tablet is-size-6-mobile has-text-weight-bold">
      応援しているチームを選んでください
    </h2>
    <div
      class="box team-select-description mt-3 mx-auto"
      v-if="!data.competitors.length">
      <p class="is-size-4-tablet has-text-centered has-text-weight-semibold">
        チーム選びの手順
      </p>
      <ol class="p-2 is-size-6-mobile has-text-centered">
        <li class="p-1">あなたが応援しているチームを選びます。</li>
        <li class="p-1">
          1で選んだのと同じリーグの中からライバルチームを選びます。
        </li>
        <li class="p-1">
          まずは応援しているチームが所属しているリーグを選んでください。
        </li>
      </ol>
    </div>
    <!-- box -->
    <div
      class="has-text-right is-size-6-tablet is-size-7-mobile has-text-weight-bold mt-3"
      v-else>
      <router-link to="/competitors">ライバルチームのみ変更する</router-link>
    </div>
    <LeagueListLoader v-if="!data.leagues.length" />
    <div v-else>
      <h3
        class="has-text-centered is-size-3 is-size-6-mobile has-text-weight-bold mt-3">
        リーグを選択
      </h3>
      <div class="tabs is-boxed is-fullwidth">
        <ul v-for="league in data.leagues" :key="league.id">
          <li
            @click="selectLeague(league)"
            v-bind:class="{
              'is-active': data.isChangeColorLeague === league.id
            }">
            <a>
              <img
                :src="league.logo"
                alt="league_name"
                class="image team-select-league-logo mr-2" />
              <p class="is-size-6 not-displayed-when-with-mobile-display">
                {{ league.name }}
              </p>
            </a>
          </li>
        </ul>
      </div>
      <!-- tabs -->
    </div>
    <!-- else -->
    <TeamListLoader v-if="!teamFilter.length" />
    <div v-else>
      <h3
        class="has-text-centered is-size-3 is-size-6-mobile has-text-weight-bold my-3">
        チームを選択
      </h3>
      <div class="columns is-mobile is-flex-wrap-wrap has-text-centered">
        <div
          class="column is-one-fifth-tablet is-one-third-mobile has-text-centered"
          v-for="team in teamFilter"
          :key="team.id">
          <div
            class="card has-hover-action select-button"
            @click="selectTeam(team)"
            v-bind:class="{
              'has-background-link-light is-selected':
                data.isChangeColorTeam === team.id
            }">
            <img :src="team.logo" class="image mx-auto team-logo" />
            <p
              class="has-text-weight-semibold mt-2 is-size-6-tablet is-size-7-mobile is-break-all"
              v-bind:class="{
                'has-text-weight-bold': data.isChangeColorTeam === team.id
              }">
              {{ team.name }}
            </p>
          </div>
          <!-- card -->
        </div>
        <!-- column -->
      </div>
      <!-- columns -->
    </div>
    <!-- v-else -->
    <div v-if="data.isChangeColorTeam" class="has-text-centered">
      <button class="color-button button is-rounded is-medium mt-6">
        <router-link
          to="/competitors"
          class="has-text-white is-size-4-tablet is-size-7-mobile"
          >応援しているチームを決定する</router-link
        >
      </button>
    </div>
    <!--has-text-centered -->
  </div>
  <!-- .container -->
</template>

<script>
import axios from 'axios'
import { reactive, onMounted, computed } from 'vue'
import LeagueListLoader from '../loader/LeagueListLoader'
import TeamListLoader from '../loader/TeamListLoader'

export default {
  components: {
    TeamListLoader,
    LeagueListLoader
  },
  setup() {
    const data = reactive({
      teams: [],
      leagues: [],
      leagueId: '',
      isShowing: false,
      isChangeColorLeague: '',
      isChangeColorTeam: '',
      competitors: ''
    })

    const setLeague = async () => {
      axios
        .get('/api/leagues')
        .then((response) => {
          data.leagues = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const setTeam = async () => {
      axios
        .get('/api/teams')
        .then((response) => {
          data.teams = response.data
        })
        .catch((error) => {
          console.log(error.message)
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
          data.competitors = response.data
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
