class InstructorsController < ApplicationController

  before_action :current_instructor, only: [:show]
  @@find_average = []
  def index
    @instructors = Instructor.all
  end

  def show
  end


  private

  def current_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:name)
  end


end
