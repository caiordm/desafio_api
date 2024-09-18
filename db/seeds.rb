# class AddInitialItems < ActiveRecord::Migration[7.1]
#   def up
#     20.times do |i|
#       Item.create!(title: "Item ##{i}", description: "A item.", user_id: 2)
#     end
#   end

#   def down
#     Item.delete_all
#   end
# end

15.times do |i|
  Item.create!(title: "Item ##{i}", description: "A item.", user_id: 1)
end