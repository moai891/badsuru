class Participant < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :practice, dependent: :destroy
end
