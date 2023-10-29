<template>
  <div class="favorite-team-standing columns is-mobile">
    <div
      class="favorite-team-name-and-rank favorite-team-border-right column is-three-fifths"
    >
      <div class="has-text-centered" v-show="favoriteId === standings.team_id">
        <FavoriteTeamTag />
      </div>
      <!--FavoriteTeamTag-->
      <div class="columns is-mobile">
        <div class="favorite-team column">
          <div class="favorite-team-rank has-text-centered">
            <p>
              <span class="is-size-1 has-text-weight-bold">{{
                standings.rank
              }}</span
              >位
            </p>
          </div>
          <!--favorite=team-rank-->
        </div>
        <!--favorite-team column-->
        <div class="favorite-team-logo column my-auto">
          <img
            :src="standings.team_logo"
            alt="standings-favorite-team-logo"
            class="image"
          />
        </div>
        <!--favorite-team-logo column-->
        <div
          class="favorite-team-name not-displayed-when-with-mobile-display my-auto column"
        >
          <p class="has-text-weight-bold is-size-4">
            {{ standings.team_name }}
          </p>
        </div>
        <!--favorite-team-name-->
      </div>
      <!-- columns -->
    </div>
    <!--favorite-team-name-and-rank -->
    <div class="favorite-team-points column is-one-fifth has-text-centered">
      <p class="is-size-7-mobile">勝点</p>
      <p>
        <span class="is-size-1 is-size-4-mobile has-text-weight-bold">{{
          standings.points
        }}</span
        >点
      </p>
      <DifferenceInPoints
        :favoriteTeamPoints="favoriteTeamPoints"
        :standingsPoints="standings.points"
        v-show="favoriteId !== standings.team_id"
      />
    </div>
    <!-- favorite-team-points -->
    <div class="favorite-team-played column is-one-fifth has-text-centered">
      <p class="is-size-7-mobile">試合数</p>
      <p>
        <span class="is-size-1 is-size-4-mobile has-text-weight-bold">{{
          standings.played
        }}</span
        >試合
      </p>
      <p class="has-text-grey-light has-text-weight-bold">
        残り{{ gameCount - standings.played }}試合
      </p>
    </div>
    <!-- favorite-team-played -->
  </div>
  <!-- favorite-team-standing columns-->
</template>

<script>
import DifferenceInPoints from '../../atoms/DifferenceInPoints'
import FavoriteTeamTag from '../../atoms/FavoriteTeamTag'
import { useStore } from 'vuex'
import { reactive, onMounted, computed } from 'vue'
import axios from 'axios'

export default {
  props: ['standings', 'favoriteTeamPoints', 'favoriteId'],
  components: {
    DifferenceInPoints,
    FavoriteTeamTag
  },
  setup() {
    const store = useStore()

    const data = reactive({
      isHome: 'HOME',
      teams: [],
      favorite: []
    })

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
      setTeams,
      gameCount,
      data,
      addShedulesParams: () => store.commit('addShedulesParams')
    }
  }
}
</script>
