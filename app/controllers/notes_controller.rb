class NotesController < ApplicationController
  before_action :find_note, only: %i[show edit update destroy]

  def index
    @notes = Note.order(id: :desc)
  end

  def show; end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(clean_params)

    if @note.save
      redirect_to '/notes'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @note.update(clean_params)
      redirect_to '/notes'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to '/notes'
  end

  private

  def clean_params
    params.require(:note).permit(:title, :content)
  end

  def find_note
    @note = Note.find(params[:id])
  end
end
