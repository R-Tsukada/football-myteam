<template>
  <div class="main">
    <div class="container">
      <ul v-for="team in data.teams" :key="team.id">
        <li @click="selectTeam(team)">
          <img :src="team.logo" class="team_logo_image" />
          <p>{{ team.name }}</p>
        </li>
      </ul>
    </div>
    <button class="button" v-if="data.isAdding" @click="addCompetitorTeams">
      ライバルチームとして登録する
    </button>
    <br />
    <button class="button">
      <router-link to="/">応援しているチームを選び直す</router-link>
    </button>
    <br />
    <button class="button">
      <router-link to="/schedules">ライバルチームの選択を終了する</router-link>
    </button>
  </div>
</template>

<script>
import axios from 'axios'
import { reactive, onMounted } from 'vue'
/* import { useStore } from 'vuex' */


export default {
  setup() {
    const data = reactive({
      teams: [],
      isAdding: true,
      isShowing: true
    })

    const setTeam = async () => {
      axios.get('/api/teams').then((response) => {
        data.teams = response.data
      })
      .then(function (response) {
        console.log(response)
      })
      .catch(function (error) {
        console.log(error)
      })
    }

    onMounted(() => {
      setTeam()
    })

    return {
      data
    }
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

.borderColor {
  border: solid 2px red;
}
</style>
