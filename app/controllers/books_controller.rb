class BooksController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        @books = Book.all.alphabetize
    end

    def show
        if !find_book
            redirect_to books_path
        else
        find_book
        end
    end

    def most_recent
        @books = Book.most_recent_books
        render :index
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
            3.times { @book.spells.build }
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

    def destroy
        find_book
        if current_user.id != @book.user_id
            redirect_to books_path
        else 
            @book.destroy 
            redirect_to books_path
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :genre, :difficulty, :user_id, spells_attributes: [:name, :description, :difficulty_level, :power_level])
    end

    def find_book
        @book = Book.find_by_id(params[:id])
    end
    
end
