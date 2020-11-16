class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by(params[:id])
  end

  def activate
    @student = Student.find_by(params[:id])
    @student.activate_student
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def activate_student
      if self.active?
        self.update_attribute(:active, false)
      else
        self.update_attribute(:active, true)
      end
    end
end