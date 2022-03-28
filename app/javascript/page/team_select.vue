<template>
  <div>
    <div class="container">
      <ul v-for="league in leagues" :key="league.id">
        <li @click="selectLeague(league)">
          <img :src="league.logo" class="logo_image" />
          <p>{{ league.name }}</p>
        </li>
      </ul>
    </div>
    <div class="container">
      <ul v-for="team in teamFilter" :key="team.id">
        <li @click="selectTeam(team)">
          <img :src="team.logo" class="logo_image" />
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
      leagues: 'leagues',
      teams: [],
      leagueId: ''
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
    },
    selectLeague: function (league) {
      this.leagueId = league.id
    }
  },
  computed: {
    teamFilter() {
      const number = this.leagueId
      return this.teams.filter(function (value) {
        return value.league_id === number
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
