class CitizenBankDataController < ApplicationController
  before_action :set_citizen_bank_datum, only: [:show, :edit, :update, :destroy]

  # GET /citizen_bank_data
  # GET /citizen_bank_data.json
  def index

    @citizen_bank_data = CitizenBankDatum.all
    
  end
   
  # GET /citizen_bank_data/1
  # GET /citizen_bank_data/1.json
  def show
  end

  # GET /citizen_bank_data/new
  def new
    @citizen_bank_datum = CitizenBankDatum.new
  end

  # GET /citizen_bank_data/1/edit
  def edit
  end

  # POST /citizen_bank_data
  # POST /citizen_bank_data.json
  def create
    bank =Bank.find_by(:token => params[:token])
    citizen_bank_datum = CitizenBankDatum.new(citizen_bank_datum_params)
      if bank != nil && params[:token] != nil
        if @bank.token == params[:token]
          if @citizen_bank_datum.save
             render :show, status: :created, location: @citizen_bank_datum 
          end      
        else
          
           render json: @citizen_bank_datum.errors, status: :unprocessable_entity 
        end
      end
   end



  def getCitizen 
     #fetch data pertaining to that bank
     bank = Bank.find_by(:token => params[:token])

      if bank != nil && params[:token] != nil
        if bank.token == params[:token]
            #bank=banks.where(:token =>"32147").limit(20)
            citizens=bank.citizen_bank_data 
            output = OpenStruct.new( :accountHolders => bank.citizen_bank_data,:status => 200 ,:message =>"REQUEST SUCCESSFUL")
             render json: output 
        end    
    else
      output = OpenStruct.new( :status => 402 ,:message =>"Access Denied" ,:moreInfo => "Please check token or paramater '?token='token goes here '")
      render json: output
      end 


    end
    
  # PATCH/PUT /citizen_bank_data/1
  # PATCH/PUT /citizen_bank_data/1.json
  def update
    respond_to do |format|
      if @citizen_bank_datum.update(citizen_bank_datum_params)
        format.html { redirect_to @citizen_bank_datum, notice: 'Citizen bank datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @citizen_bank_datum }
      else
        format.html { render :edit }
        format.json { render json: @citizen_bank_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citizen_bank_data/1
  # DELETE /citizen_bank_data/1.json
  def destroy
    @citizen_bank_datum.destroy
    respond_to do |format|
      format.html { redirect_to citizen_bank_data_url, notice: 'Citizen bank datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def postCitizen
    bank = Bank.find_by( :token => params[:token])
    if    bank != nil && params[:token] != nil
      if   bank.token == params[:token]
           @citizen=Citizen.find_by(national_id: params[:national_id])
           @citizen_bank_datum = CitizenBankDatum.new(citizen_bank_datum_params)
           @citizen_bank_datum.citizen_id = @citizen.id
           @citizen_bank_datum.bank_id = bank.id
        if @citizen_bank_datum.save
          @successOutput = OpenStruct.new(transactions: @scitizen_bank_datum , status: 200 , message:  "CITIZEN BANK DATA ADDED SUCCESSFULLY")
          render json: @successOutput
        end


      else
        @errorOutput = OpenStruct.new(status:  402, message: "FAILED TO ")
        render json: @errorOutput 
      end
    end

  end

  def getCitizen 
     #fetch data pertaining to that bank
     bank = Bank.find_by(:token => params[:token])

      if bank != nil && params[:token] != nil
        if bank.token == params[:token]
            #bank=banks.where(:token =>"32147").limit(20)
            citizens=bank.citizen_bank_data 
            output = OpenStruct.new( :accountHolders => bank.citizen_bank_data,:status => 200 ,:message =>"REQUEST SUCCESSFUL")
             render json: output 
        end    
    else
      output = OpenStruct.new( :status => 402 ,:message =>"Access Denied" ,:moreInfo => "Please check token or paramater '?token='token goes here '")
      render json: output
      end 


    end
    
      private
    # Use callbacks to share common setup or constraints between actions.
    def set_citizen_bank_datum
      @citizen_bank_datum = CitizenBankDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citizen_bank_datum_params
      params.require(:citizen_bank_datum).permit(:national_id, :bank_id, :account_id, :citizen_id , :reg_date)
    end
  end
