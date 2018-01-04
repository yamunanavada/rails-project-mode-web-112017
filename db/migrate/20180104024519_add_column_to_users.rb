class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean
    User.all.each do |user|
      user.update_attributes(admin: false)
    end
  end
end
