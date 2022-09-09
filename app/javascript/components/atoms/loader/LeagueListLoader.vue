<template>
  <content-loader>
    <rect x="3" y="20" width="90" height="60" />
    <rect x="103" y="20" width="90" height="60" />
    <rect x="203" y="20" width="90" height="60" />
    <rect x="303" y="20" width="90" height="60" />
  </content-loader>
</template>

<script>
import { ContentLoader } from 'vue-content-loader'

export default {
  name: 'LeagueListLoader',
  components: {
    ContentLoader
  }
}
</script>

<style scoped></style>
