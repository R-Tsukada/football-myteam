<template>
  <content-loader>
    <rect x="3" y="0" rx="0" ry="0" width="410" height="45" />
    <rect x="3" y="60" rx="0" ry="0" width="410" height="45" />
    <rect x="3" y="120" rx="0" ry="0" width="410" height="45" />
  </content-loader>
</template>

<script>
import { ContentLoader } from 'vue-content-loader'

export default {
  name: 'MatchScheduleShowLoader',
  components: {
    ContentLoader
  }
}
</script>

<style scoped></style>
