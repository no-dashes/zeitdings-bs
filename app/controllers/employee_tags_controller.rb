class EmployeeTagsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index()
    @employee_tags = EmployeeTag.all
  end

  def create()
    @employee_tag = EmployeeTag.new(employee_tag_params)
    if @employee_tag.valid?
      @employee_tag.save!
      redirect_to employee_tags_path
    else
      render 'new'
    end
  end

  def new()
    @employee_tag = EmployeeTag.new
  end

  def edit()
    @employee_tag = EmployeeTag.find(params[:id])
  end

  def show()
    @employee_tag = EmployeeTag.find(params[:id])
  end

  def update()
    @employee_tag = EmployeeTag.find(params[:id])
    if @employee_tag.update(employee_tag_params)
      flash[:success] = "#{@employee_tag.title} geändert."
      return redirect_to employee_tags_path
    else
      flash[:danger] = "#{@employee_tag.title} nicht geändert."
      return redirect_to employee_tags_path
      # render 'edit'
    end
  end

  def destroy()
    @employee_tag = EmployeeTag.find(params[:id])
    @employee_tag.destroy
    flash[:success] = "#{@employee_tag.title} gelöscht."
    redirect_to employee_tags_path
  end

  private def employee_tag_params
    params.require(:employee_tag).permit(:title)
  end
end
