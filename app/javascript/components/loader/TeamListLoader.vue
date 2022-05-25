<template>
  <content-loader>
    <rect x="3" y="20" width="70" height="65" />
    <rect x="83" y="20" width="70" height="65" />
    <rect x="168" y="20" width="70" height="65" />
    <rect x="248" y="20" width="70" height="65" />
    <rect x="328" y="20" width="70" height="65" />

    <rect x="3" y="95" width="70" height="65" />
    <rect x="83" y="95" width="70" height="65" />
    <rect x="168" y="95" width="70" height="65" />
    <rect x="248" y="95" width="70" height="65" />
    <rect x="328" y="95" width="70" height="65" />
  </content-loader>
</template>

<script>
import { ContentLoader } from 'vue-content-loader'

export default {
  name: 'TeamListLoader',
  components: {
    ContentLoader
  }
}
</script>

<style scoped></style>
