class ReviewExperience < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates :comment, :rating, presence: true
end
