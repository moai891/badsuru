class Profile < ApplicationRecord
  belongs_to  :user, optional: true
  validates   :old, :job, :experience, :phonenumber, :practice_time, presence: true
end
