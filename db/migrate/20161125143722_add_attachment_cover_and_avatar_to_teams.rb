class AddAttachmentCoverAndAvatarToTeams < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :teams, :avatar
  end
end
