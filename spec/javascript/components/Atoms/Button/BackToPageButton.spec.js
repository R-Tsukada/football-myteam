import { shallowMount } from '@vue/test-utils'
import BackToPageButton from 'components/atoms/Button/BackToPageButton'

describe('BackToPageButton', () => {
  it('renders label prop when passed', () => {
    const label = 'test label'
    const wrapper = shallowMount(BackToPageButton, {
      propsData: { label }
    })
    expect(wrapper.text()).toMatch(label)
  })

  it('renders default label when no label prop passed', () => {
    const wrapper = shallowMount(BackToPageButton)
    expect(wrapper.text()).toBe('戻る')
  })

  it('has a button', () => {
    const wrapper = shallowMount(BackToPageButton)
    expect(wrapper.html()).toMatch(/<button.*<\/button>/)
    expect(wrapper.find('button').classes()).toContain('button')
    expect(wrapper.find('button').classes()).toContain('has-text-centered')
    const span = wrapper.find('button span')
    expect(span.classes()).toContain('icon-text')
    const fontAweaness = wrapper.find('button span i')
    expect(fontAweaness.classes()).toContain('fa-solid', 'fa-arrow-left')
  })
})
