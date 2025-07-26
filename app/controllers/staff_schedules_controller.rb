class StaffSchedulesController < ApplicationController
  before_action :set_staff_schedule, only: %i[ show edit update destroy ]

  # GET /staff_schedules or /staff_schedules.json
  def index
    @staff_schedules = StaffSchedule.all
  end

  # GET /staff_schedules/1 or /staff_schedules/1.json
  def show
  end

  # GET /staff_schedules/new
  def new
    @staff_schedule = StaffSchedule.new
  end

  # GET /staff_schedules/1/edit
  def edit
  end

  # POST /staff_schedules or /staff_schedules.json
  def create
    @staff_schedule = StaffSchedule.new(staff_schedule_params)

    respond_to do |format|
      if @staff_schedule.save
        format.html { redirect_to @staff_schedule, notice: "Staff schedule was successfully created." }
        format.json { render :show, status: :created, location: @staff_schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @staff_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff_schedules/1 or /staff_schedules/1.json
  def update
    respond_to do |format|
      if @staff_schedule.update(staff_schedule_params)
        format.html { redirect_to @staff_schedule, notice: "Staff schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @staff_schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @staff_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_schedules/1 or /staff_schedules/1.json
  def destroy
    @staff_schedule.destroy!

    respond_to do |format|
      format.html { redirect_to staff_schedules_path, status: :see_other, notice: "Staff schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_schedule
      @staff_schedule = StaffSchedule.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def staff_schedule_params
      params.expect(staff_schedule: [ :staff_id, :gym_id, :day_of_week, :start_time, :end_time ])
    end
end
