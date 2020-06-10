class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end
  def show 
    @employee = Employee.find(params[:id])
  end 
  def new
   @employee = Employee.new 
   @dogs = Dog.all
  end
  def create
    employee = Employee.create(big_params)
    if employee.valid?
      redirect_to employee_path(employee.id)
    else
      flash[:employee_errors]=employee.errors.full_messages
      redirect_to new_employee_path 
    end
  end
  def edit
    @employee = Employee.find(params[:id])
    @dogs = Dog.all
  end
  def update
    employee = Employee.update(big_params)
    if employee
      redirect_to employee_path(employee)
    else
      flash[:employee_errors]=employee.errors.full_messages
      redirect_to edit_employee_path 
    end
  end
  private
  def big_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end
end
