class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def new
    @article = Article.new
  end

  def show
    @article = Article.find_by(slug: params[:id])       #slug gets passed as id in this case, dont ask me why
    @user = User.find_by(id: @article.user_id)
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

  def article_params
    params.require(:article).permit(:title, :article_content, :slug)
  end

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to root_url if @article.nil?
  end



end
