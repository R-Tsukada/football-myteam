<template>
  <div class="container">
    <table class="table">
      <thead>
        <tr>
          <th><abbr title="Position">順位</abbr></th>
          <th><abbr title="Team">チーム</abbr></th>
          <th><abbr title="Points">勝点<br>(勝ち点差)</abbr></th>
          <th><abbr title="Played">試合数</abbr></th>
          <th><abbr title="Shedule">次節以降の試合</abbr></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="schedule in schedules" :key="schedule.id">
          <th>{{ schedule.rank }}</th>
          <th><img :src="schedule.team_logo" class = "image is-48x48"/></th>
          <th>{{ schedule.points }}</th>
          <th>{{ schedule.played }}</th>
          <th></th>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  data() {
    return {
      schedules: []
    }
  },
  methods: {
    setSchedules: function () {
      axios.get('/api/standings').then((response) => {
        this.schedules = response.data
      })
    }
  },
  mounted() {
    this.setSchedules()
  }
}
</script>
<style lang="scss">
@import "bulma/bulma.sass";

.container {
  text-align: center;
}

</style>
