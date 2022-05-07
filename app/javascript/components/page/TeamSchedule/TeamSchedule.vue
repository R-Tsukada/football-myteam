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
          :matchSchedules="data.favoriteMatchSchedules" />
        <CompetitorTeamTable
          :standings="data.firstCompetitorTeams"
          :matchSchedules="data.firstCompetitorMatchSchedules"
          :favoriteTeamPoints="data.favoriteTeamPoints" />
        <CompetitorTeamTable
          v-if="data.secoundCompetitorTeams"
          :standings="data.secoundCompetitorTeams"
          :matchSchedules="data.secoundCompetitorMatchSchedules"
          :favoriteTeamPoints="data.favoriteTeamPoints" />
        <CompetitorTeamTable
          v-if="data.thirdCompetitorTeams"
          :standings="data.thirdCompetitorTeams"
          :matchSchedules="data.thirdCompetitorMatchSchedules"
          :favoriteTeamPoints="data.favoriteTeamPoints" />
      </tbody>
    </table>
    <br />
    <button class="button is-link is-rounded m-3 is-medium">
      <router-link to="/leagues" class="has-text-white"
        >応援しているチームを選び直す</router-link
      >
    </button>
    <button class="button is-rounded m-3 is-medium has-text-black">
      <router-link to="/competitors" class="has-text-black"
        >ライバルチームを選び直す</router-link
      >
    </button>
  </div>
</template>
<script>
import axios from 'axios'
import { reactive, onMounted } from 'vue'
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
      firstCompetitorMatchSchedules: [],
      secoundCompetitorMatchSchedules: [],
      thirdCompetitorMatchSchedules: []
    })

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
        .get('/api/favorite_team_matches')
        .then((response) => {
          data.favoriteMatchSchedules = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const setFirstCompetitorMatchSchedules = async () => {
      axios
        .get('/api/first_competitor_team_matches')
        .then((response) => {
          data.firstCompetitorMatchSchedules = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const setSecoundCompetitorMatchSchedules = async () => {
      axios
        .get('/api/secound_competitor_team_matches')
        .then((response) => {
          data.secoundCompetitorMatchSchedules = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const setThirdCompetitorMatchSchedules = async () => {
      axios
        .get('/api/third_competitor_team_matches')
        .then((response) => {
          data.thirdCompetitorMatchSchedules = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    onMounted(() => {
      setTeamSchedules(),
        setMatchSchedules(),
        setFirstCompetitorMatchSchedules(),
        setSecoundCompetitorMatchSchedules(),
        setThirdCompetitorMatchSchedules()
    })

    return {
      data
    }
  }
}
</script>
<style lang="scss">
.container {
  text-align: center;
}
</style>
