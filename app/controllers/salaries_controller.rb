class SalariesController < ApplicationController
  before_action :set_salary, only: [:show, :edit, :update, :destroy]
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /salaries
  # GET /salaries.json
  def index
    @salaries = Salary.all
  end

  # GET /salaries/1
  # GET /salaries/1.json
  def show
  end

  # GET /salaries/new
  def new
    @salary = Salary.new
  end

  # GET /salaries/1/edit
  def edit
    render :new
  end

  # POST /salaries
  # POST /salaries.json
  def create
    @salary = Salary.new(salary_params)

    respond_to do |format|
      if @salary.save
        format.html do
          flash[:success] = {title: "Salary was succsessfully created."}
          redirect_to profile_path
        end
        format.json { render :show, status: :created, location: @salary }
      else
        format.html do
          flash.now[:error] = {title: "Salary could not be created.", list: @salary.errors.map(&:full_message)}
          render :new
        end
        format.json { render json: @salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salaries/1
  # PATCH/PUT /salaries/1.json
  def update
    respond_to do |format|
      if @salary.update(salary_params)
        format.html do
          flash[:success] = {title: "Salary was succsessfully updated."}
          redirect_to profile_path
        end
        format.json { render :show, status: :ok, location: @salary }
      else
        format.html do
          flash.now[:error] = {title: "Salary could not be updated.", list: @salary.errors.map(&:full_message)}
          render :new
        end
        format.json { render json: @salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salaries/1
  # DELETE /salaries/1.json
  def destroy
    @salary.destroy
    respond_to do |format|
      format.html { redirect_to profile_path, notice: "Salary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_salary
    @salary = Salary.find(params[:id])
  end

  def set_location
    @salary.location ||= Location.new
  end

  # Only allow a list of trusted parameters through.
  def salary_params
    params.require(:salary).permit(:amount, :start_date, :end_date, :current_salary, location_attributes: [:name, :place_id]).merge(user: current_user)
  end
end
