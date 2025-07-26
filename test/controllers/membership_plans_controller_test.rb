require "test_helper"

class MembershipPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membership_plan = membership_plans(:one)
  end

  test "should get index" do
    get membership_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_membership_plan_url
    assert_response :success
  end

  test "should create membership_plan" do
    assert_difference("MembershipPlan.count") do
      post membership_plans_url, params: { membership_plan: { description: @membership_plan.description, duration_months: @membership_plan.duration_months, features: @membership_plan.features, name: @membership_plan.name, price: @membership_plan.price, status: @membership_plan.status } }
    end

    assert_redirected_to membership_plan_url(MembershipPlan.last)
  end

  test "should show membership_plan" do
    get membership_plan_url(@membership_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_membership_plan_url(@membership_plan)
    assert_response :success
  end

  test "should update membership_plan" do
    patch membership_plan_url(@membership_plan), params: { membership_plan: { description: @membership_plan.description, duration_months: @membership_plan.duration_months, features: @membership_plan.features, name: @membership_plan.name, price: @membership_plan.price, status: @membership_plan.status } }
    assert_redirected_to membership_plan_url(@membership_plan)
  end

  test "should destroy membership_plan" do
    assert_difference("MembershipPlan.count", -1) do
      delete membership_plan_url(@membership_plan)
    end

    assert_redirected_to membership_plans_url
  end
end
