class  CreateObjectives < ActiveRecord::Migration
      def self.up
       create_table "objectives", :force => true do |t|
         t.string  :name
         t.string  :objective
         t.column :limit, :datetime
			t.integer :user_id
			t.integer :classroom_id
         t.timestamps
       end

     def self.down
       drop_table "comments"
     end
 end end
