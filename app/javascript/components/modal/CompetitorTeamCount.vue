<template>
  <article
    class="message is-info has-text-centered"
    v-bind:class="{
      'message is-danger message is-danger': competitors.length >= 3
    }">
    <div class="message-body">
      <div v-if="competitors.length <= 3">
        <p>
          残り<strong>{{ teamCountMessage() }}</strong> チーム登録できます
        </p>
      </div>
      <div v-else>
        <p>登録できるのは3チームまでです</p>
      </div>
    </div>
  </article>
</template>

<script>
export default {
  props: ['competitors'],
  setup(props) {
    const teamCountMessage = () => {
      const competitorLength = props.competitors.length
      if (competitorLength <= 3) {
        return `${3 - competitorLength}`
      }
    }
    return {
      teamCountMessage
    }
  }
}
</script>
