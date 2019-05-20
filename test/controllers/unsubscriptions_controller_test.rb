require 'test_helper'

class UnsubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unsubscription = unsubscriptions(:one)
  end

  test "should get index" do
    get unsubscriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_unsubscription_url
    assert_response :success
  end

  test "should create unsubscription" do
    assert_difference('Unsubscription.count') do
      post unsubscriptions_url, params: { unsubscription: {  } }
    end

    assert_redirected_to unsubscription_url(Unsubscription.last)
  end

  test "should show unsubscription" do
    get unsubscription_url(@unsubscription)
    assert_response :success
  end

  test "should get edit" do
    get edit_unsubscription_url(@unsubscription)
    assert_response :success
  end

  test "should update unsubscription" do
    patch unsubscription_url(@unsubscription), params: { unsubscription: {  } }
    assert_redirected_to unsubscription_url(@unsubscription)
  end

  test "should destroy unsubscription" do
    assert_difference('Unsubscription.count', -1) do
      delete unsubscription_url(@unsubscription)
    end

    assert_redirected_to unsubscriptions_url
  end
end
