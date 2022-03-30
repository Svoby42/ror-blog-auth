class ArticlesController < ApplicationController
  before_action :set_topic
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def new
    @article = Article.new
  end

  def show
    @article = Article.find_by(slug: params[:article_id])
    @user = @article.user
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Příspěvek vytvořen"
      redirect_to "/profile"
    else
      puts @article.errors.any?
    end
  end

  private

  def set_topic
    @topic = Topic.find_by(slug: params[:topic_id])
    @articles = @topic.articles
    puts @topic.nil?
  end

  def article_params
    params.require(:article).permit(:title, :article_content, :slug)
  end

  def correct_user
    @article = current_user.articles.find_by(username: params[:id])
    redirect_to root_url if @article.nil?
  end



end
