class News < ApplicationRecord
  # Validation
  with_options presence: true do
    validates :title
    validates :content
  end
end
