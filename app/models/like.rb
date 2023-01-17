class Like < ApplicationRecord
  belongs_to :hoot
  belongs_to :user
  validates :hoot_id, uniqueness: { scope: :user_id }
end
