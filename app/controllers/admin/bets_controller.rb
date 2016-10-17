class Admin::BetsController < ApplicationController
  before_action :logged_in_user, :verify_admin
  def index
    @bets = Bet.asc_by_created_at.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end
end
