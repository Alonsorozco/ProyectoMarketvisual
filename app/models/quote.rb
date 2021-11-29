class Quote < ApplicationRecord
    belongs_to :user
    has_many :publication
end
