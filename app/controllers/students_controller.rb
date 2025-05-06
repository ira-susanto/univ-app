class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  def edit  
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:notice] = "You have successfully signed up"
      redirect_to @student
    else
      render :new
    end
  end

  def update 
    if @student.update(student_params)
      flash[:notice] = "You have successfully updated your profile"
      redirect_to @student
    else
      render :edit
    end 
  end 

  def show
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end 

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email)
    end
end
