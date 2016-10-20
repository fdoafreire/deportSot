class Match < ApplicationRecord
  belongs_to :local, :class_name => "Team",:foreign_key  => "local_id" 
  belongs_to :visitant, :class_name => "Team",:foreign_key  => "visitant_id" 
  belongs_to :championship
  has_many :details_matches
end
