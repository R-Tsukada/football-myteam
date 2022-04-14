<template>
  <div>
    <article class="message is-danger">
        <div class="message-header">
          <p>登録できるチーム数を超えています</p>
          <button class="delete" aria-label="delete" @click="closeMessage"></button>
        </div>
        <div class="message-body">
          ライバルチームとして登録できるチーム数は3チームまでです。
        </div>
    </article>
  </div>
</template>

<script>
import { useStore } from 'vuex'

export default {
    setup() {
    const store = useStore()

    const closeMessage = () => {
      store.commit('openMessage')
    }


    return {
      closeMessage,
    }
  }
}
</script>
<style scoped>
</style>
