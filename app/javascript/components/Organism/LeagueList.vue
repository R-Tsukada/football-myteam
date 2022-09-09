<template>
  <div class="tabs is-boxed is-fullwidth">
    <ul v-for="league in leagues" :key="league.id">
      <li
        @click="selectLeague(league)"
        v-bind:class="{
          'is-active': selectedLeague === league.id
        }">
        <a>
          <img
            :src="league.logo"
            :alt="league.name"
            class="image team-select-league-logo mr-2" />
          <p class="is-size-6 not-displayed-when-with-mobile-display">
            {{ league.name }}
          </p>
        </a>
      </li>
    </ul>
  </div>
  <!-- tabs -->
</template>
<script>
export default {
  props: ['leagues', 'selectedLeague'],
  setup(props, context) {
    const selectLeague = (league) => {
      context.emit('selectLeague', league.id)
    }

    return {
      selectLeague
    }
  }
}
</script>
