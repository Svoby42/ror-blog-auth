class ArticlesController < ApplicationController
  #before_action :set_topic
  before_action :logged_in_user, only: [:create]
  before_action :correct_user, only: [:edit, :update, :destroy]

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

  def update
    puts "NAZDAR"
    puts request.url
    @article = Article.find_by(slug: params[:id])
    if @article.update(article_params)
      flash[:success] = "Článek úspěšně upraven"
      redirect_to show_article_path(@article.topic.slug, @article.slug)
    else
      flash[:danger] = "Chyba"
      render request.original_url
    end
  end

  def edit
    @article = Article.find_by(slug: params[:article_id])
  end

  private

    def set_topic
      @topic = Topic.find_by(slug: params[:topic_id])
      @articles = @topic.articles
    end

    def article_params
      params.require(:article).permit(:title, :article_content, :slug, :topic_id)
    end

    def correct_user
      puts "TADY KOUKEJ TADY"
      puts request.params
      puts session[:user_id]
      @article = current_user.articles.find_by(slug: params[:article_id])
      puts "JE NULL NEBO NE"
      puts @article.nil?
      puts "CURRENT USER ARTS"
      puts current_user.articles.any?
      puts "PARAMS"
      puts params[:article_id]
      #redirect_to root_url if @article.nil?
    end
end
