<template>
  <div class="container">
    <h2
      class="selected-team is-flex is-justify-content-center is-align-items-center mx-auto mb-2"
      v-if="selectedTeam[0]">
      <span
        class="favorite-team-tag my-auto mr-2"
        v-if="
          data.favorite.team && data.favorite.team.id === $store.state.teamId
        ">
        <FavoriteTeamTag />
      </span>
      <div class="mr-2">
        <img
          :src="selectedTeam[0].logo"
          alt="selected_team_logo"
          class="image selected-team-logo-show-page m-auto" />
      </div>
      <!-- mr-2.selected-team-togo-show-page -->
      <div
        class="selected-team-name-and-matches has-text-bold is-size-2 is-size-6-mobile has-text-weight-bold has-text-left my-auto">
        {{ selectedTeam[0].name }}の試合{{ changeTitle }}
      </div>
      <!-- selected-team-name-and-matches -->
    </h2>
    <!--selected-team -->
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
      <router-link to="/schedules"
        ><BackToPageButton label="リーグ戦一覧に戻る" class="is-rounded"
      /></router-link>
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
import BackToPageButton from '../../atoms/Button/BackToPageButton.vue'

export default {
  components: {
    MatchScheduleShowLoader,
    MatchScheduleList,
    MatchResultList,
    FavoriteTeamTag,
    BackToPageButton
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

    const changeTitle = computed(() => {
      if (data.isActive == 'match_schedule') {
        return '予定'
      } else {
        return '結果'
      }
    })

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

    const matchScheduleFilter = computed(() =>
      data.schedules.filter((schedules) => schedules.date > formatDate(date))
    )

    const matchResultsFilter = computed(() =>
      data.schedules.filter((schedules) => schedules.date < formatDate(date))
    )

    onMounted(setMatchData(), setTeams(), setFavorite())

    return {
      data,
      date,
      formatDate,
      matchScheduleFilter,
      matchResultsFilter,
      selectedTeam,
      changeTitle
    }
  }
}
</script>
