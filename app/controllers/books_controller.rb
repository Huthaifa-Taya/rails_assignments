class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
  end

  def edit
  end

  def update
    @book.update(input_params)
    redirect_to book_path(@book)
  end

  def create

    Book.create(input_params)
    redirect_to root_path

  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def input_params
    params.require(:book).permit(:name, :author, :publish_year, :description, :rating)
  end
end
