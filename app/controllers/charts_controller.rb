class ChartsController < ApplicationController
  def index
  end
  
  def new
    @chart = Chart.new
  end

  def create
    @chart = Chart.new(chart_params.slice(:name))
    ApplicationRecord.transaction do
      @chart.save!
      @chart.users = User.where(id: chart_params[:user_ids])
      @chart.save!
    end
    redirect_to root_path
  rescue
    render :new
  end

  private
  def chart_params
    params.require(:chart).permit(:name, user_ids: [])
  end
end