class Participant < ApplicationRecord
  belongs_to: :user, dependent: :destroy
  belongs_to: :practiced, ependent: :destroy
end
