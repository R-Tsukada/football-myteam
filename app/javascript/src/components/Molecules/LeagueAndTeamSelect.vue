<template>
  <div>
    <h3
      class="has-text-centered is-size-3 is-size-6-mobile has-text-weight-bold mt-3 mb-5"
    >
      リーグを選択
    </h3>
    <section>
      <LeagueListLoader v-if="!data.leagues.length" />
      <LeagueList
        :leagues="data.leagues"
        :selectedLeague="data.selectedLeague"
        @selectLeague="selectLeague"
      />
    </section>
    <h3
      class="has-text-centered is-size-3 is-size-6-mobile has-text-weight-bold my-3"
    >
      チームを選択
    </h3>
    <section>
      <TeamList
        :teamFilter="teamFilter"
        :selectedTeam="data.selectedTeam"
        @selectTeam="selectTeam"
      />
    </section>
    <FavoriteSelectButton :selectedTeam="data.selectedTeam" />
  </div>
</template>
<script>
import { reactive, onMounted, computed } from 'vue'
import axios from 'axios'
import LeagueListLoader from '../atoms/loader/LeagueListLoader.vue'
import FavoriteSelectButton from '../Molecules/BooleanButton/FavoriteSelectButton.vue'
import LeagueList from '../Organism/LeagueList.vue'
import TeamList from '../Organism/TeamList.vue'

export default {
  components: {
    LeagueListLoader,
    FavoriteSelectButton,
    LeagueList,
    TeamList
  },
  setup() {
    const data = reactive({
      leagues: [],
      teams: [],
      selectedLeague: '',
      selectedTeam: ''
    })

    const setFavorite = async () => {
      axios
        .get('/api/favorites')
        .then((response) => {
          data.selectedTeam = response.data.team['id']
          data.selectedLeague = response.data.team['league_id']
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

    const teamFilter = computed(() => {
      const number = data.selectedLeague
      return data.teams.filter(function (value) {
        return value.league_id === number
      })
    })

    const selectTeam = (...args) => {
      data.selectedTeam === args[0]
        ? (data.selectedTeam = '')
        : (data.selectedTeam = args[0])
      addFavoriteTeam(args[0])
    }

    const addFavoriteTeam = async (team) => {
      axios.post('api/favorites', {
        id: team
      })
    }

    const selectLeague = (...args) => {
      data.selectedLeague === args[0]
        ? (data.selectedLeague = '')
        : (data.selectedLeague = args[0])
    }

    onMounted(setFavorite(), setTeam(), setLeague())

    return {
      data,
      teamFilter,
      selectTeam,
      addFavoriteTeam,
      selectLeague
    }
  }
}
</script>
