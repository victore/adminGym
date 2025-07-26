require "test_helper"

class MembershipHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membership_history = membership_histories(:one)
  end

  test "should get index" do
    get membership_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_membership_history_url
    assert_response :success
  end

  test "should create membership_history" do
    assert_difference("MembershipHistory.count") do
      post membership_histories_url, params: { membership_history: { end_date: @membership_history.end_date, member_id: @membership_history.member_id, membership_plan_id: @membership_history.membership_plan_id, payment_amount: @membership_history.payment_amount, start_date: @membership_history.start_date, status: @membership_history.status } }
    end

    assert_redirected_to membership_history_url(MembershipHistory.last)
  end

  test "should show membership_history" do
    get membership_history_url(@membership_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_membership_history_url(@membership_history)
    assert_response :success
  end

  test "should update membership_history" do
    patch membership_history_url(@membership_history), params: { membership_history: { end_date: @membership_history.end_date, member_id: @membership_history.member_id, membership_plan_id: @membership_history.membership_plan_id, payment_amount: @membership_history.payment_amount, start_date: @membership_history.start_date, status: @membership_history.status } }
    assert_redirected_to membership_history_url(@membership_history)
  end

  test "should destroy membership_history" do
    assert_difference("MembershipHistory.count", -1) do
      delete membership_history_url(@membership_history)
    end

    assert_redirected_to membership_histories_url
  end
end
