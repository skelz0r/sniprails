class Generator < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true

  has_many :commands,
    class_name: 'CommandStep',
    dependent: :destroy,
    inverse_of: :generator
end
