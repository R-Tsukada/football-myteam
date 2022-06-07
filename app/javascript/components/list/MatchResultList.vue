<template>
  <div>
    <div class="match-list box" v-for="result in matchResultFilter" :key="result.id">
      <div class="columns is-mobile">
        <div class="is-flex-direction-row ml-2">
          <img
            :src="result.competition_logo"
            alt="competition_logo"
            class="image competition-logo"
          />
        </div>
        <div class="is-flex-direction-row my-auto mx-2">
          <p
            class="has-text-white has-text-weight-bold is-size-4-tablet is-size-6-mobile"
            v-bind:class="
              data.isHome === result.home_and_away
                ? 'has-background-success'
                : 'has-background-danger'
            ">
            {{ result.home_and_away }}
          </p>
        </div>
        <div class="is-flex-direction-row my-auto mx-2">
          <p class="has-text-weight-bold is-size-4-tablet is-size-6-mobile">
            {{ String(result.date.match(/\d{1,2}-\d{1,2}$/)) }}
          </p>
        </div>
      </div><!-- columns -->
      <div class="columns is-mobile">
        <div class="column">
          <img
            :src="result.home_logo"
            class="image team-logo mx-auto"
          />
          <p class="has-text-centered has-text-weight-bold is-size-3-tablet is-size-6-mobile">
            {{ result.home_team_name }}
          </p>
        </div>
        <div class="column">
          <p class="has-text-centered has-text-weight-bold is-size-3-tablet is-size-6-mobile mt-3">
            {{ result.home_score }}
          </p>
        </div>
        <div class="column">
          <p class="has-text-centered has-text-weight-bold is-size-3">-</p>
        </div>
        <div class="column">
          <p class="has-text-centered has-text-weight-bold is-size-3-tablet is-size-6-mobile mt-3">
            {{ result.away_score }}
          </p>
        </div>
        <div class="column">
          <img
            :src="result.away_logo"
            class="image team-logo mx-auto"
          />
          <p class="has-text-centered has-text-weight-bold is-size-3-tablet is-size-6-mobile">
            {{ result.away_team_name }}
          </p>
        </div>
      </div>
    </div>
  </div><!--columns-->
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
