<template>
  <div class="columns is-mobile is-flex-wrap-wrap has-text-centered">
    <div
      class="column is-one-fifth-tablet is-one-third-mobile has-text-centered"
      v-for="team in teams"
      :key="team.id"
    >
      <div
        class="card has-hover-action select-button"
        @click="selectTeam(team)"
        v-bind:class="{
          'has-background-link-light is-selected': competitors.some(
            (competitor) => competitor.id === team.id
          )
        }"
      >
        <img :src="team.logo" class="image team-logo mx-auto" />
        <p
          class="has-text-weight-semibold mt-2 is-size-6-tablet is-size-7-mobile is-break-all"
        >
          {{ team.name }}
        </p>
      </div>
      <!-- card -->
    </div>
    <!-- column -->
  </div>
  <!-- columns -->
</template>
<script>
export default {
  props: ['teams', 'competitors'],
  setup(props, context) {
    const selectTeam = (team) => {
      context.emit('selectTeam', team)
    }
    return {
      selectTeam
    }
  }
}
</script>
