<template>
  <div class="columns is-multiline is-mobile">
    <SorryMessage
      v-if="teams.length === 0"
      class="mx-auto"
      label="同じ本拠地のチームがありません。 他の方法でチームを選んでください" />
    <div
      class="column is-one-third mx-auto"
      v-for="team in teams"
      :key="team.id">
      <div
        class="card has-hover-action select-button"
        @click="followTeam(team)"
        v-bind:class="{
          'has-background-link-light is-selected': competitors.some(
            (competitor) => competitor.team_id === team.id
          )
        }">
        <img :src="team.logo" class="image competitor-team-logo mx-auto pt-1" />
        <p
          class="has-text-weight-medium mt-2 is-size-2-tablet is-size-7-mobile">
          {{ team.name }}
        </p>
        <p class="has-text-weight-medium is-size-3-tablet is-size-5-mobile">
          <span class="is-size-5-tablet is-size-7-mobile">21-22:</span
          >{{ team.last_season_rank }}<span>位</span>
        </p>
        <p class="has-text-weight-medium is-size-3-tablet is-size-5-mobile">
          <span class="is-size-5-tablet is-size-7-mobile">Home:</span
          >{{ team.home_city }}
        </p>
      </div>
      <!-- card -->
    </div>
    <!-- column -->
  </div>
  <!-- columns -->
</template>
<script>
import SorryMessage from '../atoms/SorryMessage.vue'

export default {
  components: {
    SorryMessage
  },
  props: ['teams', 'competitors'],
  setup(props, context) {
    const followTeam = (team) => {
      context.emit('followTeam', team)
    }
    const selectAgain = () => {
      context.emit('selectAgain')
    }
    return {
      followTeam,
      selectAgain
    }
  }
}
</script>
