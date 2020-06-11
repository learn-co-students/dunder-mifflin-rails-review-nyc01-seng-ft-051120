class Employee < ApplicationRecord
    belongs_to :dog

    validates :alias, uniqueness: true

    def name
        p "#{first_name} #{last_name}"
    end
end
