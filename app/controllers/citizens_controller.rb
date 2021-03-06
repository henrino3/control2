class CitizensController < ApplicationController
  before_action :set_citizen, only: [:show, :edit, :update, :destroy ,:banks_list]
  before_action :authenticate_admin!
  
# GET /citizens
# GET /citizens.json
def index
  @citizens = Citizen.order("id DESC").all
  @citizens = Citizen.paginate(:page => params[:page], :per_page => 25)
  render layout: true
end

  # GET /citizens/1
  # GET /citizens/1.json
  def show
  end

  def getTransactions
    @citizen_id = params[:citizen]
    if Transaction.find_by(citizen_id: @citizen_id).present?
      @transactions = Transaction.where(citizen_id: @citizen_id)
    else
      @empty = "No transactions for this citizen"
    end

    render layout: true, action: :showTransactions
  end

  def showTransactions
  end
# GET /citizens/1
# GET /citizens/1.json
def show
end

# GET /citizens/new
def new
  @citizens = Citizen.order("id DESC").limit(10)
end


def import
 Citizen.import(params[:file])
 redirect_to :action => "new", :notice => "Citizen was successfully imported"
end


# GET /citizens/1/edit
def edit
end

# POST /citizens
# POST /citizens.json
def create
  @citizen = Citizen.new(citizen_params)

  respond_to do |format|
    if @citizen.save
      format.html { redirect_to @citizen, notice: 'Citizen was successfully created.' }
      format.json { render :show, status: :created, location: @citizen }
    else
      format.html { render :new }
      format.json { render json: @citizen.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /citizens/1
# PATCH/PUT /citizens/1.json
def update
  respond_to do |format|
    if @citizen.update(citizen_params)
      format.html { redirect_to @citizen, notice: 'Citizen was successfully updated.' }
      format.json { render :show, status: :ok, location: @citizen }
    else
      format.html { render :edit }
      format.json { render json: @citizen.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /citizens/1
# DELETE /citizens/1.json
def destroy
  @citizen.destroy
  respond_to do |format|
    format.html { redirect_to citizens_url, notice: 'Citizen was successfully destroyed.' }
    format.json { head :no_content }
  end
end
#post to change token
def genToken
  @bank=Bank.find(params[:token])
  @bank.token=params[:new]
  @bank.save
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_citizen
      @citizen = Citizen.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
  def citizen_params
    params.require(:citizen).permit(:name, :phone_num, :email, :address, :national_id)
  end
end
