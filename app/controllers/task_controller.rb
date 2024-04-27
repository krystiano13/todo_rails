class TaskController < ApplicationController
  before_action :check_user
  def index
    @tasks = Task.where(:user => current_user.email)
  end

  def destroy
    id = params[:id]
    Task.destroy(id)
    redirect_to tasks_path
  end

  private
  def check_user
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
