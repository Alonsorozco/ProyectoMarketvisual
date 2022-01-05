class Quote < ApplicationRecord
    belongs_to :user
    belongs_to :publication
    has_many :messages
    after_validation :report_validation_errors_to_rollbar
end
