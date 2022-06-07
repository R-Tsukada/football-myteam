<template>
  <div>
    <div class="box" v-for="schedule in matchScheduleFilter" :key="schedule.id">
      <div class="columns is-mobile">
        <div class="is-flex-direction-row ml-2">
          <img
            :src="schedule.competition_logo"
            alt="competition_logo"
            class="competition-logo" />
        </div>
        <div class="is-flex-direction-row my-auto mx-2">
          <p
            class="home-and-away-size has-text-white has-text-weight-bold has-text-centered"
            v-bind:class="
              data.isHome === schedule.home_and_away
                ? 'has-background-success'
                : 'has-background-danger'
            ">
            {{ schedule.home_and_away }}
          </p>
        </div>
        <div class="is-flex-direction-row my-auto mx-2">
          <p
            class="has-text-weight-bold is-size-4-tablet is-size-6-mobile has-text-left">
            {{ String(schedule.date.match(/\d{1,2}-\d{1,2}$/)) }}
          </p>
        </div>
      </div>
      <div class="columns is-mobile">
        <div class="column has-text-centered">
          <img
            :src="schedule.home_logo"
            alt="home_team_logo"
            class="image team-logo mx-auto" />
          <p class="has-text-weight-bold is-size-3-tablet is-size-6-mobile">
            {{ schedule.home_team_name }}
          </p>
        </div>
        <div class="column has-text-centered is-size-3 mt-4">
          <p class="has-text-weight-bold">-</p>
        </div>
        <div class="column has-text-centered">
          <img
            :src="schedule.away_logo"
            alt="away_team_logo"
            class="image team-logo mx-auto" />
          <p class="has-text-weight-bold is-size-3-tablet is-size-6-mobile">
            {{ schedule.away_team_name }}
          </p>
        </div>
      </div>
    </div>
  </div>
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
