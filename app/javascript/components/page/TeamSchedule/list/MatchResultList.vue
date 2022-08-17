<template>
  <div class="match-schedule-card mx-auto">
    <div
      class="box has-text-centered"
      v-for="result in matchResultFilter"
      :key="result.id">
      <div class="columns is-mobile is-gapless">
        <div class="column has-text-right mr-1 my-auto">
          <img
            :src="result.competition_logo"
            alt="competition_logo"
            class="competition-logo" />
        </div>
        <p
          class="home-and-away column has-text-white has-text-weight-bold my-auto"
          v-bind:class="
            data.isHome === result.home_and_away
              ? 'has-background-success'
              : 'has-background-danger'
          ">
          {{ result.home_and_away }}
        </p>
        <p
          class="match-schedule-date column has-text-weight-bold has-text-left my-auto ml-1">
          {{ matchDay(result.date) }}
        </p>
      </div>
      <!-- columns -->
      <div class="match-list columns is-mobile m-auto">
        <p
          class="column m-auto has-text-centered has-text-weight-bold is-size-3-tablet mobile-display">
          {{ result.home_team_name }}
        </p>
        <div class="column schedule-column-logo m-auto">
          <img :src="result.home_logo" class="image team-logo m-auto" />
        </div>
        <!-- schedule-column-logo -->
        <p
          class="column schedule-column-score has-text-centered has-text-weight-bold is-size-1 is-size-3-mobile m-auto">
          {{ result.home_score }}
        </p>
        <p
          class="column schedule-column-score has-text-centered has-text-weight-bold is-size-3 is-size-5-mobile m-auto">
          -
        </p>
        <p
          class="column schedule-column-score has-text-centered has-text-weight-bold is-size-1 is-size-3-mobile m-auto">
          {{ result.away_score }}
        </p>
        <div class="column m-auto schedule-column-logo">
          <img :src="result.away_logo" class="image team-logo m-auto" />
        </div>
        <!-- schedule-column-logo -->
        <p
          class="column has-text-centered has-text-weight-bold m-auto is-size-3-tablet mobile-display">
          {{ result.away_team_name }}
        </p>
      </div>
      <!--match-list columns-->
    </div>
    <!-- box -->
  </div>
  <!--match-schedule-card-->
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
