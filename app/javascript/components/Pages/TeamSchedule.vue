<template>
  <div class="container">
    <div class="section">
      <h2
        class="is-size-2-tablet is-size-4-mobile has-text-centered has-text-weight-bold pb-6">
        リーグ戦情報
      </h2>
      <p class="has-text-centered has-text-weight-bold mb-4">
        優勝・欧州カップ戦出場権・残留争いを楽しもう
      </p>
      <MatchListLoader v-if="!favoriteMatches.length" />
      <div v-else>
        <div class="mb-3 has-text-right">
          <p>更新日:{{ updateDate(favoriteMatches[0].created_at) }}</p>
        </div>
        <TeamScheduleBox
          :standings="favoriteStanding[0]"
          :matchSchedules="favoriteMatches"
          :favoriteId="data.favorite.team.id" />
        <p class="is-size-3 has-text-weight-bold has-text-centered my-5">VS</p>
        <TeamScheduleBox
          :standings="firstCompetitorStanding[0]"
          :matchSchedules="firstCompetitorTeamsMatches"
          :favoriteTeamPoints="data.favoriteTeamPoints" />
        <TeamScheduleBox
          v-if="data.competitors[1]"
          :standings="secondCompetitorStanding[0]"
          :matchSchedules="secondCompetitorTeamsMatches"
          :favoriteTeamPoints="data.favoriteTeamPoints" />
        <TeamScheduleBox
          v-if="data.competitors[2]"
          :standings="thirdCompetitorStanding[0]"
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
import TeamScheduleBox from '../Organism/table/TeamScheduleBox.vue'
import MatchListLoader from '../atoms/loader/MatchListLoader'

export default {
  components: {
    MatchListLoader,
    TeamScheduleBox
  },
  setup() {
    const data = reactive({
      favoriteTeams: [],
      favoriteTeamPoints: '',
      matches: [],
      favorite: [],
      competitors: [],
      teams: [],
      isHome: 'HOME',
      standings: []
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

    const setStandings = async () => {
      await axios
        .get('/api/standings')
        .then((response) => {
          data.standings = response.data
          data.favoriteTeams = response.data[0]
          data.favoriteTeamPoints = data.favoriteTeams.points
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

    /* gameCountで使われる */
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

    const gameCount = computed(() => data.teams.length * 2)

    const updateMatches = async () => {
      await axios
        .get('/api/update_matches')
        .then((response) => {
          data.matches = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const updateStadings = async () => {
      await axios
        .get('/api/update_standings')
        .then((response) => {
          data.standings = response.data
          data.favoriteTeams = response.data[0]
          data.favoriteTeamPoints = data.favoriteTeams.points
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    const resetMatchesAndStandings = () => {
      data.matches = []
      data.standings = []
      data.favoriteTeams = []
      data.favoriteTeamPoints = []
    }

    const toDoubleDigits = function (num) {
      num += ''
      if (num.length === 1) {
        num = '0' + num
      }
      return num
    }

    const updateDate = (date) => {
      const weekDay = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fry', 'Sat']
      const getDate = new Date(date)
      const mm = String(getDate.getMonth() + 1).padStart(2, '0')
      const dd = String(getDate.getDate()).padStart(2, '0')
      const week = weekDay[getDate.getDay()]
      const hh = toDoubleDigits(getDate.getHours())
      const min = toDoubleDigits(getDate.getMinutes())
      return `${mm}/${dd}(${week})${hh}:${min}`
    }

    const dataUpdate = async () => {
      resetMatchesAndStandings()
      updateMatches()
      updateStadings()
    }

    const favoriteStanding = computed(() =>
      data.standings.filter((f) => f.team_id === data.favorite.team.id)
    )

    const firstCompetitorStanding = computed(() =>
      data.standings.filter((f) => f.team_id === data.competitors[0].team_id)
    )

    const secondCompetitorStanding = computed(() =>
      data.standings.filter((f) => f.team_id === data.competitors[1].team_id)
    )

    const thirdCompetitorStanding = computed(() =>
      data.standings.filter((f) => f.team_id === data.competitors[2].team_id)
    )

    const favoriteMatches = computed(() =>
      data.matches.filter((f) => f.team_id === data.favorite.team.id)
    )
    const firstCompetitorTeamsMatches = computed(() =>
      data.matches.filter((f) => f.team_id === data.competitors[0].team_id)
    )
    const secondCompetitorTeamsMatches = computed(() =>
      data.matches.filter((f) => f.team_id === data.competitors[1].team_id)
    )
    const thirdCompetitorTeamsMatches = computed(() =>
      data.matches.filter((f) => f.team_id === data.competitors[2].team_id)
    )

    const date = new Date()

    const formatDate = (date) => {
      const yyyy = String(date.getFullYear())
      const mm = String(date.getMonth() + 1).padStart(2, '0')
      const dd = String(date.getDate()).padStart(2, '0')
      return `${yyyy}-${mm}-${dd}`
    }

    onMounted(() => {
      setStandings(),
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
      toDoubleDigits,
      updateDate,
      dataUpdate,
      resetMatchesAndStandings,
      updateMatches,
      updateStadings,
      date,
      formatDate,
      gameCount,
      favoriteStanding,
      firstCompetitorStanding,
      secondCompetitorStanding,
      thirdCompetitorStanding
    }
  }
}
</script>
