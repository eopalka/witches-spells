class SpellsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:book_id] && @book = Book.find(params[:book_id])
            @spells = @book.spells
        else
            @spells = Spell.all
        end
    end

    def show
        find_spell
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
        params.require(:spell).permit(:name, :description, :difficulty_level, :power_level, :book_id, book_attributes: [:title, :genre, :difficulty])
    end


end
