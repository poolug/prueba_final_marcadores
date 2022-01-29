class Type < ApplicationRecord
  has_many :marks, dependent: :destroy
end
