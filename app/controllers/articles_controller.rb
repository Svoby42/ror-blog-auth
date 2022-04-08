class ArticlesController < ApplicationController
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
      redirect_to profile_path
    else
      flash[:danger] = "Chyba"
      redirect_to root_url
    end
  end

  def update
    @article = Article.find_by(slug: params[:article_id])
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

  def destroy
    @article.destroy
    flash[:success] = "Článek smazán"
    redirect_to root_url
  end

  private

    def set_topic
      @topic = Topic.find_by(slug: params[:topic_id])
      @articles = @topic.articles
    end

    def article_params
      params.require(:article).permit(:title, :article_content, :slug, :topic_id, images: [])
    end

    def correct_user
      @article = current_user.articles.find_by(slug: params[:article_id])
      puts "PARAMS #{params}"
      flash[:danger] = "Článek není váš" if @article.nil?
      redirect_to root_url if @article.nil?
    end
end
