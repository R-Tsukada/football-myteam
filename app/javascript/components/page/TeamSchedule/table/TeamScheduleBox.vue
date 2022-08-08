<template>
  <div clsss="main-page columns">
    <div class="standing-data column">
      <StandingData
        :standings="standings"
        :favoriteTeamPoints="favoriteTeamPoints"
        :favoriteId="favoriteId"
      />
    </div><!--standing-data-->
    <div class="match-data column is-two-fifths">
      <TeamMatches :matchSchedules="matchSchedules"/>
    </div><!--match-data-->
  </div><!--manin-page-->
</template>

<script>
import TeamMatches from './TeamMatches'
import StandingData from './StandingData'

export default {
  props: ['standings', 'matchSchedules', 'favoriteTeamPoints', 'favoriteId'],
  components: {
    TeamMatches,
    StandingData
  }
}
</script>
