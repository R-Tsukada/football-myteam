<template>
  <div class="container pt-5">
    <table class="table">
      <thead>
        <tr>
          <th><abbr title="Position">順位</abbr></th>
          <th><abbr title="Team">チーム</abbr></th>
          <th>
            <abbr title="Points">勝点<br />(勝ち点差)</abbr>
          </th>
          <th><abbr title="Played">試合数</abbr></th>
          <th><abbr title="Shedule">次節以降の試合</abbr></th>
        </tr>
      </thead>
      <FavoriteTeamTable
        :standings="data.favoriteTeams"
        :matchSchedules="data.favoriteMatchSchedules" />
      <FavoriteTeamTable
        :standings="data.firstCompetitorTeams"
        :matchSchedules="data.firstCompetitorMatchSchedules" />
      <FavoriteTeamTable
        :standings="data.secoundCompetitorTeams"
        :matchSchedules="data.secoundCompetitorMatchSchedules" />
      <FavoriteTeamTable
        :standings="data.thirdCompetitorTeams"
        :matchSchedules="data.thirdCompetitorMatchSchedules" />
    </table>
    <br />
    <button class="button">
      <router-link to="/">応援しているチームを選び直す</router-link>
    </button>
    <br />
    <button class="button">
      <router-link to="/competitors">ライバルチームを選び直す</router-link>
    </button>
  </div>
</template>
<script>
import axios from 'axios'
import { reactive, onMounted } from 'vue'
import FavoriteTeamTable from '../table/FavoriteTeamTable.vue'

export default {
  components: {
    FavoriteTeamTable
  },
  setup() {
    const data = reactive({
      favoriteTeams: [],
      firstCompetitorTeams: [],
      secoundCompetitorTeams: [],
      thirdCompetitorTeams: [],
      favoriteMatchSchedules: [],
      firstCompetitorMatchSchedules: [],
      secoundCompetitorMatchSchedules: [],
      thirdCompetitorMatchSchedules: []
    })

    const setTeamSchedules = async () => {
      axios.get('/api/standings').then((response) => {
        data.favoriteTeams = response.data[0]
        data.firstCompetitorTeams = response.data[1]
        data.secoundCompetitorTeams = response.data[2]
        data.thirdCompetitorTeams = response.data[3]
      })
    }

    const setMatchSchedules = async () => {
      axios.get('/api/favorite_team_matches').then((response) => {
        data.favoriteMatchSchedules = response.data
      })
    }

    const setFirstCompetitorMatchSchedules = async () => {
      axios.get('/api/first_competitor_team_matches').then((response) => {
        data.firstCompetitorMatchSchedules = response.data
      })
    }

    const setSecoundCompetitorMatchSchedules = async () => {
      axios.get('/api/secound_competitor_team_matches').then((response) => {
        data.secoundCompetitorMatchSchedules = response.data
      })
    }

    const setThirdCompetitorMatchSchedules = async () => {
      axios.get('/api/third_competitor_team_matches').then((response) => {
        data.thirdCompetitorMatchSchedules = response.data
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
@import 'bulma/bulma.sass';

.container {
  text-align: center;
}
</style>
