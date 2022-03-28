class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:index, :edit, :update, :destroy]
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,      only: :destroy


  def index
    @users = User.order(:name)
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_url, notice: "Uživatel #{@user.username} úspěšně vytvořen" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, notice: 'Něco se pokazilo' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = current_user
    if @user.authenticate(user_params[:password])
      if @user.update(user_params)
        flash[:success] = "Profil aktualizován"
        redirect_to "/profile"
      else
        @user.errors.full_messages.each do |msg|
          flash[:danger] = msg
        end
        redirect_to "/profile/edit"
      end
    else
      flash[:danger] = "Špatné nebo chybějící heslo, pro změnu údajů zadejte stávající heslo"
      redirect_to "/profile/edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Uživatel smazán"
    redirect_to root_url
  end

  private

    def check_current_password
      user = User.find(params[:id])
      user.authenticate(params[:current_password]).present?
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :full_name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = current_user
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.role
    end

end
