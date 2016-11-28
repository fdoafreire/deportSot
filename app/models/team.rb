class Team < ApplicationRecord
  belongs_to :user
  has_many :locals, :class_name => "Match", :foreign_key  => "local_id"
  has_many :visitants, :class_name => "Match", :foreign_key  => "visitant_id"
  belongs_to :championship
  has_many :details_matches
  has_attached_file :escudo,styles: {thumb:"60x60",medium:"100x100"},default_url:"/images/teams/:style_missing.png",url: "/images/teams/:id/:style_:filename",:path => ":rails_root/public/images/teams/:id/:style_:filename"
  validates_attachment_content_type :escudo, content_type:/\Aimage\/.*\z/

end