<template>
  <div class="container">
    <h2 class="is-size-2 has-text-centered has-text-weight-bold pb-6">リーグ戦情報</h2>
    <ContentLoader v-if="!data.matches.length">
      <rect x="3" y="20" rx="3" ry="3" width="10" height="10" />
      <rect x="23" y="20" rx="3" ry="3" width="50" height="50" />
      <rect x="88" y="20" rx="3" ry="3" width="10" height="10" />
      <rect x="128" y="20" rx="3" ry="3" width="10" height="10" />
      <rect x="118" y="35" rx="3" ry="3" width="30" height="10" />
      <rect x="163" y="20" rx="3" ry="3" width="70" height="60" />
      <rect x="243" y="20" rx="3" ry="3" width="70" height="60" />
      <rect x="323" y="20" rx="3" ry="3" width="70" height="60" />

      <rect x="3" y="85" rx="3" ry="3" width="10" height="10" />
      <rect x="23" y="85" rx="3" ry="3" width="50" height="50" />
      <rect x="88" y="85" rx="3" ry="3" width="10" height="10" />
      <rect x="128" y="85" rx="3" ry="3" width="10" height="10" />
      <rect x="118" y="100" rx="3" ry="3" width="30" height="10" />
      <rect x="163" y="85" rx="3" ry="3" width="70" height="60" />
      <rect x="243" y="85" rx="3" ry="3" width="70" height="60" />
      <rect x="323" y="85" rx="3" ry="3" width="70" height="60" />
    </ContentLoader>
    <table
        v-else
        class="table is-stripe is-hoverable is-clickable has-text-centered has-text-weight-bold is-size-5">
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
          v-if="data.secondCompetitorTeams"
          :standings="data.secondCompetitorTeams"
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
import { ContentLoader } from 'vue-content-loader'

export default {
  components: {
    FavoriteTeamTable,
    CompetitorTeamTable,
    ContentLoader
  },
  setup() {
    const data = reactive({
      favoriteTeams: [],
      favoriteTeamPoints: '',
      firstCompetitorTeams: [],
      secondCompetitorTeams: [],
      thirdCompetitorTeams: [],
      matches: [],
      favorite: [],
      competitors: []
    })

    const setFavorite = async () => {
      axios
        .get('/api/favorites')
        .then((response) => {
          data.favorite = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const setCompetitor = async () => {
      axios
        .get('/api/competitors')
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
          data.secondCompetitorTeams = response.data[2]
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
          data.matches = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const favoriteMatches = computed(() =>
      data.matches.filter((f) => f.team_matches_index === data.favorite.team.id)
    )
    const firstCompetitorTeamsMatches = computed(() =>
      data.matches.filter(
        (f) => f.team_matches_index === data.competitors[0].team_id
      )
    )
    const secondCompetitorTeamsMatches = computed(() =>
      data.matches.filter(
        (f) => f.team_matches_index === data.competitors[1].team_id
      )
    )
    const thirdCompetitorTeamsMatches = computed(() =>
      data.matches.filter(
        (f) => f.team_matches_index === data.competitors[2].team_id
      )
    )

    onMounted(() => {
      setTeamSchedules(), setMatchSchedules(), setFavorite(), setCompetitor()
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
