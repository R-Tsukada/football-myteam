<template>
  <div class="container has-text-centered">
    <div class="notification is-danger is-size-4" v-show="data.isSelected">
      <button class="delete" @click="deleteMessage"></button>
      ライバルチームの選択方法を一つ選んでください
    </div>
    <div v-show="data.isShowing">
      <div
        class="box mb-5 mx-auto"
        style="background-color: #d1d1e9; width: 800px">
        <p
          class="is-size-3-desktop is-size-4-tablet is-size-6-mobile has-text-left-mobile has-text-weight-bold p-3">
          ライバルチームの選び方を選択してください
        </p>
        <div class="v-model-radiobutton has-text-left">
          <label
            class="is-size-4-desktop is-size-6-tablet is-size-8-mobile m-3"
            for="rank">
            <input
              type="radio"
              class="rank mb-4"
              value="rank"
              v-model="data.checkedName" />
            昨シーズンの順位が近いチームを選ぶ</label
          >
          <br />
          <label class="is-size-4-desktop is-size-6-tablet m-3" for="home">
            <input
              type="radio"
              class="home mb-4"
              value="home"
              v-model="data.checkedName" />
            本拠地が近いチームを選ぶ</label
          >
          <br />
          <label class="is-size-4-desktop is-size-6-tablet m-3" for="self">
            <input
              type="radio"
              class="self mb-4"
              value="self"
              v-model="data.checkedName" />
            自分でライバルチームを選ぶ</label
          >
          <br />
        </div>
      </div>
      <button
        class="button is-rounded is-medium mt-5 ml-3 has-text-white"
        style="background-color: #6246ea"
        @click="selectTeam">
        チームの選択方法を決定する
      </button>
      <button class="button is-rounded is-medium mt-5 ml-3">
        <router-link to="/leagues" class="has-text-black"
          >応援しているチームを選び直す</router-link
        >
      </button>
    </div>
    <div v-show="data.isAdding">
      <p
        class="is-size-2-desktop is-size-3-tablet is-size-6-mobile has-text-weight-bold">
        こちらのチームを登録しますか？
      </p>
      <div class="columns is-mobile is-flex-wrap-wrap has-text-centered">
        <div
          class="column is-one-fifth mx-auto"
          v-for="team in data.selectedTeams.slice(0, 3)"
          :key="team.id">
          <div class="card m-1">
            <div class="card-content">
              <div class="content">
                <img :src="team.logo" class="image is-128x128 mx-auto" />
                <p class="has-text-weight-semibold mt-2 is-size-4">
                  {{ team.name }}
                </p>
                <p class="has-text-weight-semibold">
                  2020-2021：{{ team.last_season_rank }}位
                </p>
                <p class="has-text-weight-semibold">
                  本拠地：{{ team.home_city }}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br />
      <button
        class="button is-rounded is-medium mt-2 ml-2"
        style="background-color: #6246ea"
        @click="addCompetitorFollow">
        <router-link to="/schedules" class="has-text-white"
          >上記のチームを登録する</router-link
        >
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
      <TeamListLoader v-if="!data.teams.length" />
      <div v-else>
        <div class="columns is-mobile is-flex-wrap-wrap has-text-centered">
          <div
            class="column is-one-fifth has-text-centered"
            v-for="team in data.teams"
            :key="team.id">
            <div class="card m-1">
              <div
                class="card-content"
                v-bind:class="{
                  'has-background-link-light': data.competitors.some(
                    (competitor) => competitor.team_id === team.id
                  )
                }"
                @click="followTeam(team)">
                <div class="content">
                  <img :src="team.logo" class="image is-128x128 mx-auto" />
                  <p
                    class="has-text-weight-semibold mt-2"
                    v-bind:class="{
                      'has-text-weight-bold has-text-danger':
                        data.competitors.some(
                          (competitor) => competitor.team_id === team.id
                        )
                    }">
                    {{ team.name }}
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <button
        class="button is-rounded is-medium mt-6 ml-2"
        style="background-color: #6246ea"
        v-if="data.competitors.length >= 1">
        <router-link to="/schedules" class="has-text-white"
          >ライバルチームを決定する</router-link
        >
      </button>
      <button class="button is-rounded is-medium mt-6 ml-2" @click="again">
        ライバルチームの選択方法を選び直す
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
import TeamListLoader from '../../loader/TeamListLoader'

export default {
  components: {
    TeamListLoader,
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
input:hover {
  cursor: pointer;
  opacity: 0.6;
}
</style>
