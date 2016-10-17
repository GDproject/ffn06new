class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :match
  belongs_to :score

  validates :home_coin, numericality: {greater_than_or_equal: 0}
  validates :away_coin, numericality: {greater_than_or_equal: 0}
  validate :check_home_away_coin

  scope :asc_by_created_at, -> {order created_at: :desc}

  private
  def check_home_away_coin
    if (self.home_coin + self.away_coin) > self.user.coin
      errors.add :home_coin, I18n.t("bet.check_coin")
    end
  end
end
