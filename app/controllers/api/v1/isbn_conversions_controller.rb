module Api
  module V1
    class IsbnConversionsController < ApplicationController

      def convert_isbn
        isbn = params[:isbn]

        result = Isbn.convert_isbn(isbn)

        if result
          render json: result, status: :ok
        else
          render json: { error: "ISBN not valid" }, status: :bad_request
        end
      end

    end
  end
end
