class Team < ApplicationRecord
  belongs_to :user
  has_many :locals, :class_name => "Match", :foreign_key  => "local_id"
  has_many :visitants, :class_name => "Match", :foreign_key  => "visitant_id"
  belongs_to :championship
  has_many :details_matches
end