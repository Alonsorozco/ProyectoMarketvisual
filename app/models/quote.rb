class Quote < ApplicationRecord
    belongs_to :user
    has_many :publication
    after_validation :report_validation_errors_to_rollbar
end
