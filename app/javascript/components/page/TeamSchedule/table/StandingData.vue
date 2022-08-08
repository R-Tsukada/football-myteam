<template>
  <div class="box standing-data">
    <div
      class="favorite-team-standing columns is-mobile"
      @click="selectTeam(standings)">
      <div
        class="favorite-team-name-and-rank favorte-team-border-right column is-half">
        <div class="has-text-centered" v-show="favoriteId === standings.team_id">
          <FavoriteTeamTag />
        </div><!--FavoriteTeamTag-->
        <div class="columns mx-auto">
          <div class="favorite-team column">
            <div class="favorite-team-rank has-text-centered">
              <p>
                <span class="is-size-1 has-text-weight-bold">{{
                  standings.rank
                }}</span
                >位
              </p>
            </div><!--favorite=team-rank-->
          </div><!--favorite-team column-->
          <div class="favorite-team-logo column">
            <img
              :src="standings.team_logo"
              alt="standings-favorite-team-logo"
              class="image" />
          </div><!--favorite-team-logo column-->
          <div class="favorite-team-name my-auto column">
            <p class="has-text-weight-bold is-size-4">
              {{ standings.team_name }}
            </p>
          </div><!--favorite-team-name-->
        </div><!-- columns -->
      </div><!--favorite-team-name-and-rank -->
      <div
        class="favorite-team-points column is-one-quarter has-text-centered">
        <p>勝点</p>
        <p>
          <span class="is-size-1 has-text-weight-bold">{{
            standings.points
          }}</span
          >点
        </p>
        <DifferenceInPoints
          :favoriteTeamPoints="favoriteTeamPoints"
          :standingsPoints="standings.points"
          v-show="favoriteId !== standings.team_id" />
      </div><!-- favorite-team-points -->
      <div
        class="favorite-team-played column is-one-quarter has-text-centered">
        <p>試合数</p>
        <p>
          <span class="is-size-1 has-text-weight-bold">{{
            standings.played
          }}</span
          >試合
        </p>
        <p class="has-text-grey-light has-text-weight-bold">
          残り{{ gameCount - standings.played }}試合
        </p>
      </div><!-- favorite-team-played -->
    </div><!-- favorite-team-standing columns-->
  </div><!--box.standing-data-->
</template>

<script>
import DifferenceInPoints from '../../../atoms/DifferenceInPoints'
import FavoriteTeamTag from '../../../atoms/FavoriteTeamTag'
import { useRouter } from 'vue-router'
import { useStore } from 'vuex'
import { reactive, onMounted, computed } from 'vue'
import axios from 'axios'

export default {
  props: ['standings', 'FavoriteTeamTag', 'favoriteTeamPoints', 'favoriteId'],
  components: {
    DifferenceInPoints,
    FavoriteTeamTag,
  },
  setup() {
    const router = useRouter()

    const store = useStore()

    const data = reactive({
      isHome: 'HOME',
      teams: [],
      favorite: []
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

    const setFavorite = async () => {
      axios
        .get('/api/favorites')
        .then((response) => {
          data.favorite = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    onMounted(setTeams(), setFavorite())

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
