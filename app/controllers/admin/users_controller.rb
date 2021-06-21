class Admin::UsersController < ApplicationController
  
  def index
    puts"-----"+params.inspect
    @user = User.all
  end
  
  def new 
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.update(user_params)
      redirect_to admin_index_url
    else
      flash.now[:error] = @user.errors.full_messages.uniq.join(', ')
      respond_to do |format|
        format.html {render :new}
        format.js {}
      end
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to admin_index_url
    else
      flash.now[:error] = @user.errors.full_messages.uniq.join(', ')
      respond_to do |format|
        format.html {render :edit}
        format.js {}
      end
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def show
  end
  
  def destroy
    
  end
  
  private

  def user_params
    params.require(:patient).permit(:id, :firstname, :lastname, :email)
  end
  
end
