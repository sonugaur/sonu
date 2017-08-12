class UsersController < ApplicationController
   http_basic_authenticate_with name: "sonu@cyberdude", password: "Mobiloitte1", only: [:index]
	
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def new
  	 @user = User.new
	end
def create
  @user = User.new(user_params)
   if @user.save
     redirect_to @user
  else
    render 'new'
  end
end
def destroy
    @user = User.find(params[:id])
    @user.destroy
 
    redirect_to users_path
  end
private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :dob, :password, :password_confirmation) 
  end

end
