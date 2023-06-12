import { mount } from '@vue/test-utils'
import HowToSelectCompetitorTeam from 'Molecules/HowToSelectCompetitorTeam.vue'

describe('HowToSelectCompetitorTeam', () => {
  it('renders three radio buttons', () => {
    const wrapper = mount(HowToSelectCompetitorTeam, {
      propsData: {
        checkedName: ''
      }
    })

    const radioButtons = wrapper.findAll('input[type="radio"]')
    expect(radioButtons.length).toBe(3)
  })

  it('emits the correct value when a radio button is selected', async () => {
    const wrapper = mount(HowToSelectCompetitorTeam, {
      propsData: {
        checkedName: ''
      }
    })

    const radioButtons = wrapper.findAll('input[type="radio"]')

    await radioButtons[0].setValue('rank')
    expect(wrapper.emitted('update:checkedName')[0]).toEqual(['rank'])

    await radioButtons[1].setValue('click')
    expect(wrapper.emitted('update:checkedName')[1]).toEqual(['home'])

    await radioButtons[2].setValue('click')
    expect(wrapper.emitted('update:checkedName')[2]).toEqual(['self'])
  })
})
