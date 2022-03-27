class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Příspěvek vytvořen"
      redirect_to root_url
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :slug)
  end

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to root_url if @article.nil?
  end



end
