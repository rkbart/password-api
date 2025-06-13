class PasswordEntry < ApplicationRecord
  belongs_to :user
  validates :username, :password, :app_name, presence: true
end
