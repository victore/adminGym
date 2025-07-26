require "application_system_test_case"

class MembershipPlansTest < ApplicationSystemTestCase
  setup do
    @membership_plan = membership_plans(:one)
  end

  test "visiting the index" do
    visit membership_plans_url
    assert_selector "h1", text: "Membership plans"
  end

  test "should create membership plan" do
    visit membership_plans_url
    click_on "New membership plan"

    fill_in "Description", with: @membership_plan.description
    fill_in "Duration months", with: @membership_plan.duration_months
    fill_in "Features", with: @membership_plan.features
    fill_in "Name", with: @membership_plan.name
    fill_in "Price", with: @membership_plan.price
    fill_in "Status", with: @membership_plan.status
    click_on "Create Membership plan"

    assert_text "Membership plan was successfully created"
    click_on "Back"
  end

  test "should update Membership plan" do
    visit membership_plan_url(@membership_plan)
    click_on "Edit this membership plan", match: :first

    fill_in "Description", with: @membership_plan.description
    fill_in "Duration months", with: @membership_plan.duration_months
    fill_in "Features", with: @membership_plan.features
    fill_in "Name", with: @membership_plan.name
    fill_in "Price", with: @membership_plan.price
    fill_in "Status", with: @membership_plan.status
    click_on "Update Membership plan"

    assert_text "Membership plan was successfully updated"
    click_on "Back"
  end

  test "should destroy Membership plan" do
    visit membership_plan_url(@membership_plan)
    click_on "Destroy this membership plan", match: :first

    assert_text "Membership plan was successfully destroyed"
  end
end
