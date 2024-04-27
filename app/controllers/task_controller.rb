class TaskController < ApplicationController
  before_action :check_user
  def index
    @tasks = Task.where(:user => current_user.email)
  end

  private
  def check_user
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
