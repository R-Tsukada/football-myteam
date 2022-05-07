<template>
  <div class="has-text-centered pt-5">
    <div v-show="data.isShowing">
      <div class="container is-widescreen">
        <div class="notification is-light">
          <p
            class="is-size-2-desktop is-size-3-tablet is-size-6-mobile has-text-left-mobile has-text-weight-bold">
            ライバルチームの選び方を選択してください
          </p>
          <div class="v-model-radiobutton has-text-left">
            <input
              type="radio"
              class="rank mb-4"
              value="rank"
              v-model="data.checkedName" />
            <label
              class="is-size-4-desktop is-size-6-tablet is-size-8-mobile m-3"
              for="rank"
              >昨シーズンの順位が近いチームを選ぶ</label
            >
            <br />
            <input
              type="radio"
              class="home mb-4"
              value="home"
              v-model="data.checkedName" />
            <label class="is-size-4-desktop is-size-6-tablet m-3" for="home"
              >本拠地が近いチームを選ぶ</label
            >
            <br />
            <input
              type="radio"
              class="self mb-4"
              value="self"
              v-model="data.checkedName" />
            <label class="is-size-4-desktop is-size-6-tablet m-3" for="self"
              >自分でライバルチームを選ぶ</label
            >
            <br />
          </div>
        </div>
      </div>
      <button class="button is-rounded is-medium mt-4 ml-3" @click="selectTeam">
        チームの選択方法を決定する
      </button>
      <button class="button is-rounded is-medium mt-4 ml-3">
        <router-link to="/leagues">応援しているチームを選び直す</router-link>
      </button>
    </div>
    <div v-show="data.isAdding">
      <p
        class="is-size-2-desktop is-size-3-tablet is-size-6-mobile has-text-weight-bold">
        こちらのチームを登録しますか？
      </p>
      <div class="container">
        <ul v-for="team in data.selectedTeams.slice(0, 3)" :key="team.id">
          <li class="mt-5 mx-6 p-2">
            <img :src="team.logo" class="image is-128x128" />
            <p class="has-text-weight-semibold">{{ team.name }}</p>
            <p class="has-text-weight-semibold">
              2020-2021：{{ team.last_season_rank }}位
            </p>
            <p class="has-text-weight-semibold">本拠地：{{ team.home_city }}</p>
          </li>
        </ul>
      </div>
      <br />
      <button class="button is-rounded is-medium mt-2 ml-2" @click="addCompetitorFollow">
        <router-link to="/schedules">上記のチームを登録する</router-link>
      </button>
      <button class="button is-rounded is-medium mt-2 ml-2" @click="again">
        チームの選び方を変更する
      </button>
      <button class="button is-rounded is-medium mt-2 ml-3">
        <router-link to="/">応援しているチームを選び直す</router-link>
      </button>
    </div>
    <div v-show="data.isFreeSelect">
      <CompetitorTeamSelect v-if="this.$store.state.isShowingMessage" />
      <CompetitorValidation v-else />
      <div class="container">
        <ul v-for="team in data.teams" :key="team.id">
          <li class="mt-5 mx-6 p-2 has-text-centered">
            <img :src="team.logo" class="image is-128x128" />
            <p class="has-text-weight-semibold">{{ team.name }}</p>
            <button class="button mt-2" @click="toggleFollowAndUnfollow(team)">
              {{ toggleFollowAndUnfollowDisplay(team) }}
            </button>
          </li>
        </ul>
      </div>
      <br />
      <button class="button is-rounded is-medium mt-2 ml-2">
        <router-link to="/">応援しているチームを選び直す</router-link>
      </button>
      <button class="button is-rounded is-medium mt-2 ml-2" @click="again">ライバルチームの選択方法を選び直す</button>
      <br />
      <button class="button is-rounded is-medium mt-2 ml-2" v-if="this.$store.state.competitorTeamId.length >= 1">
        <router-link to="/schedules">ライバルチームの選択を終了する</router-link>
      </button>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { reactive, onMounted } from 'vue'
import { useStore } from 'vuex'
import CompetitorValidation from '../../modal/CompetitorValidation.vue'
import CompetitorTeamSelect from '../../modal/CompetitorTeamCount.vue'
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
      isAdding: false,
      isFreeSelect: false
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
        })
        .catch(function (error) {
          console.log(error)
        })
    }

    const autoSelect = () => {
      data.isShowing = false
      if (data.checkedName === 'home') {
        data.selectedTeams = data.teams.filter(
          (teams) => teams.home_city === data.favorite.team.home_city
        )
        data.isAdding = true
      } else if (data.checkedName === 'rank') {
        data.selectedTeams = data.teams.filter(
          (teams) =>
            teams.last_season_rank ===
              data.favorite.team.last_season_rank - 1 ||
            teams.last_season_rank === data.favorite.team.last_season_rank + 1
        )
        data.isAdding = true
      } else {
        data.isFreeSelect = true
      }
    }

    const again = () => {
      data.isShowing = true
      data.isAdding = false
      data.isFreeSelect = false
    }

    const selectTeam = () => {
      autoSelect()
    }

    const addCompetitorFollow = () => {
      const teamId = data.selectedTeams.slice(0, 3).map((team) => team.id)
      teamId.forEach((id) =>
        axios
          .post('/api/competitors', {
            id: id
          })
          .catch(function (error) {
            console.log(error)
          })
      )
      teamId.map((id) => store.commit('addCompetitor', id))
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
      again,
      addCompetitorFollow
    }
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
}
</style>
