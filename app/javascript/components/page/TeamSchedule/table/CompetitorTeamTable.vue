<template>
  <div class="favorite-team-standing box columns mt-2">
    <div class="favorite-team-name-and-rank favorte-team-border-right column is-one-third">
      <div class="columns">
        <div class="favorite-team column">
          <div class="favorite-team-rank has-text-centered">
            <p><span class="is-size-1 has-text-weight-bold">{{ standings.rank }}</span>位</p>
          </div><!-- favorite-team-rank -->
        </div><!-- favorite-team column-->
        <div class="favorite-team-logo column">
          <img
            :src="standings.team_logo"
            alt="standings-favorite-team-logo"
            class="image" />
        </div><!-- favorite-team-logo column-->
        <div class="favorite-team-name my-auto column">
          <p class="has-text-weight-bold is-size-3">{{ standings.team_name }}</p>
        </div><!-- favorite-team-name column-->
      </div><!-- columns -->
    </div><!-- favorite-team-name-and-rank -->
    <div class="favorite-team-points favorte-team-border-right column is-2 has-text-centered">
      <p>勝点</p>
      <p><span class="is-size-1 has-text-weight-bold">{{ standings.points }}</span>点</p>
      <p
        v-bind:class="
          favoriteTeamPoints >= standings.points
              ? 'has-text-success'
              : 'has-text-danger'
      ">
        勝ち点差<span class="has-text-weight-bold">{{ favoriteTeamPoints - standings.points }}</span>点
      </p>
    </div><!-- points -->
    <div class="favorite-team-played favorte-team-border-right column is-2 has-text-centered">
      <p>試合数</p>
      <p><span class="is-size-1 has-text-weight-bold">{{ standings.played }}</span>試合</p>
      <p class="has-text-grey-light has-text-weight-bold">残り{{ gameCount - standings.played }}試合</p>
    </div><!-- favorite-team-played -->
    <div class="favorite-team-schedules column ml-3">
      <div class="next-match columns is-gapless has-text-centered" v-for="match in matchSchedules" :key="match.id">
        <img
          :src="match.competition_logo"
          alt="favorite-team-next-match"
          class="image next-match-competition-logo column is-3" />
          <p class="next-match-venu column is-2 has-text-white"
            v-bind:class="
            data.isHome === match.home_and_away
              ? 'has-background-success'
              : 'has-background-danger'
          ">
            {{ match.home_and_away }}
          </p>
          <p class="column is-3 next-match-date">
            {{ match.date }}
          </p>
          <img
            :src="match.team_logo"
            alt="match-team-logo"
            class="image next-match-competition-logo column" />
          <p class="column is-1 has-text-weight-bold is-size-4">vs</p>
          <p class="match-name column is-2 has-text-weight-bold" >{{ match.team_name }}</p>
      </div><!-- v-for -->
    </div><!-- favorite-team-schedules -->
  </div><!-- favorite-team-standing box columns-->
</template>

<script>
import { useRouter } from 'vue-router'
import { useStore } from 'vuex'
import { reactive, onMounted, computed } from 'vue'
import axios from 'axios'

export default {
  props: ['standings', 'matchSchedules', 'favoriteTeamPoints'],
  setup() {
    const router = useRouter()

    const store = useStore()

    const data = reactive({
      isHome: 'HOME',
      teams: []
    })

    const selectTeam = (standings) => {
      store.commit('teamId', standings.team_id)
      router.push({ name: 'show', params: { id: store.state.teamId } })
    }

    const setTeams = async () => {
      axios
        .get('/api/team_filter')
        .then((response) => {
          data.teams = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    onMounted(setTeams())

    const gameCount = computed(() => data.teams.length * 2)

    return {
      selectTeam,
      setTeams,
      gameCount,
      data,
      addShedulesParams: () => store.commit('addShedulesParams')
    }
  }
}
</script>
