class PasswordEntriesController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: current_user.password_entries
  end

  def create
    entry = current_user.password_entries.new(password_entry_params)
    if entry.save
      render json: entry, status: :created
    else
      render json: { errors: entry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    entry = current_user.password_entries.find(params[:id])
    entry.destroy
    head :no_content
  end

  private

  def password_entry_params
    params.require(:password_entry).permit(:username, :password, :app_name)
  end
end
