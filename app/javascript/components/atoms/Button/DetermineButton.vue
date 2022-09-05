<template>
  <button class="button has-text-centered ">
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
  props: {
    label: {
      type: String
    }
  }
}
</script>
