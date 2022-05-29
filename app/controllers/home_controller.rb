class HomeController < ApplicationController
	
	def index
		@card = Card.all
	end
end