import { createRouter, createWebHistory } from 'vue-router'
import { mount } from '@vue/test-utils'
import CompetitorTeamSelect from 'Pages/CompetitorTeamSelect.vue'
import TeamList from 'Pages/TeamSelect.vue'
import axios from 'axios'

jest.mock('axios')

const routes = [
  {
    path: '/competitors',
    component: CompetitorTeamSelect
  },
  {
    path: '/leagues',
    component: TeamList
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

describe('CompetitorTeamSelect.vue', () => {
  let wrapper

  beforeEach(async () => {
    axios.get.mockResolvedValue({ data: [] })

    wrapper = mount(CompetitorTeamSelect, {
      global: {
        plugins: [router]
      }
    })

    await router.isReady()
  })

  afterEach(() => {
    axios.get.mockClear()
  })

  it('renders without crashing', () => {
    expect(wrapper.exists()).toBe(true)
  })

  it('calls axios.get on mounted', () => {
    expect(axios.get).toHaveBeenCalledTimes(3)
    expect(axios.get).toHaveBeenCalledWith('/api/team_filter')
    expect(axios.get).toHaveBeenCalledWith('/api/competitors')
    expect(axios.get).toHaveBeenCalledWith('/api/favorites')
  })
})
