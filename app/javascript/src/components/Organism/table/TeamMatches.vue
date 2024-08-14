<!-- eslint-disable vue/no-parsing-error -->
<template>
  <div class="favorite-team-schedules mx-auto">
    <div
      class="next-match has-text-centered is-size-5-mobile is-flex is-align-items-center py-2"
      v-for="match in matchSchedules"
      :key="match.id"
    >
      <img
        :src="match.competition_logo"
        alt="favorite-team-next-match"
        class="image next-match-competition-logo"
      />
      <div
        v-if="currentTeam.stadium === match.home_and_away"
        class="next-match-venu"
      >
        <p class="has-text-white mr-1 has-background-success">HOME</p>
      </div>
      <div v-else class="next-match-venu">
        <p class="has-text-white mr-1 has-background-danger">AWAY</p>
      </div>
      <!-- next-match-venu -->
      <p class="next-match-date">
        {{ matchDay(match.date) }}
      </p>
      <!-- next-match-date -->
      <div
        class="next-match-team"
        v-if="currentTeam.name === match.home_team_name"
      >
        <img
          :src="match.away_logo"
          alt="match-team-logo"
          class="image next-match-competition-logo mx-auto"
        />
        <p
          class="match-name not-displayed-when-with-mobile-display has-text-weight-bold"
        >
          {{ match.away_team_name }}
        </p>
      </div>
      <div
        class="next-match-team"
        v-else
      >
        <img
          :src="match.home_logo"
          alt="match-team-logo"
          class="image next-match-competition-logo mx-auto"
        />
        <p
          class="match-name not-displayed-when-with-mobile-display has-text-weight-bold"
        >
          {{ match.home_team_name }}
        </p>
      </div>
      <!-- match-name -->
    </div>
    <!-- next-match -->
  </div>
  <!-- favorite-team-schedules -->
</template>

<script>
import { reactive } from 'vue'
export default {
  props: ['matchSchedules', 'currentTeam'],
  setup() {
    const data = reactive({
      isHome: 'HOME',
      teams: [],
      favorite: []
    })

    const matchDay = (date) => {
      const weekDay = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fry', 'Sat']
      const matchDate = date
      const dateFormat = matchDate.replace(/(?!^)-|[^-\d]/g, '')
      const dateNumber = dateFormat.match(/(\d{4})(\d{2})(\d{2})/)
      const getDate = new Date(dateNumber[1], dateNumber[2] - 1, dateNumber[3])
      const mm = String(getDate.getMonth() + 1).padStart(2, '0')
      const dd = String(getDate.getDate()).padStart(2, '0')
      const week = weekDay[getDate.getDay()]
      return `${mm}/${dd}(${week})`
    }

    return {
      data,
      matchDay
    }
  }
}
</script>
