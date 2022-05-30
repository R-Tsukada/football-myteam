<template>
  <div class="container">
    <h2
      v-if="'2022-05-28' > formatDate(date) || '2022-07-05' < formatDate(date)"
      class="is-size-2 has-text-centered has-text-weight-bold pb-6">
      リーグ戦情報
    </h2>
    <h2
      v-else
      class="is-size-2 has-text-centered has-text-weight-bold pb-6 has-text-danger">
      20-21シーズンは終了しました
    </h2>
    <div class="box" v-if="'2022-05-28' < formatDate(date)">
      <p class="has-text-centered is-size-3 has-text-weight-bold">
        ⚽️21-22シーズンの開幕予定🥅
      </p>
      <div class="mx-auto has-text-centered mt-3">
        <ul class="is-size-5 has-text-weight-bold p-2">
          <li>プレミア：8月 6日(土)</li>
          <li>ラリーガ：8月12日(金)</li>
          <li>ブンデス：8月 5日(金)</li>
          <li>セリエA：未定</li>
        </ul>
      </div>
    </div>
    <MatchListLoader
      v-else-if="'2022-05-28' > formatDate(date) && !data.matches.length" />
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
import MatchListLoader from '../../loader/MatchListLoader'

export default {
  components: {
    MatchListLoader,
    FavoriteTeamTable,
    CompetitorTeamTable
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

    const date = new Date()

    const formatDate = (date) => {
      const yyyy = String(date.getFullYear())
      const mm = String(date.getMonth() + 1).padStart(2, '0')
      const dd = String(date.getDate()).padStart(2, '0')
      return `${yyyy}-${mm}-${dd}`
    }

    onMounted(() => {
      setTeamSchedules(), setMatchSchedules(), setFavorite(), setCompetitor()
    })

    return {
      data,
      favoriteMatches,
      firstCompetitorTeamsMatches,
      secondCompetitorTeamsMatches,
      thirdCompetitorTeamsMatches,
      date,
      formatDate
    }
  }
}
</script>
