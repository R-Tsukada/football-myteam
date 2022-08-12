<template>
  <div class="container">
    <div class="section">
      <h2
        class="is-size-2-tablet is-size-4-mobile has-text-centered has-text-weight-bold pb-6">
        リーグ戦情報
      </h2>
      <p class="has-text-centered mb-4">
        優勝・欧州カップ戦出場権・残留争いを楽しもう
      </p>
      <MatchListLoader v-if="firstCompetitorTeamsMatches.length === 0" />
      <div v-else>
        <TeamScheduleBox
          :standings="data.favoriteTeams"
          :matchSchedules="favoriteMatches"
          :favoriteId="data.favorite.team.id" />
        <p class="is-size-3 has-text-weight-bold has-text-centered my-5">VS</p>
        <TeamScheduleBox
          :standings="data.firstCompetitorTeams"
          :matchSchedules="firstCompetitorTeamsMatches"
          :favoriteTeamPoints="data.favoriteTeamPoints" />
        <TeamScheduleBox
          v-if="data.competitors[1]"
          :standings="data.secondCompetitorTeams"
          :matchSchedules="secondCompetitorTeamsMatches"
          :favoriteTeamPoints="data.favoriteTeamPoints" />
        <TeamScheduleBox
          v-if="data.competitors[2]"
          :standings="data.thirdCompetitorTeams"
          :matchSchedules="thirdCompetitorTeamsMatches"
          :favoriteTeamPoints="data.favoriteTeamPoints" />
      </div>
      <!-- v-else -->
    </div>
    <!-- section -->
  </div>
  <!-- container -->
</template>

<script>
import axios from 'axios'
import { reactive, onMounted, computed } from 'vue'
import TeamScheduleBox from './table/TeamScheduleBox.vue'
import MatchListLoader from '../../loader/MatchListLoader'

export default {
  components: {
    MatchListLoader,
    TeamScheduleBox
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
      competitors: [],
      teams: [],
      isHome: 'HOME'
    })

    const setFavorite = async () => {
      await axios
        .get('/api/favorites')
        .then((response) => {
          data.favorite = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const setCompetitor = async () => {
      await axios
        .get('/api/competitors')
        .then((response) => {
          data.competitors = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const setTeamSchedules = async () => {
      await axios
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
      await axios
        .get('/api/matches')
        .then((response) => {
          data.matches = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const setTeams = async () => {
      await axios
        .get('/api/team_filter')
        .then((response) => {
          data.teams = response.data
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

    const gameCount = computed(() => data.teams.length * 2)

    onMounted(() => {
      setTeamSchedules(),
        setMatchSchedules(),
        setFavorite(),
        setCompetitor(),
        setTeams()
    })

    return {
      data,
      favoriteMatches,
      firstCompetitorTeamsMatches,
      secondCompetitorTeamsMatches,
      thirdCompetitorTeamsMatches,
      date,
      formatDate,
      gameCount
    }
  }
}
</script>
