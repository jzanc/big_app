class MicropostsController < ApplicationController
  before_action :signed_in_user

  def index
  end

  def create
    @micropost = current_user.microposts.build(micropost_params) if signed_in?
  end

  def destroy
  end
 
  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end


end
