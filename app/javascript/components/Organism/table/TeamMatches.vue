<template>
  <div class="favorite-team-schedules py-0">
    <div
      class="next-match has-text-centered is-size-5-mobile is-flex is-align-items-center py-2"
      v-for="match in matchSchedules"
      :key="match.id">
      <img
        :src="match.competition_logo"
        alt="favorite-team-next-match"
        class="image next-match-competition-logo" />
      <p
        class="next-match-venu has-text-white mr-1"
        v-bind:class="
          data.isHome === match.home_and_away
            ? 'has-background-success'
            : 'has-background-danger'
        ">
        {{ match.home_and_away }}
      </p>
      <!-- next-match-venu -->
      <p class="next-match-date">
        {{ matchDay(match.date) }}
      </p>
      <!-- next-match-date -->
      <img
        :src="match.team_logo"
        alt="match-team-logo"
        class="image next-match-competition-logo" />
      <p
        class="match-name not-displayed-when-with-mobile-display has-text-weight-bold">
        {{ match.team_name }}
      </p>
      <!-- match-name -->
    </div>
    <!-- next-match -->
  </div>
  <!-- favorite-team-schedules -->
</template>

<script>
import { reactive } from 'vue'
export default {
  props: ['matchSchedules'],
  setup() {
    const data = reactive({
      isHome: 'HOME',
      teams: [],
      favorite: []
    })

    const matchDay = (date) => {
      const weekDay = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fry', 'Sat']
      const matchDate = date
      const dateFormat = matchDate.replace(/(?!^)-|[^-\d]/g, '')
      const dateNumber = dateFormat.match(/(\d{4})(\d{2})(\d{2})/)
      const getDate = new Date(dateNumber[1], dateNumber[2] - 1, dateNumber[3])
      const mm = String(getDate.getMonth() + 1).padStart(2, '0')
      const dd = String(getDate.getDate()).padStart(2, '0')
      const week = weekDay[getDate.getDay()]
      return `${mm}/${dd}(${week})`
    }

    return {
      data,
      matchDay
    }
  }
}
</script>
