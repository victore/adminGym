class MembershipPlansController < ApplicationController
  before_action :set_membership_plan, only: %i[ show edit update destroy ]

  # GET /membership_plans or /membership_plans.json
  def index
    @membership_plans = MembershipPlan.all
  end

  # GET /membership_plans/1 or /membership_plans/1.json
  def show
  end

  # GET /membership_plans/new
  def new
    @membership_plan = MembershipPlan.new
  end

  # GET /membership_plans/1/edit
  def edit
  end

  # POST /membership_plans or /membership_plans.json
  def create
    @membership_plan = MembershipPlan.new(membership_plan_params)

    respond_to do |format|
      if @membership_plan.save
        format.html { redirect_to @membership_plan, notice: "Membership plan was successfully created." }
        format.json { render :show, status: :created, location: @membership_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @membership_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /membership_plans/1 or /membership_plans/1.json
  def update
    respond_to do |format|
      if @membership_plan.update(membership_plan_params)
        format.html { redirect_to @membership_plan, notice: "Membership plan was successfully updated." }
        format.json { render :show, status: :ok, location: @membership_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @membership_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membership_plans/1 or /membership_plans/1.json
  def destroy
    @membership_plan.destroy!

    respond_to do |format|
      format.html { redirect_to membership_plans_path, status: :see_other, notice: "Membership plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership_plan
      @membership_plan = MembershipPlan.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def membership_plan_params
      params.expect(membership_plan: [ :name, :description, :price, :duration_months, :features, :status ])
    end
end
