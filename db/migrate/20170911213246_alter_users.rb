class AlterUsers < ActiveRecord::Migration[5.1]
  def up
    rename_table "users", "admin_users"
    add_column "admin_users", "username", :string, limit: 25, after: "email" # after is database-dependent
    change_column "admin_users", "email", :string, limit: 100
    rename_column "admin_users", "password", "hashed_password"
    puts "*** adding index on admin_users/username ***"
    add_index "admin_users", "username"
  end
  def down
    remove_index "admin_users", "username"
    rename_column "admin_users", "hashed_password", "password"
    change_column "admin_users", "email", :string, default: '', null: false
    remove_column "admin_users", "username" # no options on removal
    rename_table "admin_users", "users"
  end
end
