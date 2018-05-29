class BooksController < ApplicationController
before_action :authenticate_user!

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = User.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    flash[:notice] = "Book was successfully saved."
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
     if @book.user == current_user
    else
    redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])
    flash[:notice] = "Book was successfully updated."
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
  params.require(:book).permit(:title, :body)
  end
end
