class AddAttachmentCoverAndAvatarToTeams < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :teams, :escudo
  end
end
