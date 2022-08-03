<template>
  <div class="container">
    <h2
      class="is-size-2-tablet is-size-4-mobile has-text-centered has-text-weight-bold pb-6">
      リーグ戦情報
    </h2>
    <p class="has-text-centered">優勝・欧州カップ戦出場権・残留争いを楽しもう</p>
    <div class="favorite-team-standing box columns">
      <div class="favorite-team-name-and-rank column">
        <div class="columns">
          <div class="favorite-team column">
            <div class="favorite-team-box">
              <p class="favorite-team-color has-text-white has-text-centered">MyTeam</p>
            </div><!-- favorite-team-box -->
            <p><span class="is-size-1 has-text-weight-bold">{{ data.favoriteTeams.rank }}</span>位</p>
          </div><!-- favorite-team column-->
          <div class="favorite-team-logo column">
            <img
              :src="data.favoriteTeams.team_logo"
              alt="standings-favorite-team-logo"
              class="image" />
          </div><!-- favorite-team-logo column-->
          <div class="favorite-team-name column">
            <p class="has-text-weight-bold is-size-3">{{ data.favoriteTeams.team_name }}</p>
          </div><!-- favorite-team-name column-->
        </div><!-- columns -->
      </div><!-- favorite-team-name-and-rank -->
      <div class="favorite-team-points column">
        <p>勝点</p>
        <p><span class="is-size-1 has-text-weight-bold">{{ data.favoriteTeams.points }}</span>点</p>
      </div><!-- points -->
      <div class="favorite-team-played column">
        <p>試合数</p>
        <p><span class="is-size-1 has-text-weight-bold">{{ data.favoriteTeams.played }}</span>試合</p>
        <p>残り{{ gameCount - data.favoriteTeams.played }}試合</p>
      </div><!-- favorite-team-played -->
      <div class="favorite-team-schedules column">
        <div class="columns" v-for="match in favoriteMatches" :key="match.id">
          <img
            :src="match.competition_logo"
            alt="favorite-team-next-match"
            class="image competitor-team-logo column" />
          <p
            class="has-text-white column"
            v-bind:class="
            data.isHome === match.home_and_away
              ? 'has-background-success'
              : 'has-background-danger'
            ">
              {{ match.home_and_away }}
          </p>
          <p>{{ String(match.date.match(/\d{1,2}-\d{1,2}$/)) }}</p>
          <img
            :src="match.team_logo"
            alt="match-team-logo"
            class="image standings-team-logo column" />
          <div class="match-name column">
            <p>vs</p>
            <p>{{ match.team_name }}</p>
          </div>
        </div><!-- v-for -->
      </div><!-- favorite-team-schedules -->
    </div><!-- favorite-team-standing box columns-->
    <p class="is-size-3 has-text-weight-bold has-text-centered">VS</p>
    <MatchListLoader v-if="!data.matches.length" />
    <table
      v-else
      class="table is-stripe is-hoverable is-clickable has-text-centered has-text-weight-bold is-size-5-tablet is-size-7-mobile">
      <thead>
        <tr>
          <th>順<span class="mobile-display">位</span></th>
          <th>チ<span class="mobile-display">ーム</span></th>
          <th>
            勝<span class="mobile-display">点<br />(勝ち点差)</span>
          </th>
          <th>
            試<span class="mobile-display">合数<br />(残り試合数)</span>
          </th>
          <th>次節以降の試合</th>
        </tr>
      </thead>
      <tbody>
        <FavoriteTeamTable
          class="has-background-link-light"
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
  </div>
  <!-- container -->
</template>

<script>
import axios from 'axios'
import { reactive, onMounted, computed } from 'vue'
import FavoriteTeamTable from './table/FavoriteTeamTable.vue'
import CompetitorTeamTable from './table/CompetitorTeamTable.vue'
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
      competitors: [],
      teams: [],
      isHome: 'HOME',
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

    const setTeams = async () => {
      axios
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
      setTeamSchedules(), setMatchSchedules(), setFavorite(), setCompetitor(), setTeams()
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
