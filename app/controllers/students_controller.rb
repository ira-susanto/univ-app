class StudentsController < ApplicationController
  
  # GET /students or /students.json
  def index
    @students = Student.all
  end

end
