import { shallowMount } from '@vue/test-utils'
import DifferenceInPoints from 'atoms/DifferenceInPoints.vue'

describe('DifferenceInPoints', () => {
  it('renders has-text-success class when favoriteTeamPoints is greater or equal to standingsPoints', () => {
    const wrapper = shallowMount(DifferenceInPoints, {
      propsData: { favoriteTeamPoints: 10, standingsPoints: 5 }
    })
    expect(wrapper.classes()).toContain('has-text-success')
  })

  it('renders has-text-danger class when favoriteTeamPoints is less than standingsPoints', () => {
    const wrapper = shallowMount(DifferenceInPoints, {
      propsData: { favoriteTeamPoints: 5, standingsPoints: 10 }
    })
    expect(wrapper.classes()).toContain('has-text-danger')
  })

  it('renders the difference between favoriteTeamPoints and standingsPoints', () => {
    const favoriteTeamPoints = 10
    const standingsPoints = 5
    const wrapper = shallowMount(DifferenceInPoints, {
      propsData: { favoriteTeamPoints, standingsPoints }
    })
    expect(wrapper.text()).toContain(`勝ち点差${favoriteTeamPoints - standingsPoints}点`)
  })
})
