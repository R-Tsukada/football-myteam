# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end
