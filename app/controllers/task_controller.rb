class TaskController < ApplicationController
  before_action :check_user
  def index
    @tasks = Task.where(:user => current_user.email)
    @task = Task.new
  end

  def create
    task = Task.new(get_task_params)
    task.done = false
    task.user = current_user.email

    if task.save
      redirect_to tasks_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def update
    task = Task.where(:id => params[:id])

    if task.present?
      task.update(get_task_params)
      redirect_to tasks_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def done
    task = Task.where(:id => params[:id])
    if task.present?
      task.update(done: true)
      redirect_to tasks_path
    end
  end

  def undone
    task = Task.where(:id => params[:id])
    if task.present?
      task.update(done: false)
      redirect_to tasks_path
    end
  end

  def destroy
    id = params[:id]
    Task.destroy(id)
    redirect_to tasks_path
  end

  private
  def get_task_params
    params.require(:task).permit(:text, :done);
  end

  private
  def check_user
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
