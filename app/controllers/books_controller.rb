require 'pry'

class BooksController < ApplicationController
  include ActiveStorage::SetCurrent

  def search
    if !params[:isbn].blank?
      clean_isbn = params[:isbn].gsub("-","")
      @is_isbn_valid = clean_isbn.length == 10 ? Isbn.is_isbn_10_valid?(clean_isbn) : Isbn.is_isbn_13_valid?(clean_isbn)

      if @is_isbn_valid
        if clean_isbn.length == 10
          converted_isbn = Isbn.convert_isbn(clean_isbn)
          converted_isbn = converted_isbn[:isbn_13].gsub("-","")

          @book = Book.where("REPLACE(isbn_13, '-', '') = ?", converted_isbn).first

          if @book
            render :show
          else
            flash[:error] = "Book not found with IBSN: #{params[:isbn]}"
            render action: :show
          end

        elsif clean_isbn.length == 13
          @book = Book.where("REPLACE(isbn_13, '-', '') = ?", clean_isbn).first

          if @book
            render :show
          else
            flash[:error] = "Book not found with IBSN: #{params[:isbn]}"
            render action: :show
          end

        else
          flash[:error] = "ISBN not valid: #{params[:isbn]}"
          render action: :show
        end
      else
        flash[:error] = "ISBN not valid: #{params[:isbn]}"
        render action: :show
      end
    end
  end
end
