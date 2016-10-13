class Admin::BetsController < ApplicationController
  before_action :logged_in_user, :verify_admin
  def index
    @bets = Bet.all
  end

  def show
  end
end
