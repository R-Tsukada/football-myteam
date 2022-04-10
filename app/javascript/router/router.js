import { createRouter, createWebHistory } from 'vue-router'
import TeamList from '../components/page/TeamSelect.vue'

export const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      component: TeamList
    }
  ]
})
