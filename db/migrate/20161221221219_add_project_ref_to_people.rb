class AddProjectRefToPeople < ActiveRecord::Migration[5.0]
  def change
    add_reference :people, :project, foreign_key: true
  end
end
