class Player < ApplicationRecord
  belongs_to :team
  has_many :details_matches
  has_attached_file :foto,styles: {thumb:"60x60",medium:"100x100"},default_url:"/images/players/:style_missing.png",url: "/images/players/:id/:style_:filename",:path => ":rails_root/public/images/players/:id/:style_:filename"
  validates_attachment_content_type :foto, content_type:/\Aimage\/.*\z/
end
