<template>
  <div class="flex">
    <ul
      v-for="schedule in matchScheduleFilter"
      :key="schedule.id"
      class="flex-list">
      <li>
        <div class="competition">
          <p>{{ schedule.date }}</p>
          <img :src="schedule.competition_logo" class="image is-64x64" />
          <p>{{ schedule.competition_name }}</p>
        </div>
        <div class="team">
          <p class="home_and_away">{{ schedule.home_and_away }}</p>
          <p>{{ schedule.home_team_name }}</p>
          <img :src="schedule.home_logo" class="image is-96x96" />
          <p>-</p>
          <img :src="schedule.away_logo" class="image is-96x96" />
          <p>{{ schedule.away_team_name }}</p>
        </div>
      </li>
    </ul>
  </div>
</template>
>

<script>
export default {
  props: ['matchScheduleFilter']
}
</script>
<style>
.flex {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

.flex-list {
  width: 60%;
  border: 1px solid;
  border-radius: 8px;
}

.flex-list li {
  padding: 10px;
  text-align: center;
  list-style: none;
}

.competition {
  display: flex;
  flex: auto;
  width: 100%;
}

.competition p {
  padding: 10px;
  font-size: 24px;
  font-weight: bold;
}

.team {
  display: flex;
  justify-content: space-between;
  flex: auto;
  width: 100%;
  margin: 10px;
}

.team p {
  padding: 10px;
  vertical-align: center;
  font-size: 32px;
  font-weight: bold;
}

.team image {
  margin-top: 20px;
}

.home_and_away {
  border: 1px solid;
  color: white;
  background-color: red;
  margin: 10px;
}

.team_name_and_logo {
  margin: 0 auto;
}
</style>
