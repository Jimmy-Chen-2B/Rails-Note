class NotesController < ApplicationController
  before_action :find_user_note, only: %i[edit update destroy]
  before_action :check_login!, except: %i[index show]

  def index
    @notes = Note.includes(:user).order(id: :desc) 
  end

  def show
    @note = Note.find(params[:id])
    @comment = @note.comments.new
    @comments = @note.comments.order(id: :desc)
  end

  def edit
  end

  def new
    @note = current_user.notes.new
  end

  def create
    @note = current_user.notes.new(note_params)

    if @note.save
      redirect_to '/notes'
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      redirect_to '/notes'
    else
      render :edit
    end
  end

  def destroy
    @note.update(deleted_at: Time.now)
    redirect_to '/notes'
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :online_date)
  end

  def find_user_note
    @note = current_user.notes.find(params[:id])  
  end
end
