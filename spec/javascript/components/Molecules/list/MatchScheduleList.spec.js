import { mount } from '@vue/test-utils'
import MatchScheduleCard from 'components/Molecules/list/MatchScheduleList.vue'

describe('MatchScheduleCard.vue', () => {
  const favoriteTeam = {
    id: 1,
    name: "Arsenal",
    stadium: "Emirates Stadium",
  }

  const firstOpponentTeam = {
    id: 2,
    name: "Wolves",
    stadium: "Molineux Stadium",
  }

  const secondOpponentTeam = {
    id: 3,
    name: "Aston Villa",
    stadium: "Villa Park",
  }

  const matchScheduleFilter = [
    {
      id: 1,
      season: "2024",
      date: "2024-08-17",
      home_and_away: "Emirates Stadium",
      home_team_name: "Arsenal",
      away_team_name: "Wolves",
      home_logo: "https://media.api-sports.io/football/teams/42.png",
      away_logo: "https://media.api-sports.io/football/teams/39.png"
    },
    {
      id: 2,
      season: "2024",
      date: "2024-08-24",
      home_and_away: "Villa Park",
      home_team_name: "Aston Villa",
      away_team_name: "Arsenal",
      home_logo: "https://media.api-sports.io/football/teams/66.png",
      away_logo: "https://media.api-sports.io/football/teams/42.png",
    }
  ]

  it('renders HOME when selectedTeam[0].stadium matches schedule.home_and_away', () => {
    const selectedTeam = [{ stadium: favoriteTeam.stadium }]
    const wrapper = mount(MatchScheduleCard, {
      props: { matchScheduleFilter, selectedTeam }
    })

    // HOME が表示されていることを確認
    const homeElement = wrapper.findAll('.home-and-away').at(0)
    expect(homeElement.exists()).toBe(true)
    expect(homeElement.text()).toBe('HOME')
    expect(homeElement.classes()).toContain('has-background-success')

    // AWAY が表示されていることを確認
    const awayElement = wrapper.findAll('.home-and-away').at(1)
    expect(awayElement.exists()).toBe(true)
    expect(awayElement.text()).toBe('AWAY')
    expect(awayElement.classes()).toContain('has-background-danger')
  })

  it('renders AWAY when selectedTeam[0].stadium does not match schedule.home_and_away', () => {
    const selectedTeam = [{ stadium: secondOpponentTeam.stadium }]
    const wrapper = mount(MatchScheduleCard, {
      props: { matchScheduleFilter, selectedTeam }
    })

    // AWAY が表示されていることを確認
    const awayElement = wrapper.findAll('.home-and-away').at(0)
    expect(awayElement.exists()).toBe(true)
    expect(awayElement.text()).toBe('AWAY')
    expect(awayElement.classes()).toContain('has-background-danger')

    // HOME が表示されていることを確認
    const homeElement = wrapper.findAll('.home-and-away').at(1)
    expect(homeElement.exists()).toBe(true)
    expect(homeElement.text()).toBe('HOME')
    expect(homeElement.classes()).toContain('has-background-success')
  })
})

