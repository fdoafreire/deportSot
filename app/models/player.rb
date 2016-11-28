class Player < ApplicationRecord
  belongs_to :team
  has_many :details_matches
  has_attached_file :foto,style: {thumb:"100x100",medium:"300x300"},default_url:"/images/players/:style/missing.png"
  validates_attachment_content_type :foto, content_type:/\Aimage\/.*\z/
end
