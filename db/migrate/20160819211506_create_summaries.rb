class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|

      t.string :location
      t.integer :number_of_job_orders
      t.integer :job_orders_past_due
    end
  end
end
