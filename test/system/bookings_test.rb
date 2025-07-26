require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  setup do
    @booking = bookings(:one)
  end

  test "visiting the index" do
    visit bookings_url
    assert_selector "h1", text: "Bookings"
  end

  test "should create booking" do
    visit bookings_url
    click_on "New booking"

    fill_in "Activity", with: @booking.activity_id
    fill_in "Booking date", with: @booking.booking_date
    fill_in "End time", with: @booking.end_time
    fill_in "Member", with: @booking.member_id
    fill_in "Start time", with: @booking.start_time
    fill_in "Status", with: @booking.status
    click_on "Create Booking"

    assert_text "Booking was successfully created"
    click_on "Back"
  end

  test "should update Booking" do
    visit booking_url(@booking)
    click_on "Edit this booking", match: :first

    fill_in "Activity", with: @booking.activity_id
    fill_in "Booking date", with: @booking.booking_date
    fill_in "End time", with: @booking.end_time.to_s
    fill_in "Member", with: @booking.member_id
    fill_in "Start time", with: @booking.start_time.to_s
    fill_in "Status", with: @booking.status
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking" do
    visit booking_url(@booking)
    click_on "Destroy this booking", match: :first

    assert_text "Booking was successfully destroyed"
  end
end
