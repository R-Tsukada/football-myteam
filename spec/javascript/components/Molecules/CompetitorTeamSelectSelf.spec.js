import { mount } from '@vue/test-utils'
import CompetitorTeamSelectSelf from 'Molecules/CompetitorTeamSelectSelf.vue'

describe('CompetitorTeamSelectSelf', () => {
  it('renders correctly with initial props', () => {
    const wrapper = mount(CompetitorTeamSelectSelf, {
      propsData: {
        teams: [],
        competitors: [],
        isShowingMessage: false
      }
    })

    expect(wrapper.find('h2').text()).toBe('ライバルチームを最大3チームまで選んでください')
    expect(wrapper.findComponent({ name: 'CompetitorTeamCount' }).exists()).toBe(false)
    expect(wrapper.findComponent({ name: 'CompetitorTeamList' }).exists()).toBe(false)
    expect(wrapper.findComponent({ name: 'TeamListLoader' }).exists()).toBe(true)
    expect(wrapper.findComponent({ name: 'BackToPageButton' }).exists()).toBe(true)
    expect(wrapper.findComponent({ name: 'CompetitorSelectButton' }).exists()).toBe(true)
  })

  it('emits selectTeam event when selectTeam method is called', async () => {
    const wrapper = mount(CompetitorTeamSelectSelf, {
      propsData: {
        teams: [],
        competitors: [],
        isShowingMessage: false
      }
    })

    await wrapper.vm.selectTeam('team1')
    expect(wrapper.emitted('selectTeam')).toBeTruthy()
    expect(wrapper.emitted('selectTeam')[0]).toEqual(['team1'])
  })

  it('emits selectAgain event when selectAgain method is called', async () => {
    const wrapper = mount(CompetitorTeamSelectSelf, {
      propsData: {
        teams: [],
        competitors: [],
        isShowingMessage: false
      }
    })

    await wrapper.vm.selectAgain()
    expect(wrapper.emitted('selectAgain')).toBeTruthy()
  })
})
