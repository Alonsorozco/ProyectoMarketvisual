class Category < ApplicationRecord
    belongs_to :parent_category, class_name: "Category", foreign_key: "category_id", optional: true
    has_many :sub_categories, class_name: "Category", foreign_key: "category_id"
    has_many :publication_categories
end
