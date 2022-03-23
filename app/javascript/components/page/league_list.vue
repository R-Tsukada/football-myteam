<template>
    <div class="container">
    <ul v-for="league in leagues" :key="league.id">
      <li>
        <img :src="league.logo" class="logo_image" />
      </li>
    </ul>
  </div>
  <TeamList :teams='teams'/>
</template>

<script>
import axios from 'axios'
import TeamList from '../TeamList.vue'

export default {
   components: {
    TeamList
  },
  data() {
    return {
      leagues: 'leagues',
      teams: 'teams'
    }
  },
  methods: {
    setLeague: function () {
      axios.get('/api/leagues').then((response) => {
        this.leagues = response.data
      })
    },
    setTeam: function () {
      axios.get('/api/teams').then((response) => {
        this.teams = response.data
      })
    }
  },
  mounted() {
    this.setLeague()
    this.setTeam()
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
