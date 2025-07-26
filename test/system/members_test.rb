require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h1", text: "Members"
  end

  test "should create member" do
    visit members_url
    click_on "New member"

    fill_in "Emergency contact", with: @member.emergency_contact
    fill_in "Emergency phone", with: @member.emergency_phone
    fill_in "Expiry date", with: @member.expiry_date
    fill_in "Gym", with: @member.gym_id
    fill_in "Join date", with: @member.join_date
    fill_in "Membership number", with: @member.membership_number
    fill_in "Membership plan", with: @member.membership_plan_id
    fill_in "Status", with: @member.status
    fill_in "User", with: @member.user_id
    click_on "Create Member"

    assert_text "Member was successfully created"
    click_on "Back"
  end

  test "should update Member" do
    visit member_url(@member)
    click_on "Edit this member", match: :first

    fill_in "Emergency contact", with: @member.emergency_contact
    fill_in "Emergency phone", with: @member.emergency_phone
    fill_in "Expiry date", with: @member.expiry_date
    fill_in "Gym", with: @member.gym_id
    fill_in "Join date", with: @member.join_date
    fill_in "Membership number", with: @member.membership_number
    fill_in "Membership plan", with: @member.membership_plan_id
    fill_in "Status", with: @member.status
    fill_in "User", with: @member.user_id
    click_on "Update Member"

    assert_text "Member was successfully updated"
    click_on "Back"
  end

  test "should destroy Member" do
    visit member_url(@member)
    click_on "Destroy this member", match: :first

    assert_text "Member was successfully destroyed"
  end
end
