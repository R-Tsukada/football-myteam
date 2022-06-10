<template>
  <div class="container has-text-centered">
    <!-- ライバルチーム選択方法を選んでもらう -->
    <div class="notification is-danger is-size-4" v-show="data.isSelected">
      <button class="delete" @click="deleteMessage"></button>
      ライバルチームの選択方法を一つ選んでください
    </div>
    <!-- notification -->
    <div v-show="data.isShowing">
      <div class="box how-to-competitor-team-select mb-5 mx-auto">
        <p
          class="is-size-2-tablet is-size-5-mobile has-text-left-mobile has-text-weight-bold p-3">
          ライバルチームの選び方を選択してください
        </p>
        <div class="v-model-radiobutton has-text-left">
          <label
            class="is-size-3-tablet is-size-7-mobile has-text-weight-medium"
            for="rank">
            <input
              type="radio"
              class="how-to-team-select rank mb-4"
              value="rank"
              v-model="data.checkedName" />
            昨シーズンの順位が近いチームを選ぶ</label
          >
          <br />
          <label
            class="is-size-3-tablet is-size-7-mobile has-text-weight-medium"
            for="home">
            <input
              type="radio"
              class="how-to-team-select home mb-4"
              value="home"
              v-model="data.checkedName" />
            本拠地が近いチームを選ぶ</label
          >
          <br />
          <label
            class="is-size-3-tablet is-size-7-mobile has-text-weight-medium"
            for="self">
            <input
              type="radio"
              class="how-to-team-select self mb-4"
              value="self"
              v-model="data.checkedName" />
            自分でライバルチームを選ぶ</label
          >
          <br />
        </div>
        <!-- v-model-radiobutton -->
      </div>
      <!-- v-show -->
      <button
        class="color-button button is-rounded is-medium mt-5 ml-3 has-text-white is-size-4-tablet is-size-7-mobile"
        @click="selectTeam">
        チームの選択方法を決定する
      </button>
      <button
        class="button is-rounded is-medium mt-5 ml-3 has-text-white is-size-4-tablet is-size-7-mobile">
        <router-link to="/leagues" class="has-text-black"
          >応援しているチームを選び直す</router-link
        >
      </button>
    </div>
    <!-- has-text-centered -->
    <!--ライバルチームの選択方法を選んでもらったあと-->
    <div v-show="data.isAdding">
      <CompetitorTeamCount
        :competitors="data.competitors"
        v-if="data.isShowingMessage" />
      <CompetitorValidation v-else />
      <h3 class="is-size-2-tablet is-size-5-mobile has-text-weight-bold mb-3">
        登録したいチームを選んでください
      </h3>
      <div class="columns is-mobile">
        <div
          class="column mx-auto"
          v-for="team in data.selectedTeams"
          :key="team.id">
          <div
            class="card has-hover-action select-button"
            @click="followTeam(team)"
            v-bind:class="{
              'has-background-link-light is-selected': data.competitors.some(
                (competitor) => competitor.team_id === team.id
              )
            }">
            <img
              :src="team.logo"
              class="image competitor-team-logo mx-auto pt-1" />
            <p
              class="has-text-weight-medium mt-2 is-size-4-tablet is-size-7-mobile">
              {{ team.name }}
            </p>
            <p class="has-text-weight-medium is-size-4-tablet is-size-7-mobile">
              {{ team.last_season_rank }}位
            </p>
            <p class="has-text-weight-medium is-size-4-tablet is-size-7-mobile">
              {{ team.home_city }}
            </p>
          </div>
          <!-- card -->
        </div>
        <!-- column -->
      </div>
      <!-- columns -->
      <br />
      <button
        class="color-button button is-rounded is-medium mt-2 ml-2 is-size-4-tablet is-size-7-mobile"
      >
        <router-link to="/schedules" class="has-text-white"
          >選んだチームを登録する</router-link
        >
      </button>
      <button
        class="button is-rounded is-medium mt-2 ml-2 is-size-4-tablet is-size-7-mobile"
        @click="selectAgain">
        チームの選び方を変更する
      </button>
    </div>
    <!--自分でチーム選んでもらう -->
    <!-- v-show -->
    <div v-show="data.isFreeSelect">
      <CompetitorTeamCount
        :competitors="data.competitors"
        v-if="data.isShowingMessage" />
      <CompetitorValidation v-else />
      <TeamListLoader v-if="!data.teams.length" />
      <div v-else>
        <div class="columns is-mobile is-flex-wrap-wrap has-text-centered">
          <div
            class="column is-one-fifth-tablet is-one-third-mobile has-text-centered"
            v-for="team in data.teams"
            :key="team.id">
            <div
              class="card has-hover-action select-button"
              @click="followTeam(team)"
              v-bind:class="{
                'has-background-link-light is-selected': data.competitors.some(
                  (competitor) => competitor.team_id === team.id
                )
              }">
              <img :src="team.logo" class="image team-logo mx-auto" />
              <p
                class="has-text-weight-semibold mt-2 is-size-6-tablet is-size-7-mobile is-break-all">
                {{ team.name }}
              </p>
            </div>
            <!-- card -->
          </div>
          <!-- column -->
        </div>
        <!-- columns -->
      </div>
      <!-- v-else -->
      <button
        class="color-button button is-rounded is-medium mt-4 ml-2 is-size-4-tablet is-size-7-mobile"
        v-if="data.competitors.length >= 1">
        <router-link to="/schedules" class="has-text-white"
          >ライバルチームを決定する</router-link
        >
      </button>
      <button
        class="button is-rounded is-medium mt-4 ml-2 is-size-4-tablet is-size-7-mobile"
        @click="selectAgain">
        チームの選択方法を選び直す
      </button>
    </div>
    <!-- v-show -->
  </div>
  <!-- container -->
</template>

<script>
import axios from 'axios'
import { reactive, onMounted } from 'vue'
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
    const selectTeam = () => {
      autoSelect()
    }

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

    const selectAgain = () => {
      data.isShowing = true
      data.isAdding = false
      data.isFreeSelect = false
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
      autoSelect,
      selectTeam,
      selectAgain,
      deleteMessage,
      followTeam
    }
  }
}
</script>
