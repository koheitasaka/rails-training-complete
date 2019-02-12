class AddUserIdToMyThreads < ActiveRecord::Migration[5.2]
  def change
    add_reference :my_threads, :user, foreign_key: true
  end
end
