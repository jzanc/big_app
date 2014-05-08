class GroupsController < ApplicationController
  before_action :set_group, :only => [:show]

  def set_group
    Group.current = Group.find(params[:id])
  end

  def new
    @group = Group.new
    Group.current = @group  
  end

  def index
    @groups = Group.paginate(page: params[:page])
  end

  def current_group
    @current_group = Group.find(params[:id])
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


  def Group.current=(group)
    @current_group = group
  end

  def Group.current
    @current_group
  end

  def show
    @group = Group.find(params[:id])
    @micropost = current_user.microposts.build if signed_in?
    /@micropost.group = current_group/
    @microposts = @group.microposts.paginate(page: params[:page])
  end

  private

  def group_params
    params.require(:group).permit(:name, :url)
  end
end
