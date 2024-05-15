class BooksController < ApplicationController
  def show
    @book = Book.find (params[:id])
  end
  def index
    @books = Book.all
  end 
  def new
    @book = Book.new
  end
  def create
   # Avant la validation Book.create(params.require(:book).permit(:title, :author, :description,:page_count, :published_at))
   @book = Book.new(params.require(:book).permit(:title, :author, :description,:page_count, :published_at))
   if @book.save   # Si le livre est sauvegardé
     redirect_to books_path  # redirection sur la liste des livres
   else 
     render :new  # On retourne le resultat de l'action new
   end
  end
  
end
