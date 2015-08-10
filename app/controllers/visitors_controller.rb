class VisitorsController < ApplicationController
  
  def new
    @visitor = Visitor.new
#   render 'visitors/new'
  end
  
  def create
    @visitor = Visitor.new(visitor_params)
    if @visitor.valid?
      flash[:notice] = "Signed up #{@visitor.email}."
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  def visitor_params
    params.require(:visitor).permit(:email)
  end
end