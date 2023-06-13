import { shallowMount } from '@vue/test-utils'
import DetermineButton from 'components/atoms/Button/DetermineButton'

describe('DetermineButton', () => {
  it('renders label prop when passed', () => {
    const label = 'test label'
    const wrapper = shallowMount(DetermineButton, {
      propsData: { label }
    })
    expect(wrapper.text()).toMatch(label)
  })

  it('renders default label when no label prop passed', () => {
    const wrapper = shallowMount(DetermineButton)
    expect(wrapper.text()).toBe('決定')
  })

  it('has a button', () => {
    const wrapper = shallowMount(DetermineButton)
    expect(wrapper.html()).toMatch(/<button.*<\/button>/)
    expect(wrapper.find('button').classes()).toContain('button')
    expect(wrapper.find('button').classes()).toContain('has-text-centered')
    const span = wrapper.find('button span')
    expect(span.classes()).toContain('icon-text')
    const fontAweaness = wrapper.find('button span i')
    expect(fontAweaness.classes()).toContain('fa-solid', 'fa-check')
  })
})
