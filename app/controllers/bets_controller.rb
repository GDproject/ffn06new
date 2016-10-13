class BetsController < ApplicationController
  before_action :logged_in_user
  before_action :load_bet, except: [:index, :new, :create]
  before_action :load_score, except: [:index, :show]

  def index
    @bets = current_user.bets
  end

  def show
  end

  def new
    @bet = Bet.new
    @id_match = params[:match_id]
  end

  def create
    @bet = Bet.new bet_params
    if @bet.save
      flash.now[:success] = t "bet.create_success"
      redirect_to @bet
    else
      flash.now[:warning] = t "bet.create_fail"
      error_count
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def bet_params
    params.require(:bet).permit :home_coin, :away_coin, :bet_status, :user_id,
      :match_id, :score_id
  end

  def error_count
    @errors_count = @bet.errors.size
  end

  def load_bet
    @bet = Bet.find_by id: params[:id]
    unless @bet
      flash.now[:warning] = t "bet.not_found"
      redirect_to admin_path
    end
  end

  def load_score
    @scores = Score.all
  end

end
