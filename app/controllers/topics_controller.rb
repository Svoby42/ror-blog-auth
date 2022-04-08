class TopicsController < ApplicationController
  before_action :set_topic,     only: [:show, :edit]
  before_action :admin_user,    only: [:edit, :update, :destroy, :create, :index]

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

  def create
    @topic = Topic.new(topic_params)
    respond_to do |format|
      if @topic.save
        format.html { redirect_to root_url, notice: "Kategorie #{@topic.title} úspěšně vytvořena" }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new, notice: 'Něco se pokazilo' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @topic = Topic.find_by(slug: params[:id])
  end

  def update
    @topic = Topic.find_by(slug: params[:id])
    if @topic.update(topic_params)
      flash[:success] = "Rubrika úspěšně upravena"
      redirect_to topics_path
    else
      flash[:danger] = "Chyba"
      redirect_to request.original_url
    end
  end

  def destroy
    Topic.find(params[:id]).destroy
    flash[:success] = "Rubrika smazána"
    redirect_to root_url
  end

  private

    def set_topic
      @topic = Topic.find_by(slug: params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :description, :slug, :topic_id)
    end

end
