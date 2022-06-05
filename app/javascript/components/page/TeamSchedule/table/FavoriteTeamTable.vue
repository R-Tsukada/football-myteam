<template>
  <tr @click="selectTeam(standings)">
    <td>{{ standings.rank }}</td>
    <td>
      <img
        :src="standings.team_logo"
        alt="standings-favorite-team-logo"
        class="image standings-team-logo mx-auto"
      />
    </td>
    <td>{{ standings.points }}</td>
    <td>
      {{ standings.played }}
      <br />
        (残り{{ gameCount - standings.played }}試合)
    </td>
    <td v-for="match in matchSchedules" :key="match.id">
      <div class="box" style="background-color: #d1d1e9">
        <div class="columns is-mobile">
          <div class="column is-one-quater">
            <img
              :src="match.competition_logo"
              alt="competition_logo"
              class="image competition-logo"
            />
          </div>
          <div class="column is-two-thirds">
            <p class="is-size-6-tablet is-size-7-mobile">
              {{ String(match.date.match(/\d{1,2}-\d{1,2}$/)) }}
            </p>
          </div>
        </div>
        <div class="columns is-mobile">
          <div class="column is-two-thirds">
            <p
              class="has-text-white is-size-6-tablet is-size-7-mobile"
              v-bind:class="
                data.isHome === match.home_and_away
                  ? 'has-background-success'
                  : 'has-background-danger'
              ">
              {{ match.home_and_away }}
            </p>
          </div>
          <div class="column is-one-thirds">
            <img
              :src="match.team_logo"
              class="image standings-team-logo"
            />
          </div>
        </div>
      </div>
    </td>
  </tr>
</template>

<script>
import { useRouter } from 'vue-router'
import { useStore } from 'vuex'
import { reactive, onMounted, computed } from 'vue'
import axios from 'axios'

export default {
  props: ['standings', 'matchSchedules'],
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
      teamId: () => store.commit('teamId')
    }
  }
}
</script>
