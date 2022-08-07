<template>
  <p
    v-bind:class="
      favoriteTeamPoints >= standingsPoints
        ? 'has-text-success'
        : 'has-text-danger'
    ">
    勝ち点差<span class="has-text-weight-bold">{{
      favoriteTeamPoints - standingsPoints
    }}</span
    >点
  </p>
</template>

<script>
export default {
  props: ['favoriteTeamPoints', 'standingsPoints']
}
</script>
