class StudentsController < ApplicationController
  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  def edit 
    @student = Student.find(params[:id])
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

  def update 
    @student = Student.find(params[:id])

    if @student.update(student_params)
      flash[:notice] = "You have successfully updated your profile"
      redirect_to @student
    else
      render :edit
    end 
  end 

  def show
    @student = Student.find(params[:id])
  end

  private
    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email)
    end
end
