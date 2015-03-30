class DinningsController < ApplicationController
  before_action :set_dinning, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize, only: [:edit, :destroy]
  respond_to :html

  def index
    @dinnings = Dinning.all
    respond_with(@dinnings)
  end

  def show
    respond_with(@dinning)
  end

  def new
    @dinning = Dinning.new
    respond_with(@dinning)
  end

  def edit
  end

  def create
    @dinning = current_user.dinning.build(dinning_params)
    @dinning.rate = @dinning.quantity / @dinning.price
    @dinning.save
    respond_with(@dinning)
  end

  def update
    @dinning.rate = @dinning.quantity / @dinning.price
    @dinning.update(dinning_params)
    respond_with(@dinning)
  end

  def destroy
    @dinning.destroy
    respond_with(@dinning)
  end

  private
    def authorize
      unless @dinning.user == current_user
        redirect_to :back
      end
    end
    def set_dinning
      @dinning = Dinning.find(params[:id])
    end

    def dinning_params
      params.require(:dinning).permit(:quantity, :price, :rate)
    end
end
