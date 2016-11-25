class Team < ApplicationRecord
  belongs_to :user
  has_many :locals, :class_name => "Match", :foreign_key  => "local_id"
  has_many :visitants, :class_name => "Match", :foreign_key  => "visitant_id"
  belongs_to :championship
  has_many :details_matches
  has_attached_file :avatar,style: {thumb:"100x100",medium:"300x300"},default_url:"/images/teams/:style_missing.png",url: "/images/teams/:id/:style_:filename",:path => ":rails_root/public/images/teams/:id/:style_:filename"
  validates_attachment_content_type :avatar, content_type:/\Aimage\/.*\z/

end