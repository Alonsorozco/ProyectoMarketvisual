class Message < ApplicationRecord
  belongs_to :user
  belongs_to :quote
  belongs_to :publication
end
