class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update, :destroy]

    def index
        @employees = Employee.all
    end
    
    def new
        @employee = Employee.new

        @dogs = Dog.all
    end
    
    def create
        employee = Employee.create(employee_params)

      if employee.valid?
        redirect_to employee_path(@employee)
      else
        flash[:employee_errors] = employee.errors.full_messages
        redirect_to new_employee_path
      end
  
    end
    
    def edit
        @dogs = Dog.all
    end
    
    def update
        @employee.update(employee_params)

        redirect_to employee_path(@employee)
    end
    
    def show
    
    end
    
    def destroy
    
    end

    private

    def employee_params
        params.require(:employee).permit!
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end
end
