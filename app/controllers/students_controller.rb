class StudentsController < ApplicationController
  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/new
  def new
    @student = Student.new
  end
end
