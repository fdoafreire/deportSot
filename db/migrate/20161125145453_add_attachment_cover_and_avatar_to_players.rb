class AddAttachmentCoverAndAvatarToPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :players, :avatar
  end
end
