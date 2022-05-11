<template>
  <div class="container pt-5">
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
    <div class="tab-contents">
      <div
        class="content"
        v-bind:class="{ 'is-active': data.isActive == 'match_schedule' }">
        <MatchScheduleList :matchScheduleFilter="matchScheduleFilter" />
      </div>
      <div
        class="content"
        v-bind:class="{ 'is-active': data.isActive == 'match_result' }">
        <MatchResultList :matchResultFilter="matchResultsFilter" />
      </div>
    </div>
    <button
      class="button is-rounded is-medium mt-5"
      style="background-color: #6246ea">
      <router-link to="/schedules" class="has-text-white">戻る</router-link>
    </button>
  </div>
</template>

<script>
import axios from 'axios'
import { reactive, onMounted, computed } from 'vue'
import { useStore } from 'vuex'
import MatchScheduleList from '../../list/MatchScheduleList.vue'
import MatchResultList from '../../list/MatchResultList.vue'

export default {
  components: {
    MatchScheduleList,
    MatchResultList
  },
  setup() {
    const data = reactive({
      schedules: [],
      isActive: 'match_schedule'
    })

    const store = useStore()

    const setMatchData = async () => {
      axios
        .get(`/api/favorite_team_matches/${store.state.teamId}`)
        .then((response) => {
          data.schedules = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    }

    const date = new Date()

    const formatDate = (date) => {
      const yyyy = String(date.getFullYear())
      const mm = String(date.getMonth() + 1).padStart(2, '0')
      const dd = String(date.getDate()).padStart(2, '0')
      return `${yyyy}-${mm}-${dd}`
    }

    const matchScheduleFilter = computed(() => {
      return data.schedules.filter(function (schedules) {
        return schedules.date >= formatDate(date)
      })
    })

    const matchResultsFilter = computed(() => {
      return data.schedules.filter(function (schedules) {
        return schedules.date <= formatDate(date)
      })
    })

    onMounted(setMatchData())

    return {
      data,
      date,
      formatDate,
      matchScheduleFilter,
      matchResultsFilter
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
