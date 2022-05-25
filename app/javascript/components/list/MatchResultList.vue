<template>
  <div>
    <div class="box" v-for="result in matchResultFilter" :key="result.id">
      <div class="columns is-vcentered">
        <img :src="result.competition_logo" class="image is-48x48 mx-3" />
        <p class="m-0 has-text-weight-bold is-size-4">
          {{ result.competition_name }}
        </p>
        <p class="pl-4 pr-2 has-text-weight-bold is-size-4 has-text-right">
          {{ result.date }}
        </p>
      </div>
      <div class="columns is-vcentered m-0">
        <p
          class="home_and_away ml-5 has-text-white has-text-weight-bold p-2 is-size-3"
          v-bind:class="
            data.isHome === result.home_and_away
              ? 'has-background-success'
              : 'has-background-danger'
          ">
          {{ result.home_and_away }}
        </p>
        <p class="mx-auto p-1 has-text-weight-bold is-size-3">
          {{ result.home_team_name }}
        </p>
        <img :src="result.home_logo" class="image is-96x96" />
        <p class="mx-auto p-1 has-text-weight-bold is-size-3">
          {{ result.home_score }}
        </p>
        <p class="mx-auto has-text-weight-bold is-size-3">-</p>
        <p class="mx-auto has-text-weight-bold is-size-3">
          {{ result.away_score }}
        </p>
        <img :src="result.away_logo" class="image is-96x96" />
        <p class="mx-auto has-text-weight-bold is-size-3">
          {{ result.away_team_name }}
        </p>
      </div>
    </div>
  </div>
</template>
>

<script>
import { reactive } from 'vue'

export default {
  props: ['matchResultFilter'],
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
