class Task < ApplicationRecord
  validates :user, presence: true
  validates :text, presence: true
  validates :done, presence: true
end
