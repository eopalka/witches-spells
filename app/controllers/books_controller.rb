class BooksController < ApplicationController
    def index
        @books = Book.all 
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
        3.times { @book.spells.build } #has_many
    end

    def create
        @book = Book.new(book_params)
        if @book.save 
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :class, :difficulty, spells_attributes: [:name,:description,:difficulty_level,:power_level])
    end
    
end
