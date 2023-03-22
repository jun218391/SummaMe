class Relationship < ApplicationRecord
#   Customerテーブルを参照
  belongs_to :follower, class_name: "Customer"
  belongs_to :followed, class_name: "Customer"
end
