<template>
  <router-link to="/competitors" v-if="selectedTeam">
    <DetermineButton
      label="応援しているチームを決定する"
      class="is-rounded color-button has-text-white is-size-7-mobile m-5"
    />
  </router-link>
  <DetermineButton
    v-else
    label="応援しているチームを決定する"
    class="is-rounded color-button is-size-7-mobile mt-3"
    title="Disabled button"
    disabled
  />
</template>
<script>
import DetermineButton from '../../atoms/Button/DetermineButton.vue'

export default {
  props: {
    selectedTeam: {
      type: Number
    }
  },
  components: {
    DetermineButton
  }
}
</script>
