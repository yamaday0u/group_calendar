class Calendar < ApplicationRecord
  belongs_to :users, optional: true
end
