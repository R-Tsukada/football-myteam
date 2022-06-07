# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags # rubocop:disable Metrics/MethodLength
    {
      site: 'Football MyTeam',
      title: 'Football MyTeam',
      reverse: true,
      charset: 'utf-8',
      description: 'あなたの好きなクラブを応援することをサポートします！登録したクラブの順位表や試合日程を一目で確認できるサービスです',
      keywords: 'サッカー, プレミアリーグ, セリエA, ラリーガ, ブンデス',
      viewport: 'width=device-width, initial-scale=1.0',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        url: 'https://football-myteam.herokuapp.com/',
        image: image_url('logo_black_white.png')
      },
      twitter: {
        title: :title,
        card: 'summary',
        site: '@ryo0270590',
        description: :description,
        image: image_url('logo_black_white.png'),
        domain: 'https://football-myteam.herokuapp.com/'
      }
    }
  end
end
