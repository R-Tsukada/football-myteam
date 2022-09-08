<template>
  <div>
    <h3
      class="has-text-centered is-size-3 is-size-6-mobile has-text-weight-bold mt-3">
      リーグを選択
    </h3>
    <section>
      <LeagueListLoader v-if="!data.leagues.length" />
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
                :alt="league.name"
                class="image team-select-league-logo mr-2" />
              <p class="is-size-6 not-displayed-when-with-mobile-display">
                {{ league.name }}
              </p>
            </a>
          </li>
        </ul>
      </div>
      <!-- tabs -->
    </section>
    <h3
      class="has-text-centered is-size-3 is-size-6-mobile has-text-weight-bold my-3">
      チームを選択
    </h3>
    <section>
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
            <img
              :src="team.logo"
              :alt="team.name"
              class="image mx-auto team-logo" />
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
    </section>
    <FavoriteSelectButton :isChangeColorTeam="data.isChangeColorTeam" />
  </div>
</template>
<script>
import { reactive, onMounted, computed } from 'vue'
import axios from 'axios'
import LeagueListLoader from '../loader/LeagueListLoader.vue'
import FavoriteSelectButton from '../Molecules/BooleanButton/FavoriteSelectButton.vue'

export default {
  components: {
    LeagueListLoader,
    FavoriteSelectButton
  },
  setup() {
    const data = reactive({
      leagues: [],
      teams: [],
      isChangeColorLeague: '',
      isChangeColorTeam: ''
    })

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

    onMounted(setFavorite(), setTeam(), setLeague())

    return {
      data,
      selectLeague,
      teamFilter,
      selectTeam,
      addFavoriteTeam
    }
  }
}
</script>
