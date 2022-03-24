<template>
  <div class="container">
    <ul v-for="league in leagues" :key="league.id">
      <li>
        <img :src="league.logo" class="logo_image" />
        <p>{{ league.name }}</p>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: ['leagues']
}
</script>

<style scoped>
.container {
  display: flex;
  flex-wrap: wrap;
  align-items: stretch;
  justify-content: center;
}

ul {
  list-style: none;
}

li {
  border: solid 1px;
  border-radius: 8px;
  padding: 5px;
  text-align: center;
}

p {
  font-weight: bold;
}
</style>
