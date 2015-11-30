require 'test_helper'

class CitizenBankDataControllerTest < ActionController::TestCase
  setup do
    @citizen_bank_datum = citizen_bank_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:citizen_bank_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create citizen_bank_datum" do
    assert_difference('CitizenBankDatum.count') do
      post :create, citizen_bank_datum: { account_id: @citizen_bank_datum.account_id, bank_id: @citizen_bank_datum.bank_id, citizen_id: @citizen_bank_datum.citizen_id, national_id: @citizen_bank_datum.national_id }
    end

    assert_redirected_to citizen_bank_datum_path(assigns(:citizen_bank_datum))
  end

  test "should show citizen_bank_datum" do
    get :show, id: @citizen_bank_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @citizen_bank_datum
    assert_response :success
  end

  test "should update citizen_bank_datum" do
    patch :update, id: @citizen_bank_datum, citizen_bank_datum: { account_id: @citizen_bank_datum.account_id, bank_id: @citizen_bank_datum.bank_id, citizen_id: @citizen_bank_datum.citizen_id, national_id: @citizen_bank_datum.national_id }
    assert_redirected_to citizen_bank_datum_path(assigns(:citizen_bank_datum))
  end

  test "should destroy citizen_bank_datum" do
    assert_difference('CitizenBankDatum.count', -1) do
      delete :destroy, id: @citizen_bank_datum
    end

    assert_redirected_to citizen_bank_data_path
  end
end
