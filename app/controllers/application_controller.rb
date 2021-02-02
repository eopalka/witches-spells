class ApplicationController < ActionController::Base

    include PublicActivity::StoreController
    include ApplicationHelper  #give us access to the helper methods in that module

    def current_user
        @current_user ||=User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
   

    private

    def redirect_if_not_logged_in
        redirect_to '/login' if !logged_in?
    end

    def redirect_if_logged_in
        redirect_to user_path(current_user) if logged_in?
    end

    def find_book
        @book = Book.find(params[:id])
    end

    def find_spell
        @spell = Spell.find(params[:id])
    end
end
