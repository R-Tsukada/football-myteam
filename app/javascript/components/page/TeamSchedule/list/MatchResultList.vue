<template>
  <div class="match-schedule-card mx-auto">
    <div
      class="box has-text-centered"
      v-for="result in matchResultFilter"
      :key="result.id">
      <div class="columns is-gapless">
        <div class="column is-1 my-auto">
          <img
            :src="result.competition_logo"
            alt="competition_logo"
            class="image competition-logo" />
        </div>
        <p
          class="home-and-away column is-1 my-auto has-text-white has-text-weight-bold"
          v-bind:class="
            data.isHome === result.home_and_away
              ? 'has-background-success'
              : 'has-background-danger'
          ">
          {{ result.home_and_away }}
        </p>
        <p class="match-schedule-date column is-2 my-auto has-text-weight-bold">
          {{ String(result.date) }}
        </p>
      </div>
      <!-- columns -->
      <div class="match-list columns m-auto">
        <p
          class="column has-text-centered has-text-weight-bold is-size-3-tablet is-size-6-mobile my-auto">
          {{ result.home_team_name }}
        </p>
        <div class="column">
          <img :src="result.home_logo" class="image team-logo m-auto" />
        </div>
        <p
          class="column has-text-centered has-text-weight-bold is-size-1 my-auto">
          {{ result.home_score }}
        </p>
        <p
          class="column has-text-centered has-text-weight-bold is-size-3 my-auto">
          -
        </p>
        <p
          class="column has-text-centered has-text-weight-bold is-size-1 my-auto">
          {{ result.away_score }}
        </p>
        <div class="column">
          <img :src="result.away_logo" class="image team-logo m-auto" />
        </div>
        <p
          class="column has-text-centered has-text-weight-bold my-auto is-size-3">
          {{ result.away_team_name }}
        </p>
      </div>
    </div>
  </div>
  <!--columns-->
</template>
>

<script>
import { reactive } from 'vue'

export default {
  props: ['matchResultFilter'],
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
