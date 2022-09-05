<template>
  <button class="button has-text-centered ">
    {{ label }}
  </button>
</template>
<script>
export default {
  props: {
    label: {
      type: String
    }
  }
}
</script>
