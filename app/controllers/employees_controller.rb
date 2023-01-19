class EmployeesController < ApplicationController
  include PaginateConcern

  skip_before_action :verify_authenticity_token

  def index()
    @employees = paginate Employee
  end

  def create()
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
    @employee = Employee.find(params[:id])
  end

  def show()
    @employee = Employee.find(params[:id])
  end

  def update()
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:success] = "#{@employee.name} geändert."
      return redirect_to employees_path
    else
      flash[:danger] = "#{@employee.name} nicht geändert."
      # return redirect_to employees_path
      render 'edit'
    end
  end

  def destroy()
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:success] = "#{@employee.name} gelöscht."
    redirect_to employees_path
  end

  private def employee_params
    params.require(:employee).permit(:firstname, :lastname, :email,
      :birthday, :office_id, employee_tag_ids: [])
  end
end
