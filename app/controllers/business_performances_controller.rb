class BusinessPerformancesController < ApplicationController
  before_action :set_business_performance, only: [:show, :edit, :update, :destroy]
#
  def index
    @business_performances = BusinessPerformance.all
  end
  
  def new
    if current_user != @user
      unless current_user.admin?
        redirect_to business_performances_path 
      end
    end
    @business_performance = Business_performance.new
  end

  def create
    @business_performance = BusinessPerformance.new(business_performance_params)
    if @business_performance.save
      redirect_to business_performances_path, notice: "投稿しました!"
    else 
      render :new
    end   
  end  

  def show
  
  end  

  def edit
    
  end

  def update
    if @business_performance.update(business_performance_params)
      redirect_to business_performances_path, notice: "編集しました！"
    else
      render :edit
    end    
  end  

  def destroy
    @business_performance.destroy
    redirect_to business_performances_path, notice:"削除しました！"
  end  

  private

  def business_performance_params
    params.require(:business_performance).permit(:number_of_nominations, :on_site_nomination, :sales_subtotal, :duty_hours) 
  end

  def set_business_performance
    @business_performance = BusinessPerformance.find(params[:id])
  end  
end
