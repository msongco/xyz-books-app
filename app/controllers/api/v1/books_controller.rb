module Api
  module V1
    class BooksController < ApplicationController

      def index
        @books = Book.all
        render json: @books, status: :ok
      end

      def show
        isbn_params = params[:isbn_13]
        isbn_clean = isbn_params.gsub("-","")

        if isbn_clean.length == 13
          isbn_valid = Isbn.is_isbn_13_valid?(isbn_clean)

          if isbn_valid
            @book = Book.find_by_isbn_13(isbn_params)

            if @book
              render json: @book.book_with_author, status: :ok
            else
              render json: { error: "Book not found" }, status: :not_found
            end
          else
            render json: { error: "ISBN not valid" }, status: :bad_request
          end
        else
          render json: { error: "ISBN not valid" }, status: :bad_request
        end
      end

    end
  end
end
