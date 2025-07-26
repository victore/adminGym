require "test_helper"

class StaffSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_schedule = staff_schedules(:one)
  end

  test "should get index" do
    get staff_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_schedule_url
    assert_response :success
  end

  test "should create staff_schedule" do
    assert_difference("StaffSchedule.count") do
      post staff_schedules_url, params: { staff_schedule: { day_of_week: @staff_schedule.day_of_week, end_time: @staff_schedule.end_time, gym_id: @staff_schedule.gym_id, staff_id: @staff_schedule.staff_id, start_time: @staff_schedule.start_time } }
    end

    assert_redirected_to staff_schedule_url(StaffSchedule.last)
  end

  test "should show staff_schedule" do
    get staff_schedule_url(@staff_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_schedule_url(@staff_schedule)
    assert_response :success
  end

  test "should update staff_schedule" do
    patch staff_schedule_url(@staff_schedule), params: { staff_schedule: { day_of_week: @staff_schedule.day_of_week, end_time: @staff_schedule.end_time, gym_id: @staff_schedule.gym_id, staff_id: @staff_schedule.staff_id, start_time: @staff_schedule.start_time } }
    assert_redirected_to staff_schedule_url(@staff_schedule)
  end

  test "should destroy staff_schedule" do
    assert_difference("StaffSchedule.count", -1) do
      delete staff_schedule_url(@staff_schedule)
    end

    assert_redirected_to staff_schedules_url
  end
end
