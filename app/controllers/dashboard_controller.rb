class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @total_members = Member.count
    @active_members = Member.active.count
    @total_staff = Staff.count
    @active_staff = Staff.active.count
    @total_gyms = Gym.count
    @active_gyms = Gym.active.count
    @today_attendances = Attendance.today.count
    @today_bookings = Booking.today.count
    @pending_payments = Payment.pending.count
    @overdue_invoices = Invoice.overdue.count
  end
end
