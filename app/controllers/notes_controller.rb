class NotesController < ApplicationController
  before_action :authorize_user, only: %i[create new]
  before_action :set_book, only: %i[create]

  def create
    @note = @book.notes.create(note_params)
    unless @note.valid?
      return redirect_to new_user_book_note_url, alert: @book.errors.full_messages.join
    end
    redirect_to user_book_url(@current_user, @book)
  end

  def new
    @note = Note.new
  end

  private

  def note_params
    params.require(:note)
          .permit(:date, :text)
  end

  def set_book
    @book = Book.find_by_id(params[:book_id])
  end
end