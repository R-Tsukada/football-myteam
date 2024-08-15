<template>
  <div>
    <h2
      class="is-size-2-tablet is-size-5-mobile has-text-left-mobile has-text-weight-bold p-3 mt-5"
    >
      ライバルチームを最大3チームまで選んでください
    </h2>
    <section>
      <CompetitorTeamCount :competitors="competitors" v-if="isShowingMessage" />
      <CompetitorValidation v-else />
      <TeamListLoader v-if="!teams.length" />
      <CompetitorTeamList
        v-else
        :teams="teams"
        :competitors="competitors"
        @selectTeam="selectTeam"
      />
      <div class="back-or-select-buttons mt-4">
        <BackToPageButton
          class="is-rounded mb-3"
          label="チームの選択方法を選び直す"
          @click="selectAgain"
        />
        <CompetitorSelectButton :competitors="competitors" />
      </div>
      <!-- buttons -->
    </section>
  </div>
</template>
<script>
import CompetitorTeamList from '../Organism/CompetitorTeamList.vue'
import CompetitorTeamCount from '../atoms/modal/CompetitorTeamCount.vue'
import TeamListLoader from '../atoms/loader/TeamListLoader.vue'
import BackToPageButton from '../atoms/Button/BackToPageButton.vue'
import CompetitorSelectButton from '../Molecules/BooleanButton/CompetitorSelectButton.vue'

export default {
  components: {
    CompetitorTeamList,
    CompetitorTeamCount,
    TeamListLoader,
    BackToPageButton,
    CompetitorSelectButton
  },
  props: ['teams', 'competitors', 'isShowingMessage'],
  setup(props, context) {
    const selectTeam = (team) => {
      context.emit('selectTeam', team)
    }

    const selectAgain = () => {
      context.emit('selectAgain')
    }

    return {
      selectTeam,
      selectAgain
    }
  }
}
</script>
