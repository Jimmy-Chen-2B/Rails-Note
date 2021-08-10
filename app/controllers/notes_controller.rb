class NotesController < ApplicationController
  def index
    @notes = Note.order(id: :desc)
  end

  def new
    @note = Note.new  
  end

  def show
    @note = Note.find(params[:id])
  end  

  def create
    clean_params = params.require(:note).permit(:title, :content)
    @note = Note.new(clean_params)
    
    if @note.save
      redirect_to "/notes"
    else
      render :new
    end
  end
end

