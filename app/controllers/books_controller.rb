class BooksController < ApplicationController
  before_action :authorize_user, only: %i[create new index show edit update destroy]
  before_action :set_book, only: %i[show edit update destroy]
  #before_action :authorize_book, %i[show edit update destroy]

  def create

    @book = @current_user.books.create(book_params)

    unless @book.valid?
      return redirect_to new_user_book_url, alert: @book.errors.full_messages.join
    end
    redirect_to user_book_url(@current_user, @book)
  end

  def new
    @book = Book.new
  end

  def index
    @books = @current_user.books
  end

  def show
    not_found unless @book
  end

  def edit

  end

  def update
    @book.update(params)
    unless @book.valid?
      return redirect_to edit_user_book_url(@book), alert: @book.errors.full_messages.join
    end
    redirect_to user_book_url(@current_user, @book)
  end

  def destroy

  end

  private

  def set_book
    @book = Book.find_by_id(params[:id])
  end

  def book_params
    params.require(:book)
          .permit(:title, :author, :started, :finished, :review, :score, :picture_link)
  end

  def authorize_book
    #not_found unless @book.user == @current_user
  end
end
