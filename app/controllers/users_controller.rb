class UsersController < ApplicationController
    # before_action :redirect_if_logged_in, except: [:show, :edit]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        @activities = PublicActivity::Activity.order("created_at desc")
        @books = @user.books
    end

    def edit
        @user = User.find(params[:id])
        if current_user != @user
            redirect_to books_path
        end
    end

    def update
        @user = User.find_by_id(params[:id])
        if @user.update(params.require(:user).permit(:name, :email))
            redirect_to user_path(@user)
            else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
   
end
