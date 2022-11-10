<template>
  <div class="match-schedule-card mx-auto">
    <div
      class="box has-text-centered"
      v-for="schedule in matchScheduleFilter"
      :key="schedule.id">
      <div class="columns is-mobile is-gapless">
        <div class="column has-text-right mr-1 my-auto">
          <img
            :src="schedule.competition_logo"
            alt="competition_logo"
            class="competition-logo" />
        </div>
        <div
          v-if="selectedTeam[0].stadium === schedule.home_and_away"
          class="home-and-away column has-text-white has-text-weight-bold has-background-success my-auto">
          <p>HOME</p>
        </div>
        <div
          v-else
          class="home-and-away column has-text-white has-text-weight-bold has-background-danger my-auto">
          <p>AWAY</p>
        </div>
        <p
          class="match-schedule-date column has-text-weight-bold has-text-left my-auto ml-1">
          {{ matchDay(schedule.date) }}
        </p>
      </div>
      <!-- columns -->
      <div class="match-list columns is-mobile mx-auto">
        <p
          class="column my-auto has-text-weight-bold is-size-3-tablet not-displayed-when-with-mobile-display">
          {{ schedule.home_team_name }}
        </p>
        <div class="column has-text-centered">
          <img
            :src="schedule.home_logo"
            alt="home_team_logo"
            class="image team-logo mx-auto" />
        </div>
        <div class="column my-auto has-text-centered is-size-3 mt-4">
          <p class="has-text-weight-bold">vs</p>
        </div>
        <div class="column has-text-centered">
          <img
            :src="schedule.away_logo"
            alt="away_team_logo"
            class="image team-logo mx-auto" />
        </div>
        <p
          class="column my-auto has-text-weight-bold is-size-3-tablet not-displayed-when-with-mobile-display">
          {{ schedule.away_team_name }}
        </p>
      </div>
    </div>
  </div>
  <!-- match-schedule-card -->
</template>

<script>
import { reactive } from 'vue'

export default {
  props: ['matchScheduleFilter', 'selectedTeam'],
  setup() {
    const data = reactive({
      isHome: 'HOME'
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
