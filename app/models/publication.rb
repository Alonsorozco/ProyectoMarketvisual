class Publication < ApplicationRecord
    has_many :quotes
    belongs_to :user
    has_many :coments
    has_many :publication_category
    ratyrate_rateable :speed
end
