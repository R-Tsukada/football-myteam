<template>
  <button class="button has-text-centered" :disabled="disabled">
    <span class="icon-text">
      <span class="icon">
        <i class="fa-solid fa-check"></i>
      </span>
      <span>{{ label }}</span>
    </span>
  </button>
</template>
<script>
export default {
  name: 'DetermineButton',
  props: {
    label: {
      type: String,
      default: '決定'
    },
    disabled: {
      type: Boolean,
      default: false
    }
  }
}
</script>
