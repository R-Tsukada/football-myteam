<template>
  <div class="has-text-centered pt-5">
    <div class="notification is-danger is-size-4" v-show="data.isSelected">
      <button class="delete" @click="deleteMessage"></button>
      ライバルチームの選択方法を最低でも一つ選んでください
    </div>
    <div v-show="data.isShowing">
      <div class="container is-widescreen mb-5">
        <div class="notification">
          <p
            class="is-size-3-desktop is-size-4-tablet is-size-6-mobile has-text-left-mobile has-text-weight-bold p-3">
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
      <button class="button is-rounded is-medium mt-5 ml-3 has-text-white" style="background-color: #6246ea" @click="selectTeam">
        チームの選択方法を決定する
      </button>
      <button class="button is-rounded is-medium mt-5 ml-3">
        <router-link to="/leagues" class="has-text-black">応援しているチームを選び直す</router-link>
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
      <button
        class="button is-rounded is-medium mt-2 ml-2"
        style="background-color: #6246ea"
        @click="addCompetitorFollow">
        <router-link to="/schedules" class="has-text-white">上記のチームを登録する</router-link>
      </button>
      <button class="button is-rounded is-medium mt-2 ml-2" @click="again">
        チームの選び方を変更する
      </button>
    </div>
    <div v-show="data.isFreeSelect">
      <CompetitorTeamCount
        :competitors="data.competitors"
        v-if="data.isShowingMessage" />
      <CompetitorValidation v-else />
      <div class="container">
        <ul v-for="team in data.teams" :key="team.id">
          <li
            class="mt-5 mx-6 p-2 has-text-centered"
            v-bind:class="{
              'has-background-link-light': data.competitors.some(
                (competitor) => competitor.team_id === team.id
              )
            }"
            @click="followTeam(team)">
            <img :src="team.logo" class="image is-128x128" />
            <p
              class="has-text-weight-semibold"
              v-bind:class="{
                'has-text-weight-bold has-text-danger': data.competitors.some(
                  (competitor) => competitor.team_id === team.id
                )
              }">
              {{ team.name }}
            </p>
          </li>
        </ul>
      </div>
      <br />
      <button class="button is-rounded is-medium mt-2 ml-2">
        <router-link to="/">応援しているチームを選び直す</router-link>
      </button>
      <button class="button is-rounded is-medium mt-2 ml-2" @click="again">
        ライバルチームの選択方法を選び直す
      </button>
      <br />
      <button
        class="button is-rounded is-medium mt-2 ml-2"
        v-if="data.competitors.length >= 1">
        <router-link to="/schedules"
          >ライバルチームの選択を終了する</router-link
        >
      </button>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { reactive, onMounted } from 'vue'
import { useStore } from 'vuex'
import CompetitorValidation from '../../modal/CompetitorValidation.vue'
import CompetitorTeamCount from '../../modal/CompetitorTeamCount.vue'
export default {
  components: {
    CompetitorValidation,
    CompetitorTeamCount
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
      isFreeSelect: false,
      isSelected: false,
      isShowingMessage: true
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

    const setCompetitors = async () => {
      axios
        .get('/api/competitors')
        .then((response) => {
          data.competitors = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
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

    // 自動登録の処理
    const autoSelect = () => {
      if (data.checkedName === 'home') {
        data.selectedTeams = data.teams.filter(
          (teams) => teams.home_city === data.favorite.team.home_city
        )
        data.isShowing = false
        data.isAdding = true
        data.isSelected = false
      } else if (data.checkedName === 'rank') {
        data.selectedTeams = data.teams.filter(
          (teams) =>
            teams.last_season_rank ===
              data.favorite.team.last_season_rank - 1 ||
            teams.last_season_rank === data.favorite.team.last_season_rank + 1
        )
        data.isShowing = false
        data.isAdding = true
        data.isSelected = false
      } else if (data.checkedName === '') {
        data.isSelected = true
      } else {
        data.isShowing = false
        data.isFreeSelect = true
        data.isSelected = false
      }
    }

    const deleteMessage = () => {
      data.isSelected = false
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

    // 自分でチームを選択する
    const followTeam = (team) => {
      selectCompetitorTeams(team.id)
      data.competitors.some((competitor) => competitor.team_id === team.id)
        ? (data.competitors = data.competitors.filter(
            (competitor) => competitor.team_id !== team.id
          ))
        : data.competitors.push({ team_id: team.id })
    }

    const selectCompetitorTeams = (team_id) => {
      axios
        .post('/api/competitors', {
          id: team_id
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    onMounted(setTeam(), setFavorite(), setCompetitors())

    return {
      data,
      selectCompetitorTeams,
      addCompetitor: () => store.commit('addCompetitor'),
      deleteCompetitor: () => store.commit('deleteCompetitor'),
      autoSelect,
      selectTeam,
      again,
      addCompetitorFollow,
      deleteMessage,
      followTeam
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

.notification {
  background-color: #d1d1e9;
}
</style>
