class Calendar < ApplicationRecord
  belongs_to :users, optional: true

  validates :title, presence: true
end
