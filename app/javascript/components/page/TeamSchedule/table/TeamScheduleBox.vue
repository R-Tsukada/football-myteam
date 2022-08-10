<template>
  <div clsss="main-page">
    <div class="box standing-data columns mb-3" @click="selectTeam(standings)">
      <StandingData
        :standings="standings"
        :favoriteTeamPoints="favoriteTeamPoints"
        :favoriteId="favoriteId"
        class="standing-data column is-three-fifths" />
      <TeamMatches
        :matchSchedules="matchSchedules"
        class="match-data column is-two-fifths" />
    </div>
    <!--box-standing-data-->
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
