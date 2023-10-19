class AddViewCountToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :view_count, :integer
  end
end
