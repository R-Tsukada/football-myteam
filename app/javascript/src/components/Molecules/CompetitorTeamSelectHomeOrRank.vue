<template>
  <div>
    <h2 class="is-size-2-tablet is-size-5-mobile has-text-weight-bold mb-3">
      登録したいチームを選んでください
    </h2>
    <section>
      <CompetitorTeamCount :competitors="competitors" />
      <SelectedCompetitorTeamList
        :teams="teams"
        :competitors="competitors"
        @followTeam="followTeam"
      />
      <div class="back-or-select-buttons mt-4">
        <BackToPageButton
          @click="selectAgain"
          class="is-rounded"
          label="チームの選び方を変更する"
        />
        <CompetitorSelectButton :competitors="competitors" />
      </div>
    </section>
  </div>
</template>
<script>
import CompetitorTeamCount from '../atoms/modal/CompetitorTeamCount.vue'
import CompetitorSelectButton from '../Molecules/BooleanButton/CompetitorSelectButton.vue'
import BackToPageButton from '../atoms/Button/BackToPageButton.vue'
import SelectedCompetitorTeamList from '../Organism/SelectedCompetitorTeamList.vue'
import { defineComponent } from 'vue'

export default defineComponent({
  components: {
    CompetitorTeamCount,
    CompetitorSelectButton,
    BackToPageButton,
    SelectedCompetitorTeamList
  },
  props: {
    teams: {
      type: Array,
      required: true
    },
    competitors: {
      type: Array,
      required: true
    }
  },
  setup(props, { emit }) {
    const followTeam = (team) => {
      emit('followTeam', team)
    }
    const selectAgain = () => {
      emit('selectAgain')
    }
    return {
      followTeam,
      selectAgain
    }
  }
})
</script>
