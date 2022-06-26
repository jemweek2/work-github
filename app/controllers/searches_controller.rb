class SearchesController < ApplicationController


  def search
    @genres = Genre.all
    @range = params[:range]

      @products = Product.looks(params[:search], params[:word])
 

      # @books = Customer.looks(params[:search], params[:word])


  end

end
