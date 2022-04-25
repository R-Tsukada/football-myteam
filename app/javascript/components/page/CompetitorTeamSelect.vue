<template>
  <div class="main">
    <div  v-show="data.isShowing">
      <div class="container is-widescreen">
        <div class="notification is-light">
          <div class="v-model-radiobutton">
            <input type="radio" class="rank" value="rank" v-model="data.checkedName" />
            <label for="rank">順位が近いチームを選ぶ（自動選択）</label>
            <br />
            <input type="radio" class="home" value="home" v-model="data.checkedName" />
            <label for="home">本拠地が近いチームを選ぶ（自動選択）</label>
            <br />
            <input type="radio" class="self" value="self" v-model="data.checkedName" />
            <label for="self">自分でライバルチームを選ぶ</label>
            <br />
          </div>
        </div>
      </div>
      <button class="button" @click="selectTeam">決定する</button>
    </div>
    <div v-show="data.isAdding">
      <CompetitorTeamSelect v-if="this.$store.state.isShowingMessage" />
      <CompetitorValidation v-else />
      <div class="container">
        <ul v-for="team in data.selectedTeams" :key="team.id">
          <li>
            <img :src="team.logo" class="team_logo_image" />
            <p>{{ team.name }}</p>
            <button class="button" @click="toggleFollowAndUnfollow(team)">
              {{ toggleFollowAndUnfollowDisplay(team) }}
            </button>
          </li>
        </ul>
      </div>
      <button class="button" @click="again">もう一度選び直す</button>
      <button class="button">
        <router-link to="/">応援しているチームを選び直す</router-link>
      </button>
      <br />
      <button class="button">
        <router-link to="/schedules">ライバルチームの選択を終了する</router-link>
      </button>
    </div>
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
      favorite: [],
      checkedName: '',
      selectedTeams: [],
      isShowing: true,
      isAdding: false
    })

    const store = useStore()

    const setTeam = async () => {
      axios
        .get('/api/team_filter')
        .then((response) => {
          data.teams = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    }

    const toggleFollowAndUnfollowDisplay = (team) => {
      if (store.state.competitorTeamId.includes(team.id)) {
        return '解除する'
      } else {
        return 'フォローする'
      }
    }

    const toggleFollowAndUnfollow = (team) => {
      if (store.state.competitorTeamId.includes(team.id)) {
        axios
          .post('/api/competitors', {
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
        axios
          .post('/api/competitors', {
            id: team.id
          })
          .catch(function (error) {
            console.log(error)
          })
      }
    }

    const setFavorite = async () => {
      axios
        .get('/api/favorites')
        .then((response) => {
          data.favorite = response.data
          console.log(data.favorite.team.home_city)
        })
        .catch(function (error) {
          console.log(error)
        })
    }

    const autoSelect = () => {
      data.isShowing = false
      data.isAdding = true
      if (data.checkedName === 'home') {
        data.selectedTeams = data.teams.filter(teams => teams.home_city === data.favorite.team.home_city)
      } else {
        data.selectedTeams = data.teams
      }
    }

    const again = () => {
      data.isShowing = true
      data.isAdding = false
    }

    const selectTeam = () => {
      autoSelect()
    }

    onMounted(setTeam(), setFavorite())

    return {
      data,
      toggleFollowAndUnfollow,
      toggleFollowAndUnfollowDisplay,
      addCompetitor: () => store.commit('addCompetitor'),
      deleteCompetitor: () => store.commit('deleteCompetitor'),
      autoSelect,
      selectTeam,
      again
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

/* .v-model-radiobutton { */
/*   width: 80%; */
/*   text-align: center; */
/* } */

.v-model-radiobutton label {
  font-size: 24px;
}
</style>
