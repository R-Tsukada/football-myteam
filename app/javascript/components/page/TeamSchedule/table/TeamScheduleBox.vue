<template>
  <div clsss="main-page">
    <div class="box standing-data columns mb-3">
      <!--<div class="standing-data column">-->
      <StandingData
        :standings="standings"
        :favoriteTeamPoints="favoriteTeamPoints"
        :favoriteId="favoriteId"
        class="standing-data column is-three-fifths" />
      <!--</div>--><!--standing-data-->
      <!--<div class="match-data column">-->
      <TeamMatches
        :matchSchedules="matchSchedules"
        class="match-data column is-two-fifths" />
      <!--</div>--><!--match-data-->
    </div>
  </div>
  <!--manin-page-->
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
