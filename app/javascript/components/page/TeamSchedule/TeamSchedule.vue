<template>
  <div class="container">
    <h2 class="is-size-2 has-text-weight-bold pb-6">リーグ戦情報</h2>
    <table
      class="table is-stripe is-hoverable is-clickable has-text-weight-bold is-size-5">
      <thead>
        <tr>
          <th>順位</th>
          <th>チーム</th>
          <th>勝点<br />(勝ち点差)</th>
          <th>試合数<br />(残り試合数)</th>
          <th>次節以降の試合</th>
        </tr>
      </thead>
      <tbody>
        <FavoriteTeamTable
          :standings="data.favoriteTeams"
          :matchSchedules="favoriteMatches" />
        <CompetitorTeamTable
          :standings="data.firstCompetitorTeams"
          :matchSchedules="firstCompetitorTeamsMatches"
          :favoriteTeamPoints="data.favoriteTeamPoints" />
        <CompetitorTeamTable
          v-if="data.secoundCompetitorTeams"
          :standings="data.secoundCompetitorTeams"
          :matchSchedules="secondCompetitorTeamsMatches"
          :favoriteTeamPoints="data.favoriteTeamPoints" />
        <CompetitorTeamTable
          v-if="data.thirdCompetitorTeams"
          :standings="data.thirdCompetitorTeams"
          :matchSchedules="thirdCompetitorTeamsMatches"
          :favoriteTeamPoints="data.favoriteTeamPoints" />
      </tbody>
    </table>
    <br />
  </div>
</template>
<script>
import axios from 'axios'
import { reactive, onMounted, computed } from 'vue'
import FavoriteTeamTable from '../../table/FavoriteTeamTable.vue'
import CompetitorTeamTable from '../../table/CompetitorTeamTable.vue'

export default {
  components: {
    FavoriteTeamTable,
    CompetitorTeamTable
  },
  setup() {
    const data = reactive({
      favoriteTeams: [],
      favoriteTeamPoints: '',
      firstCompetitorTeams: [],
      secoundCompetitorTeams: [],
      thirdCompetitorTeams: [],
      favoriteMatchSchedules: [],
      favorite: [],
      competitors: [],
    })

    const setFavorite = async () => {
      axios.get('/api/favorites')
        .then((response) => {
          data.favorite = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const setCompetitor = async () => {
      axios.get('/api/competitors')
        .then((response) => {
          data.competitors = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const setTeamSchedules = async () => {
      axios
        .get('/api/standings')
        .then((response) => {
          data.favoriteTeams = response.data[0]
          data.favoriteTeamPoints = data.favoriteTeams.points
          data.firstCompetitorTeams = response.data[1]
          data.secoundCompetitorTeams = response.data[2]
          data.thirdCompetitorTeams = response.data[3]
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const setMatchSchedules = async () => {
      axios
        .get('/api/matches')
        .then((response) => {
          data.favoriteMatchSchedules = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const favoriteMatches = computed(() => data.favoriteMatchSchedules.filter(f => f.team_matches_index === data.favorite.team.id))
    const firstCompetitorTeamsMatches = computed(() => data.favoriteMatchSchedules.filter(f => f.team_matches_index === data.competitors[0].team_id))
    const secondCompetitorTeamsMatches = computed(() => data.favoriteMatchSchedules.filter(f => f.team_matches_index === data.competitors[1].team_id))
    const thirdCompetitorTeamsMatches = computed(() => data.favoriteMatchSchedules.filter(f => f.team_matches_index === data.competitors[2].team_id))

    onMounted(() => {
      setTeamSchedules(),
        setMatchSchedules(),
        setFavorite(),
        setCompetitor()
    })

    return {
      data,
      favoriteMatches,
      firstCompetitorTeamsMatches,
      secondCompetitorTeamsMatches,
      thirdCompetitorTeamsMatches
    }
  }
}
</script>
<style lang="scss">
.container {
  text-align: center;
}
</style>
