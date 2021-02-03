module SpellsHelper

    def display_index_header
        if @book 
        content_tag(:h1, "#{@book.title}'s'  Spells")
        else 
        content_tag(:h1, "All Spells")
        end 
   end

    def display_new_header
        if @book 
        content_tag(:h1, "Make a Spell for #{@book.title}")
        else 
        content_tag(:h1, "Make a Spell")
        end 
   end

    def book_form_fields(f)
        if @book   # params[:brand_id]
         f.hidden_field :book_id, value: @book.id 
        else 
         render partial: "book_fields", locals: { f: f } 
        end 
    end
end
