<template>
  <div class="container">
    <ul v-for="league in leagues" :key="league.id">
      <li>
        <img :src="league.logo" class="logo_image" />
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      leagues: 'leagues'
    }
  },
  methods: {
    setLeague: function () {
      axios.get('/api/leagues').then((response) => {
        this.leagues = response.data
      })
    }
  },
  mounted() {
    this.setLeague()
  }
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
</style>
