class Task < ApplicationRecord
  validates :user, presence: true
  validates :text, presence: true
end
