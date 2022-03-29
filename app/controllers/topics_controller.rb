class TopicsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user,    only: [:edit, :update, :destroy, :create]

  def index
    @topics = Topic.find(params[:id])
  end

  def show
    @topic = Topic.find_by(title: params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find_by(title: params[:id])
  end

  def destroy
    Topic.find(params[:id]).destroy
    flash[:success] = "Rubrika smazána"
    redirect_to root_url
  end

end
