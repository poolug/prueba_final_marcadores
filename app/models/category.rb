class Category < ApplicationRecord
  # belongs_to :category, optional: true
  # has_many :marks, dependent: :destroy
  enum status: [ :privateStatus, :publicStatus ]
  validates :status, presence: true

  belongs_to :father, class_name: 'Category', foreign_key: :category_id, optional: :true
  has_many :children, class_name: 'Category', dependent: :destroy

  scope :all_fathers, -> {where(category_id: nil)}

  scope :all_children, -> {where.not(category_id: nil)}

  def sub_category_name
    if !Mark.sub_category.nil?
      c = Mark.find(Mark.sub_category)
      if c.present?
        return c.name
      else
        return "not found"
      end
    end
  end

  def sub_categories
    if !self.category_id.present?
      c = Category.find_by(category_id)
      if c.present?
        return c.name
      else
        return "not found"
      end
    end
  end
  

end
