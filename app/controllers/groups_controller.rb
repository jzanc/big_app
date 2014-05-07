class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @groups = Group.paginate(page: params[:page])
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "Welcome to your new group!"
      redirect_to @group
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @micropost = Micropost.new(group: @group, params[:micropost])
    @microposts = @group.microposts.paginate(page: params[:page])
  end

  private

  def group_params
    params.require(:group).permit(:name, :url)
  end
end
