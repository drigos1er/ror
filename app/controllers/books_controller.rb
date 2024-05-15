class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy] #filter before qui declare une methode en debut des actions cités
  def show
  end
  def index
    @books = Book.all
  end 
  def new
    @book = Book.new
  end

  def edit
  end

  def create
   # Avant la validation Book.create(params.require(:book).permit(:title, :author, :description,:page_count, :published_at))
    #@book = Book.new(params.require(:book).permit(:title, :author, :description,:page_count, :published_at)) # avant refactorisation
   @book = Book.new(book_params)
   if @book.save   # Si le livre est sauvegardé
     redirect_to books_path  # redirection sur la liste des livres
   else 
     render :new  # On retourne le resultat de l'action new
   end
  end

  def update
    # if @book.update(params.require(:book).permit(:title, :author, :description,:page_count, :published_at))   # Si le livre est modifié avant refactorisation
   if @book.update(book_params)   # Si le livre est modifié

     redirect_to books_path  # redirection sur la liste des livres
   else 
     render :edit  # On retourne le resultat de l'action new
   end
  end


  def destroy
    @book.destroy
    redirect_to books_path 
  end



  private
    def book_params
      params.require(:book).permit(:title, :author, :description,:page_count, :published_at)
    end
    def find_book
      @book = Book.find (params[:id])
    end

  
end
