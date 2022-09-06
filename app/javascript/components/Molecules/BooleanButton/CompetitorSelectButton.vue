<template>
  <router-link
    to="/schedules"
    v-if="competitors.length >= 1 && competitors.length <= 3">
    <DetermineButton
      class="color-button is-rounded has-text-white"
      label="選んだチームを登録する" />
  </router-link>
  <DetermineButton
    v-else
    class="color-button is-rounded"
    title="Disabled button"
    disabled
    label="選んだチームを登録する" />
</template>
<script>
import DetermineButton from '../../atoms/Button/DetermineButton.vue'

export default {
  props: {
    competitors: {
      type: String
    }
  },
  components: {
    DetermineButton
  }
}
</script>
