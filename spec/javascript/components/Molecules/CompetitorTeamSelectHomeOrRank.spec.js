import { shallowMount } from '@vue/test-utils'
import CompetitorTeamSelectHomeOrRank from 'Molecules/CompetitorTeamSelectHomeOrRank.vue'

describe('CompetitorTeamSelectHomeOrRank.vue', () => {
  it('renders the component', () => {
    const wrapper = shallowMount(CompetitorTeamSelectHomeOrRank, {
      propsData: {
        teams: [
          { id: 1, name: 'team1' },
        ],
        competitors: [
          {
            id: 2, name: 'team2'
          }
        ]
      }
    })
    expect(wrapper.exists()).toBe(true)
  })
})
