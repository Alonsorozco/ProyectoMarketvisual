class Publication < ApplicationRecord
    after_validation :report_validation_errors_to_rollbar
    has_many :quotes
    belongs_to :user
    has_many :coments
    has_many :publication_categories
    has_one_attached :image
    has_many :messages
    ratyrate_rateable :speed
end
