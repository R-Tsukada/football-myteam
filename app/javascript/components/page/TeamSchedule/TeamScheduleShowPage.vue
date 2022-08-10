<template>
  <div class="container pt-5">
    <div
      class="selected-team columns is-mobile is-gapless mx-auto has-text-centered">
      <FavoriteTeamTag
        class="column is-one-fifth my-auto"
        v-show="data.favorite.team.id === $store.state.teamId" />
      <div class="column is-one-quarter">
        <img
          :src="selectedTeam[0].logo"
          alt="selected_team_logo"
          class="image team-logo m-auto" />
      </div>
      <h2
        class="column has-text-bold is-size-2 is-size-6-mobile has-text-weight-bold has-text-left my-auto">
        {{ selectedTeam[0].name }}の試合予定
      </h2>
    </div>
    <!--selected-team columns -->
    <div class="tabs is-toggle is-centered">
      <ul>
        <li v-bind:class="{ 'is-active': data.isActive == 'match_schedule' }">
          <a v-on:click="data.isActive = 'match_schedule'">試合予定</a>
        </li>
        <li v-bind:class="{ 'is-active': data.isActive == 'match_result' }">
          <a v-on:click="data.isActive = 'match_result'">試合結果</a>
        </li>
      </ul>
    </div>
    <!-- tabs -->
    <MatchScheduleShowLoader v-if="!data.schedules.length" />
    <div class="tab-contents" v-else>
      <div
        class="content"
        v-bind:class="{ 'is-active': data.isActive == 'match_schedule' }">
        <MatchScheduleList :matchScheduleFilter="matchScheduleFilter" />
      </div>
      <div
        class="content"
        v-bind:class="{ 'is-active': data.isActive == 'match_result' }">
        <MatchResultList :matchResultFilter="matchResultsFilter.reverse()" />
      </div>
    </div>
    <!-- tab-contents v-else -->
    <div class="has-text-centered">
      <button
        class="color-button button is-rounded is-medium mt-5 has-text-centered">
        <router-link to="/schedules" class="has-text-white">戻る</router-link>
      </button>
    </div>
    <!-- has-text-centered -->
  </div>
  <!--container -->
</template>

<script>
import axios from 'axios'
import { reactive, onMounted, computed } from 'vue'
import { useStore } from 'vuex'
import MatchScheduleList from './list/MatchScheduleList.vue'
import MatchResultList from './list/MatchResultList.vue'
import MatchScheduleShowLoader from '../../loader/MatchScheduleShowLoader'
import FavoriteTeamTag from '../../atoms/FavoriteTeamTag.vue'

export default {
  components: {
    MatchScheduleShowLoader,
    MatchScheduleList,
    MatchResultList,
    FavoriteTeamTag
  },
  setup() {
    const data = reactive({
      schedules: [],
      isActive: 'match_schedule',
      teams: [],
      favorite: []
    })

    const store = useStore()

    const setMatchData = async () => {
      axios
        .get(`/api/matches/${store.state.teamId}`)
        .then((response) => {
          data.schedules = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    }

    const setTeams = async () => {
      axios
        .get('/api/teams')
        .then((response) => {
          data.teams = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

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

    const selectedTeam = computed(() =>
      data.teams.filter((team) => team.id === store.state.teamId)
    )

    const date = new Date()

    const formatDate = (date) => {
      const yyyy = String(date.getFullYear())
      const mm = String(date.getMonth() + 1).padStart(2, '0')
      const dd = String(date.getDate()).padStart(2, '0')
      return `${yyyy}-${mm}-${dd}`
    }

    const matchScheduleFilter = computed(() => {
      return data.schedules.filter(function (schedules) {
        return schedules.date > formatDate(date)
      })
    })

    const matchResultsFilter = computed(() => {
      return data.schedules.filter(function (schedules) {
        return schedules.date < formatDate(date)
      })
    })

    onMounted(setMatchData(), setTeams(), setFavorite())

    return {
      data,
      date,
      formatDate,
      matchScheduleFilter,
      matchResultsFilter,
      selectedTeam
    }
  }
}
</script>
<style>
.tab-contents .content {
  display: none;
}
.tab-contents .content.is-active {
  display: block;
}
</style>
