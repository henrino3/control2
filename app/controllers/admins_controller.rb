class AdminsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_count
	
	def index
		render layout: true, action: :dashboard
	end

	def dashboard
	end

	def show
		@admins  = Admin.all
		#redirect_to root_path
	end

	def all
		@admins  = Admin.all
	end

	def add
		@admin  = Admin.new
		render :template => "admins/add", layout: true
	end


	def create
  @admin = Admin.new(admin_params)

	  respond_to do |format|
	    if @admin.save
	      format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
	      format.json { render :show, status: :created, location: @admin }
	    else
	      format.html { render :new }
	      format.json { render json: @admin.errors, status: :unprocessable_entity }
	    end
	  end
  end




	def delete
		
	end

	private
	def set_count
		@number_of_citizens = Citizen.count
		@number_of_banks = Bank.count
		@number_of_transactions = Transaction.count	

		@number_of_super_admins = Admin.where(level: 'super').count
		@number_of_viewer_admins = Admin.where(level: 'viewer').count
		@number_of_entry_admins = Admin.where(level: 'entry').count
	end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.require(:admin).permit(:name, :phone_num, :email, :address, :national_id)
  end


end
