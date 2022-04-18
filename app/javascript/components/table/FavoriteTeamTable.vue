<template>
  <tbody>
    <tr class="team_standing">
      <th>{{ standings.rank }}</th>
      <th><img :src="standings.team_logo" class="image is-48x48" /></th>
      <th>{{ standings.points }}</th>
      <th>{{ standings.played }}</th>
      <th v-for="match in matchSchedules" :key="match.id">
        <img :src="match.competition_logo" class="image is-24x24" />
        <p>{{ match.date }}</p>
        <p>{{ match.home_and_away }}</p>
        <br />
        <img :src="match.team_logo" class="image is-48x48" />
        <p>{{ match.team_name }}</p>
      </th>
    </tr>
  </tbody>
</template>

<script>
export default {
  props: ['standings', 'matchSchedules']
}
</script>
