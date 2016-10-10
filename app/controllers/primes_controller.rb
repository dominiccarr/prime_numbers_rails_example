require 'will_paginate/array'

class PrimesController < ApplicationController

	def is_prime
		@input1 = params[:q]
		@p1 = PrimeChecker.new
		@result = @p1.is_prime?(@input1.to_i)
	end
	
	# /bounds?upper=1000&lower=10
    def bounds
        upper = params[:upper].to_i
        lower = params[:lower].to_i
        checker = PrimeChecker.new
        @nums = (lower..upper).to_a.select { |i| checker.is_prime?(i) }
        @nums = @nums.paginate(per_page: 100, page: params[:page])
        
        respond_to do |format|
            format.html
            format.json{
                render :json => @nums
            }
        end
    end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def prime_params
      params.require(:prime).permit(:primenum)
    end
end
