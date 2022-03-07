class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.integer :issue_id
      t.string :repository_url

      t.timestamps
    end
  end
end
