class TopicsController < ApplicationController
  before_action :set_articles,   only: [:show]
  before_action :admin_user,    only: [:edit, :update, :destroy, :create]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find_by(slug: params[:topic_id])
    @articles = Article.includes(:user, :topic).with_all_rich_text.paginate(page: params[:page], per_page: 10).order(:title)
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

  private

  def set_articles
    @topic = Topic.find_by(slug: params[:topic_id])
  end

end
