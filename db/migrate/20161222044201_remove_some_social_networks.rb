class RemoveSomeSocialNetworks < ActiveRecord::Migration
  def change
    remove_column :users, :soundcloud_handle
    remove_column :users, :vimeo_handle
    remove_column :users, :youtube_handle
  end
end
