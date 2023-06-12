<template>
  <div class="columns is-multiline is-centered mt-4 mx-auto">
    <div class="v-model-radiobutton column is-one-quarter-fullhd is-one-third-widescreen is-half-desktop is-half-tablet has-text-left">
      <label class="has-text-weight-medium" for="rank">
        <input
          type="radio"
          class="how-to-team-select rank mb-4"
          value="rank"
          v-model="checkedName" />
        昨シーズンの順位が近いチームを選ぶ</label
      >
      <br />
      <label class="has-text-weight-medium" for="home">
        <input
          type="radio"
          class="how-to-team-select home mb-4"
          value="home"
          v-model="checkedName" />
        本拠地が近いチームを選ぶ</label
      >
      <br />
      <label class="has-text-weight-medium" for="self">
        <input
          type="radio"
          class="how-to-team-select self mb-4"
          value="self"
          v-model="checkedName" />
        自分でライバルチームを選ぶ</label
      >
    </div>
  </div>
</template>

<script>
import { defineComponent, ref, watch } from 'vue'

export default defineComponent({
  props: {
    checkedName: String
  },
  setup(props, { emit }) {
    const checkedName = ref(props.checkedName)

    watch(checkedName, () => {
      emit('update:checkedName', checkedName.value)
    })

    return {
      checkedName,
    }
  }
})
</script>

