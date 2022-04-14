<template>
  <div class="main">
  <CompetitorTeamSelect v-if="this.$store.state.isShowingMessage"/>
  <CompetitorValidation v-else/>
    <div class="container">
      <ul v-for="team in data.teams" :key="team.id">
        <li>
          <img :src="team.logo" class="team_logo_image" />
          <p>{{ team.name }}</p>
          <button class="button" @click="toggleFollowAndUnfollow(team)">{{ toggleFollowAndUnfollowDisplay(team) }}</button>
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
import { useStore } from 'vuex'
import CompetitorValidation from '../modal/CompetitorValidation.vue'
import CompetitorTeamSelect from '../modal/CompetitorTeamCount.vue'
export default {
  components: {
    CompetitorValidation,
    CompetitorTeamSelect
  },
  setup() {
    const data = reactive({
      teams: [],
      competitors: [],
      isAdding: true,
      isShowing: true
    })

    const store = useStore()

    const setTeam = async () => {
      axios.get('/api/team_filter').then((response) => {
        data.teams = response.data
      })
      .catch(function (error) {
        console.log(error)
      })
    }

    const toggleFollowAndUnfollowDisplay = (team) => {
      if (store.state.competitorTeamId.includes(team.id)) {
        return "解除する"
      } else {
        return "フォローする"
      }
    }

    const toggleFollowAndUnfollow = (team) => {
      if (store.state.competitorTeamId.includes(team.id)) {
        axios.post('/api/competitors', {
          id: team.id
        })
        .catch((error) => {
          console.log(error)
        })
        store.commit('deleteCompetitor', team.id)
      } else if (store.state.competitorTeamId.length >= 3) {
        store.commit('closeMessage')
      } else {
        store.commit('addCompetitor', team.id)
        axios.post('/api/competitors', {
          id: team.id
        })
        .catch(function (error) {
          console.log(error)
        })
      }
    }

    onMounted(setTeam())

    return {
      data,
      toggleFollowAndUnfollow,
      toggleFollowAndUnfollowDisplay,
      addCompetitor: () => store.commit('addCompetitor'),
      deleteCompetitor: () => store.commit('deleteCompetitor'),
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
</style>
