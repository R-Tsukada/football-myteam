import { shallowMount } from '@vue/test-utils'
import CompetitorTeamCount from 'atoms/modal/CompetitorTeamCount.vue'

describe('Competitodescribe', () => {
  it('renders the correct message when competitors length is less than 3', () => {
    const competitors = [{}, {}]
    const wrapper = shallowMount(CompetitorTeamCount, {
      propsData: { competitors }
    })
    expect(wrapper.text()).toContain('残り1チーム登録できます')
  })

  it('renders the correct message when competitors length is 3', () => {
    const competitors = [{}, {}, {}]
    const wrapper = shallowMount(CompetitorTeamCount, {
      propsData: { competitors }
    })
    expect(wrapper.text()).toContain('3チーム選択できたので、登録しましょう')
  })

  it('renders the correct message when competitors length is 3', () => {
    const competitors = [{}, {}, {}, {}]
    const wrapper = shallowMount(CompetitorTeamCount, {
      propsData: { competitors }
    })
    expect(wrapper.text()).toContain('登録できるのは3チームまでです')
  })
})
