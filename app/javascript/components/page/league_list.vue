<template>
  <div>
    <LeagueList :leagues="leagues" />
    <TeamList :teams="teams" />
  </div>
</template>

<script>
import axios from 'axios'
import TeamList from '../TeamList.vue'
import LeagueList from '../LeagueList.vue'

export default {
  components: {
    LeagueList,
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
</style>
