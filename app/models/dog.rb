class Dog < ApplicationRecord
    has_many :employees

    def self.ordered_by_humans_number
        Dog.all.sort_by do |dog|
            dog.employees.count
        end
    end

end
