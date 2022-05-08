<template>
  <article
      class="message is-info has-text-centered"
      v-bind:class="{'message is-danger message is-danger' : competitors.length >= 4}"
  >
    <div class="message-body">
      <p>{{ teamCountMessage() }}</p>
    </div>
  </article>
</template>

<script>
export default {
  props:['competitors'],
  setup(props) {
    const teamCountMessage = () => {
      const competitorLength = props.competitors.length
      if (competitorLength <= 3) {
        return `残り${3 - competitorLength}チーム登録できます`
      } else {
        return '登録できるのは3チームまでです'
      }
    }
    return {
      teamCountMessage
    }
  }
}
</script>
