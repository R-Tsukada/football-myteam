import { createRouter, createWebHistory } from 'vue-router'
import TeamList from '../Pages/TeamSelect.vue'
import CompetitorTeamSelect from '../Pages/CompetitorTeamSelect.vue'
import TeamSchedule from '../Pages/TeamSchedule.vue'
import TeamScheduleShowPage from '../Pages/TeamScheduleShowPage.vue'
import NotFound from '../components/Molecules/request_error/NotFound.vue'

export const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/leagues',
      component: TeamList,
      meta: { title: '応援しているチームを登録' }
    },
    {
      path: '/competitors',
      component: CompetitorTeamSelect,
      meta: { title: 'ライバルチームを登録' }
    },
    {
      path: '/schedules',
      component: TeamSchedule,
      meta: { title: 'リーグ戦情報' }
    },
    {
      path: '/schedules/:id',
      name: 'show',
      component: TeamScheduleShowPage,
      meta: { title: '試合情報の詳細' }
    },
    {
      path: '/:pathMatch(.*)*',
      component: NotFound,
      meta: { title: 'ページが見つかりません' }
    }
  ]
})

const DEFAULT_TITLE = 'Football MyTeam'

router.afterEach((to) => {
  const title = to.meta.title
    ? `${to.meta.title} | ${DEFAULT_TITLE}`
    : DEFAULT_TITLE

  document.title = title
})
