<template>
  <div class="favorite-team-schedules">
    <div
      class="next-match columns is-mobile is-gapless has-text-centered is-size-5-mobile"
      v-for="match in matchSchedules"
      :key="match.id">
      <img
        :src="match.competition_logo"
        alt="favorite-team-next-match"
        class="image next-match-competition-logo column is-1" />
      <p
        class="next-match-venu column is-2 has-text-white"
        v-bind:class="
          data.isHome === match.home_and_away
            ? 'has-background-success'
            : 'has-background-danger'
        ">
        {{ match.home_and_away }}
      </p>
      <p class="column is-3 next-match-date">
        {{ matchDay(match.date) }}
      </p>
      <p class="column is-1 has-text-weight-bold">vs</p>
      <img
        :src="match.team_logo"
        alt="match-team-logo"
        class="image next-match-competition-logo column is-1" />
      <p class="match-name mobile-display column is-4 has-text-weight-bold">
        {{ match.team_name }}
      </p>
    </div>
    <!-- next-match columns -->
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
