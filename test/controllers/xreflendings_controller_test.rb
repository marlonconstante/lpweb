require 'test_helper'

class XreflendingsControllerTest < ActionController::TestCase
  setup do
    @xreflending = xreflendings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xreflendings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xreflending" do
    assert_difference('Xreflending.count') do
      post :create, xreflending: { employee_id: @xreflending.employee_id, equipment_id: @xreflending.equipment_id, lend_date: @xreflending.lend_date, return_date: @xreflending.return_date }
    end

    assert_redirected_to xreflending_path(assigns(:xreflending))
  end

  test "should show xreflending" do
    get :show, id: @xreflending
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xreflending
    assert_response :success
  end

  test "should update xreflending" do
    patch :update, id: @xreflending, xreflending: { employee_id: @xreflending.employee_id, equipment_id: @xreflending.equipment_id, lend_date: @xreflending.lend_date, return_date: @xreflending.return_date }
    assert_redirected_to xreflending_path(assigns(:xreflending))
  end

  test "should destroy xreflending" do
    assert_difference('Xreflending.count', -1) do
      delete :destroy, id: @xreflending
    end

    assert_redirected_to xreflendings_path
  end
end
