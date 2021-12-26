class QuotesController < ApplicationController
  before_action :authorize_user, only: %i[create new]
  before_action :set_book, only: %i[create]

  def create
    @quote = @book.quotes.create(quote_params)
    unless @quote.valid?
      return redirect_to new_user_book_quote_url, alert: @quote.errors.full_messages.join
    end
    redirect_to user_book_url(@current_user, @book)
  end

  def new
    @quote = Quote.new
  end

  private

  def quote_params
    params.require(:quote)
          .permit(:text)
  end

  def set_book
    @book = Book.find_by_id(params[:book_id])
  end
end