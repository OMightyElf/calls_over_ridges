class ChangeCurrentStateToInteger < ActiveRecord::Migration
  def change
  	change_column :users, :current_state, 'integer USING CAST(current_state AS integer)', default: 0
  end
end
