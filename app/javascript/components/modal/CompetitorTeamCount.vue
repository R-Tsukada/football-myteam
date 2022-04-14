<template>
  <article class="message is-info">
    <div class="message-body">
      <p>{{ teamCountMessage() }}</p>
    </div>
  </article>
</template>

<script>
import { useStore } from 'vuex'
export default {
  setup() {

    const store = useStore()

    const teamCountMessage = () => {
      const competitorLength = store.state.competitorTeamId.length
      if (competitorLength <= 3) {
        return `残り${3 - competitorLength}チーム登録できます`
      } else {
        return "登録できるのは3チームまでです"
      }
    }
    return {
      teamCountMessage
    }
  }
}
</script>
