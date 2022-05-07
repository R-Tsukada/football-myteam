<template>
  <tr class="team_standing" @click="selectTeam(standings)">
    <td>{{ standings.rank }}</td>
    <td><img :src="standings.team_logo" /></td>
    <td>
      {{ standings.points }}
      <br />
      <div class="has-text-grey-light">
        ({{ standings.points - favoriteTeamPoints }})
      </div>
    </td>
    <td>
      {{ standings.played }}
      <br />
      <div class="has-text-grey-light">
        (残り{{ gameCount - standings.played }}試合)
      </div>
    </td>
    <td v-for="match in matchSchedules" :key="match.id">
      <div class="match_schedules has-text-centered">
        <div class="p-1 mb-2 ml-2">
          <img :src="match.competition_logo" class="image is-32x32 mt-1" />
          <p
            class="has-text-white mt-5 p-1"
            v-bind:class="
              data.isHome === match.home_and_away
                ? 'has-background-success'
                : 'has-background-danger'
            ">
            {{ match.home_and_away }}
          </p>
        </div>
        <div class="p-2 mb-2">
          <p>{{ match.date }}</p>
          <img :src="match.team_logo" class="image is-64x64 mt-2 ml-2 pl-2" />
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
  props: ['standings', 'matchSchedules', 'favoriteTeamPoints'],
  setup() {
    const router = useRouter()

    const store = useStore()

    const data = reactive({
      isHome: 'HOME',
      teams: []
    })

    const selectTeam = (standings) => {
      store.commit('addShedulesParams', standings.team_id)
      router.push({ name: 'show', params: { id: store.state.scheduleParams } })
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

<style>
.match_schedules {
  display: flex;
  border: solid 1px;
  border-radius: 8px;
}
</style>
