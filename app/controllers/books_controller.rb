class BooksController < ApplicationController
  before_action :authorise_user, only: %i[create new index show edit update destroy]

  def create
    @book = @current_user.books.create(book_params)
    unless @book.valid?
      return redirect_to new_user_book_url, alert: @book.errors.full_messages.join
    end
  end

  def new
    @book ||= Book.new
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by_id(params[:id])
    not_found unless @book
  end

  def edit
    not_found unless @book.user = @current_user
  end

  def update
    @book.update(book_params)
    unless @book.valid?
      return redirect_to edit_user_book_url(@book), alert: @book.errors.full_messages.join
      redirect_to user_book_url(@current_user, @book)
    end
  end

  def destroy

  end

  private

  def book_params

  end
end
