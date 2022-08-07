<template>
  <div class="favorite-team-schedules column is-two-fifths">
    <div
      class="next-match columns is-gapless has-text-centered"
      v-for="match in matchSchedules"
      :key="match.id">
      <img
        :src="match.competition_logo"
        alt="favorite-team-next-match"
        class="image next-match-competition-logo column is-3" />
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
        {{ match.date }}
      </p>
      <img
        :src="match.team_logo"
        alt="match-team-logo"
        class="image next-match-competition-logo column" />
      <p class="column is-1 has-text-weight-bold is-size-4">vs</p>
      <p class="match-name column is-2 has-text-weight-bold is-size-6">
        {{ match.team_name }}
      </p>
    </div>
    <!-- v-for -->
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
    return {
      data
    }
  }
}
</script>
