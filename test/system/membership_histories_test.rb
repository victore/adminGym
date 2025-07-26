require "application_system_test_case"

class MembershipHistoriesTest < ApplicationSystemTestCase
  setup do
    @membership_history = membership_histories(:one)
  end

  test "visiting the index" do
    visit membership_histories_url
    assert_selector "h1", text: "Membership histories"
  end

  test "should create membership history" do
    visit membership_histories_url
    click_on "New membership history"

    fill_in "End date", with: @membership_history.end_date
    fill_in "Member", with: @membership_history.member_id
    fill_in "Membership plan", with: @membership_history.membership_plan_id
    fill_in "Payment amount", with: @membership_history.payment_amount
    fill_in "Start date", with: @membership_history.start_date
    fill_in "Status", with: @membership_history.status
    click_on "Create Membership history"

    assert_text "Membership history was successfully created"
    click_on "Back"
  end

  test "should update Membership history" do
    visit membership_history_url(@membership_history)
    click_on "Edit this membership history", match: :first

    fill_in "End date", with: @membership_history.end_date
    fill_in "Member", with: @membership_history.member_id
    fill_in "Membership plan", with: @membership_history.membership_plan_id
    fill_in "Payment amount", with: @membership_history.payment_amount
    fill_in "Start date", with: @membership_history.start_date
    fill_in "Status", with: @membership_history.status
    click_on "Update Membership history"

    assert_text "Membership history was successfully updated"
    click_on "Back"
  end

  test "should destroy Membership history" do
    visit membership_history_url(@membership_history)
    click_on "Destroy this membership history", match: :first

    assert_text "Membership history was successfully destroyed"
  end
end
