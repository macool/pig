class AddUserConfirmable < ActiveRecord::Migration
  def self.up
    add_column :pig_users, :confirmation_token, :string
    add_column :pig_users, :confirmed_at, :datetime
    add_column :pig_users, :confirmation_sent_at, :datetime
    add_column :pig_users, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :pig_users, :confirmation_token, :unique => true

    Pig::User.update_all({:confirmed_at => DateTime.now, :confirmation_sent_at => DateTime.now})
  end

  def self.down
    remove_column :pig_users, [:confirmed_at, :confirmation_token, :confirmation_sent_at]
  end
end
