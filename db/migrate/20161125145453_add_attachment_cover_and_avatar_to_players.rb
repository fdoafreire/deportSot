class AddAttachmentCoverAndAvatarToPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :players, :foto
  end
end
