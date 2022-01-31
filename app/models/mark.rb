class Mark < ApplicationRecord
  belongs_to :category
  belongs_to :type

  validates :url, presence: true

  def sub_category_name
    if !self.sub_category.nil?
      c = Category.find(self.sub_category)
      if c.present?
        return c.name
      else
        return "not found"
      end
    end
  end
end
