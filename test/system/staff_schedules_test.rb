require "application_system_test_case"

class StaffSchedulesTest < ApplicationSystemTestCase
  setup do
    @staff_schedule = staff_schedules(:one)
  end

  test "visiting the index" do
    visit staff_schedules_url
    assert_selector "h1", text: "Staff schedules"
  end

  test "should create staff schedule" do
    visit staff_schedules_url
    click_on "New staff schedule"

    fill_in "Day of week", with: @staff_schedule.day_of_week
    fill_in "End time", with: @staff_schedule.end_time
    fill_in "Gym", with: @staff_schedule.gym_id
    fill_in "Staff", with: @staff_schedule.staff_id
    fill_in "Start time", with: @staff_schedule.start_time
    click_on "Create Staff schedule"

    assert_text "Staff schedule was successfully created"
    click_on "Back"
  end

  test "should update Staff schedule" do
    visit staff_schedule_url(@staff_schedule)
    click_on "Edit this staff schedule", match: :first

    fill_in "Day of week", with: @staff_schedule.day_of_week
    fill_in "End time", with: @staff_schedule.end_time.to_s
    fill_in "Gym", with: @staff_schedule.gym_id
    fill_in "Staff", with: @staff_schedule.staff_id
    fill_in "Start time", with: @staff_schedule.start_time.to_s
    click_on "Update Staff schedule"

    assert_text "Staff schedule was successfully updated"
    click_on "Back"
  end

  test "should destroy Staff schedule" do
    visit staff_schedule_url(@staff_schedule)
    click_on "Destroy this staff schedule", match: :first

    assert_text "Staff schedule was successfully destroyed"
  end
end
