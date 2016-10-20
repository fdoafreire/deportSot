class DetailsMatch < ApplicationRecord
  belongs_to :match
  belongs_to :team
  belongs_to :player
  belongs_to :event
end
