class StudentsController < ApplicationController
  before_action :current_student, only: [:show, :edit, :update]
  def index
    @students = Student.all
  end
  
  def show
  end


  def new
    @student = Student.new
    @instructor = Instructor.all
  end

  def create
    @student = Student.create(student_params)
    if @student.save
      redirect_to "/instructors/#{@student.instructor.id}"
    else
      flash[:errors] = @student.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @student.update(student_params)
    redirect_to @student
  end

  private

  def current_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end

  end

