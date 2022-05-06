<template>
  <tbody @click="selectTeam(standings)">
    <tr class="team_standing">
      <th>{{ standings.rank }}</th>
      <th><img :src="standings.team_logo" /></th>
      <th>
        {{ standings.points }}
        <br />
        <div class="has-text-grey-light">
          ({{ favoriteTeamPoints - standings.points}})
        </div>
      </th>
      <th>
        {{ standings.played }}
        <br />
        <div class="has-text-grey-light">
          (残り{{ gameCount - standings.played}}試合)
        </div>
      </th>
      <th v-for="match in matchSchedules" :key="match.id">
        <div class="match_schedules">
          <div>
            <img :src="match.competition_logo" class="image is-24x24" />
            <p
                class="has-text-white"
                v-bind:class="
                    data.isHome === match.home_and_away
                      ? 'has-background-success'
                      : 'has-background-danger'
                  ">
              {{ match.home_and_away }}
            </p>
          </div>
          <div>
            <p>{{ match.date }}</p>
            <img :src="match.team_logo" class="image is-48x48" />
          </div>
        </div>
      </th>
    </tr>
  </tbody>
</template>

<script>
import { useRouter } from 'vue-router'
import { useStore } from 'vuex'
import { reactive, onMounted, computed } from 'vue'
import  axios from 'axios'

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
      axios.get('/api/team_filter')
          .then((response) => {
            data.teams = response.data
          })
          .catch((error) => {
            console.log(error.message)
          })
    }

    onMounted(setTeams())

    const gameCount = computed(() => data.teams.length * 2 )

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
