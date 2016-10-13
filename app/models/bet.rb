class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :match
  belongs_to :score

  validates :home_coin, numericality: {greater_than_or_equal: 0}
  validates :away_coin, numericality: {greater_than_or_equal: 0}
end
