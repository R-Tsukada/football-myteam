import { shallowMount } from '@vue/test-utils'
import BackToPageButton from 'atoms/Button/BackToPageButton'

describe('BackToPageButton', () => {
  // コンポーネントが正しくラベルプロップをレンダリングしていることを確認
  it('renders label prop when passed', () => {
    const label = 'test label'
    const wrapper = shallowMount(BackToPageButton, {
      propsData: { label }
    })
    expect(wrapper.text()).toMatch(label)
  })
  // ラベルプロップが提供されなかった場合のデフォルトの挙動をテスト
  it('renders default label when no label prop passed', () => {
    const wrapper = shallowMount(BackToPageButton)
    expect(wrapper.text()).toBe('戻る')
  })

  // ボタン要素が存在し、正しいクラスを持っていることを確認
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
