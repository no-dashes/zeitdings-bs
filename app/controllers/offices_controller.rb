class OfficesController < ApplicationController
  include PaginateConcern

  skip_before_action :verify_authenticity_token

  def index()
    @offices = paginate Office.order(floor: :asc)
  end

  def create()
    @office = Office.new(office_params)
    if @office.valid?
      @office.save!
      redirect_to offices_path
    else
      render 'new'
    end
  end

  def new()
    @office = Office.new
  end

  def edit()
    @office = Office.find(params[:id])
  end

  def show()
    @office = Office.find(params[:id])
  end

  def update()
    @office = Office.find(params[:id])
    if @office.update(office_params)
      flash[:success] = "#{@office.name} geändert."
      return redirect_to offices_path
    else
      flash[:danger] = "#{@office.name} nicht geändert."
      return redirect_to offices_path
      # render 'edit'
    end
  end

  def destroy()
    @office = Office.find(params[:id])
    @office.destroy
    flash[:success] = "#{@office.name} gelöscht."
    redirect_to offices_path
  end

  private def office_params
    params.require(:office).permit(:building, :floor, :number)
  end
end
