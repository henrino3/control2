class AdminsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_count
	
	def index
		render layout: true, action: :dashboard
	end

	def dashboard
	end

	def show
		redirect_to root_path
	end

	def delete
		
	end

	private
	def set_count
		@number_of_citizens = Citizen.count
		@number_of_banks = Bank.count
		@number_of_transactions = Transaction.count	
	end


end
