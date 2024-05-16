class CreateTestimonials < ActiveRecord::Migration[7.1]
  def change
    create_table :testimonials do |t|
      t.string :message
      t.belongs_to :product, foreign_key: true
      t.timestamps
    end
  end
end
