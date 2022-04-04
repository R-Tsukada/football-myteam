<template>
  <div class="main">
    <div class="container">
      <ul v-for="team in teamFilter" :key="team.id">
        <li>
          <img :src="team.logo" />
          <p>{{ team.name }}</p>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      teams: [],
      favorite: ''
    }
  },
  methods: {
    setTeam: function () {
      axios.get('/api/competitors').then((response) => {
        this.teams = response.data
      })
    },
    setFavoriteTeam: function () {
      axios.get('/api/favorites').then((response) => {
        this.favorite = response.data
      })
    }
  },
  computed: {
    teamFilter() {
      const number = this.favorite.id
      return this.teams.filter(function (value) {
        return value.id != number
      })
    }
  },
  mounted() {
    this.setTeam()
    this.setFavoriteTeam()
  }
}
</script>

<style scoped>
.main {
  text-align: center;
}

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
