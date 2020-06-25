class Instructor < ApplicationRecord
    has_many :students

    def sort
        self.students.sort_by{|e| e.name}
    end 

    def average_age
        sum = 0
            self.students.each do |student|
                sum += student.age 
            end
        sum / self.students.size
    end
    
end
