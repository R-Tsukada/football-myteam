# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter]

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_one :favorite, dependent: :destroy
  has_many :following, through: :favorite, source: :team

  has_many :competitor, dependent: :destroy
  has_many :competitor_following, through: :competitor, source: :team

  def favorite_team_follow(team)
    following << team
  end

  def favorite_team_unfollow(team)
    Favorite.find_by(team: team.id).destroy
  end

  def favorite_team_following?(team)
    following.include?(team)
  end

  def competitor_team_follow(team)
    competitor_following << team
  end

  def competitor_team_unfollow(team)
    Competitor.find_by(team: team.id).destroy
  end

  def competitor_team_following?(team)
    competitor_following.include?(team)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = User.dumy_email(auth)
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.dumy_email(auth)
    "#{auth.uid}p#{auth.provider}@example.com"
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']) && user.email.blank?
        user.email = data['email']
      end
    end
  end
end
