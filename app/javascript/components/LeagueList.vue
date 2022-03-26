<template>
  <div class="container">
    <ul v-for="league in leagues" :key="league.id">
      <li @click="selectLeague(league)">
        <img :src="league.logo" class="logo_image" />
        <p>{{ league.name }}</p>
      </li>
    </ul>
  </div>
</template>

<script>
import { createStore } from 'vuex'

const store = createStore({
  state() {
    return {
      leagueId: ''
    }
  },

  mutations: {
    increment (state, value) {
      state.leagueId = value
    }
  }
})

export default {
  props: ['leagues'],
  methods: {
    selectLeague: function (value) {
      alert(value.id)
      store.commit('increment', value.id)
    }
  }
}
</script>

<style scoped>
.container {
  display: flex;
  flex-wrap: wrap;
  align-items: stretch;
  justify-content: center;
}

ul {
  list-style: none;
}

li {
  border: solid 1px;
  border-radius: 8px;
  padding: 5px;
  text-align: center;
}

p {
  font-weight: bold;
}
</style>
