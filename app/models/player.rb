class Player < ApplicationRecord
  belongs_to :team
  has_many :details_matches
end
