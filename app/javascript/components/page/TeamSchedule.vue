<template>
  <div class="container">
    <table class="table">
      <thead>
        <tr>
          <th><abbr title="Position">順位</abbr></th>
          <th><abbr title="Team">チーム</abbr></th>
          <th>
            <abbr title="Points">勝点<br />(勝ち点差)</abbr>
          </th>
          <th><abbr title="Played">試合数</abbr></th>
          <th><abbr title="Shedule">次節以降の試合</abbr></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="schedule in data.schedules" :key="schedule.id">
          <th>{{ schedule.rank }}</th>
          <th><img :src="schedule.team_logo" class="image is-48x48" /></th>
          <th>{{ schedule.points }}</th>
          <th>{{ schedule.played }}</th>
          <th></th>
        </tr>
      </tbody>
    </table>
    <br>
    <button class="button"><router-link to="/">応援しているチームを選び直す</router-link></button>
    <br>
    <button class="button"><router-link to="/competitors">ライバルチームを選び直す</router-link></button>
  </div>
</template>
<script>
import axios from 'axios'
import { reactive, onMounted } from 'vue'

export default {
  setup() {
    const data = reactive({
      schedules: []
    })

    const setSchedules = async () => {
      axios.get('/api/standings').then((response) => {
        data.schedules = response.data
      })
    }

    onMounted(() => {
      setSchedules()
    })

    return {
      data,
      setSchedules
    }
  }
}
</script>
<style lang="scss">
@import 'bulma/bulma.sass';

.container {
  text-align: center;
}
</style>
