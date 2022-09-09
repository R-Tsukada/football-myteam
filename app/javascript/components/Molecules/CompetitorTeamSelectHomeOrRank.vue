<template>
  <div>
    <h2 class="is-size-2-tablet is-size-5-mobile has-text-weight-bold mb-3">
      登録したいチームを選んでください
    </h2>
    <section>
      <CompetitorTeamCount :competitors="competitors" v-if="isShowingMessage" />
      <CompetitorValidation v-else />
      <div class="columns is-multiline is-mobile">
        <div class="column mx-auto" v-for="team in teams" :key="team.id">
          <div
            class="card has-hover-action select-button"
            @click="followTeam(team)"
            v-bind:class="{
              'has-background-link-light is-selected': competitors.some(
                (competitor) => competitor.team_id === team.id
              )
            }">
            <img
              :src="team.logo"
              class="image competitor-team-logo mx-auto pt-1" />
            <p
              class="has-text-weight-medium mt-2 is-size-2-tablet is-size-7-mobile">
              {{ team.name }}
            </p>
            <p class="has-text-weight-medium is-size-3-tablet is-size-5-mobile">
              <span class="is-size-5-tablet is-size-7-mobile">21-22:</span
              >{{ team.last_season_rank }}<span>位</span>
            </p>
            <p class="has-text-weight-medium is-size-3-tablet is-size-5-mobile">
              <span class="is-size-5-tablet is-size-7-mobile">Home:</span
              >{{ team.home_city }}
            </p>
          </div>
          <!-- card -->
        </div>
        <!-- column -->
      </div>
      <!-- columns -->
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
import CompetitorTeamCount from '../modal/CompetitorTeamCount.vue'
import CompetitorValidation from '../modal/CompetitorValidation.vue'
import CompetitorSelectButton from '../Molecules/BooleanButton/CompetitorSelectButton'
import BackToPageButton from '../atoms/Button/BackToPageButton.vue'

export default {
  components: {
    CompetitorTeamCount,
    CompetitorValidation,
    CompetitorSelectButton,
    BackToPageButton
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
