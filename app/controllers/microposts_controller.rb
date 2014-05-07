class MicropostsController < ApplicationController
  before_action :signed_in_user

  def index
  end

  def create
    @micropost = current_user.microposts.build(micropost_params) if signed_in?
    if @micropost.save
      redirect_to root_url
      flash[:success] = "Micropost created!"
    else
      flash[:failure] = "Micropost not created!"
      render 'static_pages/home'
    end  
  end

  def destroy
  end
 
  private

    def micropost_params
      params.require(:micropost).permit(:content, :user, :group)
    end
end


