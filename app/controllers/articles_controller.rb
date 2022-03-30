class ArticlesController < ApplicationController
  before_action :set_topic
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:edit, :destroy]

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

  def edit
    @article = Article.find_by(slug: params[:id])
  end

  private

    def set_topic
      @topic = Topic.find_by(slug: params[:topic_id])
      @articles = @topic.articles
    end

    def article_params
      params.require(:article).permit(:title, :article_content, :slug)
    end

    def correct_user
      puts request.params
      @article = current_user.articles.find_by(slug: params[:article_id])
      redirect_to root_url if @article.nil?
    end
end
