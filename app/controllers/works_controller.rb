# frozen_string_literal: true

# to get job
class WorksController < ApplicationController
  include WorksHelper
  def main; end

  def prom; end

  def test_page
    @work = Work.new(about_form_params)
    @work.user_id = current_user.id
    @male = params[:male]
    @work.male = set_male(@male)
    if @work.valid?
      @work.save
      flash[:notice] = 'Ваша заявка вскоре будет рассмотрена'
    else
      flash[:notice] = 'Что-то пошло не так'
    end
  end

  private

  def about_form_params
    params.permit(:age, :about, :task_1, :task_2, :task_3)
  end
end