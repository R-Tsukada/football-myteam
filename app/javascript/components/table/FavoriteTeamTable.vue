<template>
  <tbody>
    <tr class="team_standing">
      <th>{{ standings.rank }}</th>
      <th><img :src="standings.team_logo" class="image is-48x48" /></th>
      <th>{{ standings.points }}</th>
      <th>{{ standings.played }}</th>
      <th v-for="match in matchSchedules" :key="match.id">
        <div class="match_schedules">
          <div>
            <img :src="match.competition_logo" class="image is-24x24" />
            <p>{{ match.home_and_away }}</p>
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
export default {
  props: ['standings', 'matchSchedules']
}
</script>

<style>
.match_schedules {
  display: flex;
  border: solid 1px;
  border-radius: 8px;
}
</style>
