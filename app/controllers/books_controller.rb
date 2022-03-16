class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    render:index
  end

  def show
    @book=Book.find(params[:id])
  end

  def index
    @books=Book.all
  end

  def edit
    @book=Book.find(params[:id])
  end


  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    render :index
  end

  def update
       @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "succesfully"
      redirect_to book_path(@book.id)
    else
      render :edit

    end
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
