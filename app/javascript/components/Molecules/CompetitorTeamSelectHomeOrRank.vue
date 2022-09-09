<template>
  <div>
    <h2 class="is-size-2-tablet is-size-5-mobile has-text-weight-bold mb-3">
      登録したいチームを選んでください
    </h2>
    <section>
      <CompetitorTeamCount :competitors="competitors" v-if="isShowingMessage" />
      <CompetitorValidation v-else />
      <SelectedCompetitorTeamList
        :teams="teams"
        :competitors="competitors"
        @followTeam="followTeam" />
      <div class="back-or-select-buttons mt-4">
        <BackToPageButton
          @click="selectAgain"
          class="is-rounded"
          label="チームの選び方を変更する" />
        <CompetitorSelectButton :competitors="competitors" />
      </div>
    </section>
  </div>
</template>
<script>
import CompetitorTeamCount from '../atoms/modal/CompetitorTeamCount.vue'
import CompetitorValidation from '../atoms/modal/CompetitorValidation.vue'
import CompetitorSelectButton from '../Molecules/BooleanButton/CompetitorSelectButton'
import BackToPageButton from '../atoms/Button/BackToPageButton.vue'
import SelectedCompetitorTeamList from '../Organism/SelectedCompetitorTeamList.vue'

export default {
  components: {
    CompetitorTeamCount,
    CompetitorValidation,
    CompetitorSelectButton,
    BackToPageButton,
    SelectedCompetitorTeamList
  },
  props: ['teams', 'competitors', 'isShowingMessage'],
  setup(props, context) {
    const followTeam = (team) => {
      context.emit('followTeam', team)
    }
    const selectAgain = () => {
      context.emit('selectAgain')
    }
    return {
      followTeam,
      selectAgain
    }
  }
}
</script>
