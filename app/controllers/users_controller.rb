class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users=User.all
  end

  def new
    @user=User.new
  end

  def show
    @user=set_user
    if @user.nil?
      flash[:alert]='User not found!'
      redirect_to users_path
    end
  end

  def edit
    @user=set_user
  end

  def create 
   @user=User.new(user_params)
   if @user.save
    redirect_to user_path(@user.id), notice: 'User was successfully created.' 
   else
    render 'new', status: :unprocessable_entity
   end
  end

  def destroy
    @user = set_user                 # Find the user by ID
    @user.destroy                    # Delete the user
    # Redirect to the users list with a success message
    redirect_to users_path, notice: 'User was successfully deleted.' 
  end

  def update
    @user=set_user
    if @user.update(user_params)
      redirect_to users_path, notice:'User was successfully updated'
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private 
  def set_user
    @user=User.find_by_id(params[:id])
  end

  # Strong parameters in the controller layer. 
    # Security practice known as strong parameters.
    # This allows us to specify which parameters are required and which ones are permitted.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
end
