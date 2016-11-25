class Player < ApplicationRecord
  belongs_to :team
  has_many :details_matches
  has_attached_file :avatar,style: {thumb:"100x100",medium:"300x300"},default_url:"/images/players/:style/missing.png"
  validates_attachment_content_type :avatar, content_type:/\Aimage\/.*\z/
end
