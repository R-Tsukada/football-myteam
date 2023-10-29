<template>
  <div class="columns is-mobile is-flex-wrap-wrap has-text-centered">
    <div
      class="column is-one-fifth-tablet is-one-third-mobile has-text-centered"
      v-for="team in teamFilter"
      :key="team.id"
    >
      <div
        class="card has-hover-action select-button"
        @click="selectTeam(team)"
        v-bind:class="{
          'has-background-link-light is-selected': selectedTeam === team.id
        }"
      >
        <img
          :src="team.logo"
          :alt="team.name"
          class="image mx-auto team-logo"
        />
        <p
          class="has-text-weight-semibold mt-2 is-size-6-tablet is-size-7-mobile is-break-all"
          v-bind:class="{
            'has-text-weight-bold': selectedTeam === team.id
          }"
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
  props: ['teamFilter', 'selectedTeam'],
  setup(props, context) {
    const selectTeam = (team) => {
      context.emit('selectTeam', team.id)
    }
    return {
      selectTeam
    }
  }
}
</script>
