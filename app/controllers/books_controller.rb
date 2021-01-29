class BooksController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        @books = Book.all,alphabetize
    end

    def show
        find_book
    end

    def new
        @book = Book.new
        3.times { @book.spells.build } #has_many
    end

    def create
        params[:book][:user_id] = current_user.id
        @book = Book.new(book_params)
        if @book.save 
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    def edit
        find_book
    end

    def update
        find_book
        @book.update(book_params)
        if @book.valid?
            redirect_to books_path
        else
            render :edit
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :genre, :difficulty, :user_id, spells_attributes: [:name, :description, :difficulty_level, :power_level])
    end
    
end
