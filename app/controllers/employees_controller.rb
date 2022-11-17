class EmployeesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index()
    @employees = Employee.all
  end

  def create()
    employee_params = params.require(:employee).permit(:firstname, :lastname, :email, :birthday)
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save!
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def new()
    @employee = Employee.new
  end

  def edit()
  end

  def show()
  end

  def update()
  end

  def update()
  end

  def destroy()
  end

end
