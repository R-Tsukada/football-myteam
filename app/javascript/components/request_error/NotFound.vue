<template>
  <div class="container">
    <div class="section has-text-centered">
      <div class="box">
        <h1 class="is-size-1 has-text-weight-bold">404</h1>
        <h2 class="is-size-3 py-2">お探しのページが見つかりませんでした</h2>
        <p class="py-2">
          ご指定のページは削除されたか、移動した可能性があります
        </p>
      </div>
      <router-link to="/schedules">
        <BackToPageButton class="is-rounded" label="日程一覧に戻る" />
      </router-link>
    </div>
  </div>
</template>
<script>
import BackToPageButton from '../atoms/Button/BackToPageButton.vue'

export default {
  components: {
    BackToPageButton
  }
}
</script>
