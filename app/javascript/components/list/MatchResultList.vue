<template>
  <div class="flex">
    <ul class="flex-list" v-for="result in matchResultFilter" :key="result.id">
      <li>
        <div class="competition">
          <p>{{ result.date }}</p>
          <img :src="result.competition_logo" class="image is-64x64" />
          <p>{{ result.competition_name }}</p>
        </div>
        <div class="team">
          <p class="home_and_away">{{ result.home_and_away }}</p>
          <p>{{ result.home_team_name }}</p>
          <img :src="result.home_logo" class="image is-96x96" />
          <p>{{ result.home_score }}</p>
          <p>-</p>
          <p>{{ result.away_score }}</p>
          <img :src="result.away_logo" class="image is-96x96" />
          <p>{{ result.away_team_name }}</p>
        </div>
      </li>
    </ul>
  </div>
</template>
>

<script>
export default {
  props: ['matchResultFilter']
}
</script>
