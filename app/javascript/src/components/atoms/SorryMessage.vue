<template>
  <div class="box">
    <p class="is-size-2">Sorry...</p>
    <p class="mt-2">{{ label }}</p>
  </div>
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
