import { createRouter, createWebHistory } from 'vue-router'
import TeamList from '../components/page/TeamSelect.vue'
import CompetitorTeamSelect from '../components/page/CompetitorTeamSelect.vue'
import TeamSchedule from '../components/page/TeamSchedule.vue'

export const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      component: TeamList
    },
    {
      path: '/competitors',
      component: CompetitorTeamSelect
    },
    {
      path: '/schedules',
      component: TeamSchedule
    }
  ]
})
