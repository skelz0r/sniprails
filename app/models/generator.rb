class Generator < ApplicationRecord
  validates :title, presence: true
  validates :commands, presence: true
end
