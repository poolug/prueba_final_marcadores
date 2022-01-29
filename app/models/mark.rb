class Mark < ApplicationRecord
  belongs_to :category
  belongs_to :type

  validates :url, presence: {message: "La url no puede ir vacío"}
end
