<template>
  <div class="match-schedule-card mx-auto">
    <div
      class="box has-text-centered"
      v-for="schedule in matchScheduleFilter"
      :key="schedule.id">
      <div class="columns is-gapless">
        <div class="column is-1 my-auto">
          <img
            :src="schedule.competition_logo"
            alt="competition_logo"
            class="competition-logo" />
        </div>
        <p
          class="home-and-away column is-1 my-auto has-text-white has-text-weight-bold"
          v-bind:class="
            data.isHome === schedule.home_and_away
              ? 'has-background-success'
              : 'has-background-danger'
          ">
          {{ schedule.home_and_away }}
        </p>
        <p class="match-schedule-date column is-2 my-auto has-text-weight-bold">
          {{ String(schedule.date) }}
        </p>
      </div>
      <!-- columns -->
      <div class="match-list columns mx-auto">
        <p
          class="column my-auto has-text-weight-bold is-size-3-tablet is-size-6-mobile">
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
          class="column my-auto has-text-weight-bold is-size-3-tablet is-size-6-mobile">
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
  props: ['matchScheduleFilter'],
  setup() {
    const data = reactive({
      isHome: 'HOME'
    })

    return {
      data
    }
  }
}
</script>
