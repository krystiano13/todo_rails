class TaskController < ApplicationController
  before_action :check_user
  def index; end

  private
  def check_user
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
