<template>
  <tr class="team_standing" @click="selectTeam(standings)">
    <td>{{ standings.rank }}</td>
    <td><img :src="standings.team_logo" /></td>
    <td>{{ standings.points }}</td>
    <td>
      {{ standings.played }}
      <br />
      <div class="has-text-grey-light">
        (残り{{ gameCount - standings.played }}試合)
      </div>
    </td>
    <td v-for="match in matchSchedules" :key="match.id">
      <div class="box" style="background-color: #d1d1e9">
        <div class="columns is-vcentered">
          <div class="column is-one-thirds">
            <img :src="match.competition_logo" class="image is-48x48 mx-auto" />
          </div>
          <div class="column is-two-thirds">
            <p>{{ match.date}}</p>
          </div>
        </div>
        <div class="columns is-vcentered">
          <div class="column is-half">
            <p
                class="has-text-white"
                v-bind:class="data.isHome === match.home_and_away
                ? 'has-background-success'
                : 'has-background-danger'">
              {{ match.home_and_away }}
            </p>
          </div>
          <div class="column is-half has-text-centered">
            <img :src="match.team_logo" class="image is-64x64" />
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
