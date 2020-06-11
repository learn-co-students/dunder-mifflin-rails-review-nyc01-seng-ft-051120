class EmployeesController < ApplicationController
    before_action :set_emp, only: [:show,:edit, :update ]
    def index
    @employees=Employee.all
    end
    def show
        set_emp
    
    end
    def new
    @employee=Employee.new
    @dogs=Dog.all
    end

    def create
    @employee=Employee.create(emp_params(:first_name, 
                                            :last_name, 
                                            :alias, 
                                            :title, 
                                            :office, 
                                            :img_url, 
                                            :dog_id
                                        )
                                    )
  show_error
    end
    
   
    def edit
        set_emp
        @dogs=Dog.all
    end

    def update
        set_emp
    @employee.update(emp_params(:first_name,
                                :last_name,
                                :alias,
                                :img_url ))
    
    show_error
    end


    private
    def set_emp
        @employee=Employee.find(params[:id])
    end
    def emp_params(*args)
        params.require(:employee).permit(*args)
    end
    def show_error
        if @employee.valid?
            redirect_to employee_path(@employee)
            else 
                flash[:errors] = @employee.errors.full_messages
                redirect_to new_employee_path
            end
    end
end
