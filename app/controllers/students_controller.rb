class StudentsController < ApplicationController
  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:notice] = "You have successfully signed up"
      redirect_to root_path
    else
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email)
    end
end
