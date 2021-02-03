class SpellsController < ApplicationController
    before_action :redirect_if_not_logged_in

    before_action :redirect_if_not_book_owner, only: [:destroy, :edit, :update]

    def index
        if params[:book_id] && @book = Book.find(params[:book_id])
            @spells = @book.spells
        else
            @spells = Spell.all
        end
    end

    def show
        find_book_by_id
        if !find_spell
            redirect_to spells_path
        else
            find_spell
        end
    end

    def new
        if params[:book_id] && @book = Book.find(params[:book_id])
            @spell = Spell.new(book_id: params[:book_id])
        else
            @spell = Spell.new
            @spell.build_book
        end
    end

    def create
        @spell = Spell.new(spell_params)
        if params[:book_id]
            @book = Book.find(params[:book_id])
        end
        if @spell.save
            redirect_to spells_path
        else
            render :new
        end
    end

    def edit
        find_spell
    end

    def update
        find_spell
        @spell.update(spell_params)
        if @spell.valid?
            redirect_to spells_path
        else
            render :edit
        end
    end

    def destroy
        find_spell
        @spell.destroy
        redirect_to spells_path
    end

    private

    def spell_params
        params.require(:spell).permit(:name, :description, :difficulty_level, :power_level, :book_id, book_attributes: [:title, :genre, :difficulty, :user_id])
    end

    def find_book_by_id
        @book = Book.find_by_id(params[:book_id])
    end

    def redirect_if_not_book_owner
        find_spell
        find_book_by_id
        if current_user.id != @book.user_id
            redirect_to spells_path
        end
    end
end
