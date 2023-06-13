import { mount } from '@vue/test-utils'
import CompetitorSelectButton from 'components/Molecules/BooleanButton/CompetitorSelectButton.vue'

describe('CompetitorSelectButton.vue', () => {
  it('renders router-link and enables DetermineButton when competitors length is between 1 and 3', () => {
    const wrapper = mount(CompetitorSelectButton, {
      propsData: {
        competitors: [{id: 1, name: 'チームA'}, {id: 2, name: 'チームB'}, {id: 3, name: 'チームC'}] // 3 competitors
      }
    })

    expect(wrapper.find('router-link').exists()).toBe(true)
    const determineButton = wrapper.findComponent({ name: 'DetermineButton' })
    expect(determineButton.exists()).toBe(true)
    expect(determineButton.props('disabled')).toBe(false)
  })

  it('disables DetermineButton when competitors length is not between 1 and 3', () => {
    const wrapper = mount(CompetitorSelectButton, {
      propsData: {
        competitors: [] // 0 competitors
      }
    })

    expect(wrapper.find('router-link').exists()).toBe(false)
    const determineButton = wrapper.findComponent({ name: 'DetermineButton' })
    expect(determineButton.exists()).toBe(true)
    expect(determineButton.props('disabled')).toBe(true)
  })
})
