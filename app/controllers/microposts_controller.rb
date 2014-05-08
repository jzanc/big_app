class MicropostsController < ApplicationController
  before_action :signed_in_user

  def index
    
  end

  def self.add_group(group)
    self.group_associations.build(:group => group)
  end

  def create
    
    @micropost = current_user.microposts.build(micropost_params) if signed_in?
    @micropost.group = Group.current
    if @micropost.save
      flash[:success] = "Micropost created."
      redirect_to root_url
    else
      flash[:failure] = "Micropost not created."
      render 'static_pages/home'
    end
  end

  def destroy
  end
 
  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end

