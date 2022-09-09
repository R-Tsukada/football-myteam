<template>
  <div class="container has-text-centered">
    <!-- ライバルチーム選択方法を選んでもらう -->
    <div v-show="data.isShowing">
      <div class="mx-auto">
        <h2
          class="is-size-2-tablet is-size-5-mobile has-text-left-mobile has-text-weight-bold p-3">
          ライバルチームの選び方を選択してください
        </h2>
        <div class="columns is-multiline is-centered mt-4 mx-auto">
          <div
            class="v-model-radiobutton column is-one-quarter-fullhd is-one-third-widescreen is-half-desktop is-half-tablet has-text-left">
            <label class="has-text-weight-medium" for="rank">
              <input
                type="radio"
                class="how-to-team-select rank mb-4"
                value="rank"
                v-model="data.checkedName" />
              昨シーズンの順位が近いチームを選ぶ</label
            >
            <br />
            <label class="has-text-weight-medium" for="home">
              <input
                type="radio"
                class="how-to-team-select home mb-4"
                value="home"
                v-model="data.checkedName" />
              本拠地が近いチームを選ぶ</label
            >
            <br />
            <label class="has-text-weight-medium" for="self">
              <input
                type="radio"
                class="how-to-team-select self mb-4"
                value="self"
                v-model="data.checkedName" />
              自分でライバルチームを選ぶ</label
            >
          </div>
          <!-- v-model-radiobutton -->
        </div>
        <!-- columns -->
      </div>
      <!-- v-show -->
      <router-link to="/leagues">
        <BackToPageButton
          class="is-rounded mx-auto"
          label="応援しているチームを選び直す" />
      </router-link>
      <BaseButton
        v-if="data.checkedName.length === 0"
        class="is-rounded color-button"
        label="チームの選択方法を決定する"
        title="Disabled button"
        disabled />
      <DetermineButton
        v-else
        class="color-button is-rounded has-text-white"
        label="チームの選択方法を決定する"
        @click="selectTeam" />
    </div>
    <!-- has-text-centered -->
    <!--ライバルチームの選択方法を選んでもらったあと-->
    <div v-show="data.isAdding">
      <CompetitorTeamSelectHomeOrRank
        :competitors="data.competitors"
        :isShowingMessage="data.isShowingMessage"
        :teams="data.selectedTeams"
        @followTeam="followTeam"
        @selectAgain="selectAgain" />
    </div>
    <!--自分でチーム選んでもらう -->
    <div v-if="data.isFreeSelect">
      <CompetitorTeamSelectSelf
        :teams="data.teams"
        :competitors="data.competitors"
        :isShowingMessage="data.isShowingMessage"
        @selectTeam="followTeam"
        @selectAgain="selectAgain" />
    </div>
    <!-- v-if -->
  </div>
  <!-- container -->
</template>
<script>
import axios from 'axios'
import { reactive, onMounted } from 'vue'
import CompetitorValidation from '../../modal/CompetitorValidation.vue'
import CompetitorTeamCount from '../../modal/CompetitorTeamCount.vue'
import BackToPageButton from '../../atoms/Button/BackToPageButton.vue'
import BaseButton from '../../atoms/Button/BaseButton.vue'
import DetermineButton from '../../atoms/Button/DetermineButton'
import CompetitorSelectButton from '../../Molecules/BooleanButton/CompetitorSelectButton'
import CompetitorTeamSelectSelf from '../../Molecules/CompetitorTeamSelectSelf.vue'
import CompetitorTeamSelectHomeOrRank from '../../Molecules/CompetitorTeamSelectHomeOrRank.vue'

export default {
  components: {
    CompetitorValidation,
    CompetitorTeamCount,
    BackToPageButton,
    BaseButton,
    DetermineButton,
    CompetitorSelectButton,
    CompetitorTeamSelectSelf,
    CompetitorTeamSelectHomeOrRank
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
