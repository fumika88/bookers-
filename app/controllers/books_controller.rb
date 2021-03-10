class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
   if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book.id)
   else
      @books = Book.all
      render 'index'
   end

  end

  def index
    @books = Book.all.order(id: "ASC")
    @book = Book.new


  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "Book was successfully created."#
    redirect_to book_path(@book.id)
   else
      @books = Book.all
      render 'edit'
   end

  end

  def destroy
   @book = Book.find(params[:id])  # データ（レコード）を1件取得
   if @book.destroy
      flash[:notice] = "Book was successfully created."# データ（レコード）を削除
    redirect_to books_path
   else
      render("books/new")# 投稿一覧画面へリダイレクト
   end
  end

  private
  # ストロングパラメータ
  def book_params
   params.require(:book).permit(:title, :body)
  end
end