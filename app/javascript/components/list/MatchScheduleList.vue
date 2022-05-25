<template>
  <div>
    <div class="box" v-for="schedule in matchScheduleFilter" :key="schedule.id">
      <div class="columns is-vcentered">
        <img :src="schedule.competition_logo" class="image is-48x48 mx-3" />
        <p class="m-0 has-text-weight-bold is-size-4">
          {{ schedule.competition_name }}
        </p>
        <p class="pl-4 pr-2 has-text-weight-bold is-size-4 has-text-right">
          {{ schedule.date }}
        </p>
      </div>
      <div class="columns is-vcentered mt-2">
        <p
          class="home_and_away ml-5 has-text-white has-text-weight-bold p-2 is-size-3"
          v-bind:class="
            data.isHome === schedule.home_and_away
              ? 'has-background-success'
              : 'has-background-danger'
          ">
          {{ schedule.home_and_away }}
        </p>
        <p class="mx-auto p-1 has-text-weight-bold is-size-3">
          {{ schedule.home_team_name }}
        </p>
        <img :src="schedule.home_logo" class="image is-96x96" />
        <p class="mx-auto p-1 has-text-weight-bold is-size-3">-</p>
        <img :src="schedule.away_logo" class="image is-96x96" />
        <p class="mx-auto p-1 has-text-weight-bold is-size-3">
          {{ schedule.away_team_name }}
        </p>
      </div>
    </div>
  </div>
</template>

<script>
import { reactive } from 'vue'

export default {
  props: ['matchScheduleFilter'],
  setup() {
    const data = reactive({
      isHome: 'HOME'
    })

    return {
      data
    }
  }
}
</script>
