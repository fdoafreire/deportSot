class Championship < ApplicationRecord
	has_many :matches
	has_many :championships
end
