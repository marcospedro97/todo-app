class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :project_id, presence: true

  belongs_to :project
end
