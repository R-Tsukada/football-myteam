import { createRouter, createWebHistory } from 'vue-router'
import TeamList from '../components/page/TeamSelect.vue'
import CompetitorTeamSelect from '../components/page/CompetitorTeamSelect.vue'
import TeamSchedule from '../components/page/TeamSchedule.vue'
import TeamScheduleShowPage from '../components/page/TeamScheduleShowPage.vue'
import NotFound from '../components/request_error/NotFound.vue'

export const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/leagues',
      component: TeamList
    },
    {
      path: '/competitors',
      component: CompetitorTeamSelect
    },
    {
      path: '/schedules',
      component: TeamSchedule
    },
    {
      path: '/schedules/:id',
      name: 'show',
      component: TeamScheduleShowPage
    },
    {
      path: '/:pathMatch(.*)*',
      component: NotFound
    }
  ]
})
