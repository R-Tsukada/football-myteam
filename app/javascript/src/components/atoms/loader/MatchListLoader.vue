<template>
  <ContentLoader>
    <rect x="3" y="20" rx="3" ry="3" width="10" height="10" />
    <rect x="23" y="20" rx="3" ry="3" width="50" height="50" />
    <rect x="88" y="20" rx="3" ry="3" width="10" height="10" />
    <rect x="128" y="20" rx="3" ry="3" width="10" height="10" />
    <rect x="118" y="35" rx="3" ry="3" width="30" height="10" />
    <rect x="163" y="20" rx="3" ry="3" width="70" height="60" />
    <rect x="243" y="20" rx="3" ry="3" width="70" height="60" />
    <rect x="323" y="20" rx="3" ry="3" width="70" height="60" />

    <rect x="3" y="85" rx="3" ry="3" width="10" height="10" />
    <rect x="23" y="85" rx="3" ry="3" width="50" height="50" />
    <rect x="88" y="85" rx="3" ry="3" width="10" height="10" />
    <rect x="128" y="85" rx="3" ry="3" width="10" height="10" />
    <rect x="118" y="100" rx="3" ry="3" width="30" height="10" />
    <rect x="163" y="85" rx="3" ry="3" width="70" height="60" />
    <rect x="243" y="85" rx="3" ry="3" width="70" height="60" />
    <rect x="323" y="85" rx="3" ry="3" width="70" height="60" />
  </ContentLoader>
</template>

<script>
import { ContentLoader } from 'vue-content-loader'

export default {
  name: 'MatchListLoader',
  components: {
    ContentLoader
  }
}
</script>

<style scoped></style>
