class Relationship < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"
  # has_many :yyy, through: :xxx, source: :zzz
end
