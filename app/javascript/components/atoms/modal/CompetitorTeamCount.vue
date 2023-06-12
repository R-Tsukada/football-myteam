<template>
  <article
    class="message is-info has-text-centered"
    v-bind:class="{
      'message is-danger': competitors.length >= 3
    }">
    <div class="message-body">
      <div v-if="competitors.length > 3">
        <p>登録できるのは3チームまでです</p>
      </div>
      <div v-else-if="competitors.length == 3">
        <p>3チーム選択できたので、登録しましょう</p>
      </div>
      <div v-else>
        <p>
          残り<strong>{{ teamCountMessage }}</strong
          >チーム登録できます
        </p>
      </div>
    </div>
  </article>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  props: {
    competitors: Array
  },
  computed: {
    teamCountMessage() {
      const competitorLength = this.competitors.length
      if (competitorLength <= 3) {
        return `${3 - competitorLength}`
      } else {
        return '0'
      }
    }
  }
})
</script>
