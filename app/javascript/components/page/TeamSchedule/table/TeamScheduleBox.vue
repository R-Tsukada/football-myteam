<template>
  <div clsss="main-page">
    <div
      class="box standing-and-matches columns mb-3"
      @click="selectTeam(standings)">
      <StandingData
        :standings="standings"
        :favoriteTeamPoints="favoriteTeamPoints"
        :favoriteId="favoriteId"
        class="standing-data column is-three-fifths" />
      <TeamMatches
        :matchSchedules="matchSchedules.slice(0, 3)"
        class="match-data column is-two-fifths" />
    </div>
    <!--box-standing-and-matches-->
  </div>
  <!--manin-page-->
</template>

<script>
import TeamMatches from './TeamMatches'
import StandingData from './StandingData'
import { useRouter } from 'vue-router'
import { useStore } from 'vuex'

export default {
  props: ['standings', 'matchSchedules', 'favoriteTeamPoints', 'favoriteId'],
  components: {
    TeamMatches,
    StandingData
  },
  setup() {
    const router = useRouter()

    const store = useStore()

    const selectTeam = (standings) => {
      store.commit('teamId', standings.team_id)
      router.push({ name: 'show', params: { id: store.state.teamId } })
    }

    return {
      selectTeam
    }
  }
}
</script>
