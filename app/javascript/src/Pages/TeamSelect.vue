<template>
  <div class="container">
    <section class="has-text-centered">
      <h2
        class="has-text-centered is-size-2-tablet is-size-6-mobile has-text-weight-bold mt-6 mb-4">
        応援しているチームを選んでください
      </h2>
      <section>
        <TeamSelectDescription v-if="!data.competitors.length" />
        <router-link
          to="/competitors"
          v-else
          class="has-text-right is-size-6-tablet is-size-7-mobile has-text-weight-bold">
          <p>ライバルチームのみ変更する</p>
        </router-link>
        <LeagueAndTeamSelect />
      </section>
    </section>
    <!--section -->
  </div>
  <!-- .container -->
</template>

<script>
import axios from 'axios'
import { reactive, onMounted } from 'vue'
import TeamSelectDescription from '../components/Molecules/TeamSelectDescription.vue'
import LeagueAndTeamSelect from '../components/Molecules/LeagueAndTeamSelect.vue'

export default {
  components: {
    TeamSelectDescription,
    LeagueAndTeamSelect
  },
  setup() {
    const data = reactive({
      competitors: ''
    })

    const setCompetitors = async () => {
      axios
        .get('/api/competitors')
        .then((response) => {
          data.competitors = response.data
        })
        .catch((error) => {
          console.log(error.message)
        })
    }

    onMounted(() => setCompetitors())

    return {
      data
    }
  }
}
</script>
