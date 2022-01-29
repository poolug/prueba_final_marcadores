class Mark < ApplicationRecord
  belongs_to :category
  belongs_to :type

  validates :url, presence: true
end
