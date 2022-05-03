<template>
  <div class="container">
    <div class="box">
      <h1 class="is-size-1 has-text-centered has-text-weight-bold">404</h1>
      <h2 class="is-size-3 has-text-centered py-2">
        お探しのページが見つかりませんでした
      </h2>
      <p class="py-2">ご指定のページは削除されたか、移動した可能性があります</p>
    </div>
    <button class="button is-rounded is-medium mx-auto">
      <router-link to="/schedules">日程一覧に戻る</router-link>
    </button>
  </div>
</template>
