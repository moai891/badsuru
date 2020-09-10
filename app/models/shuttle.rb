class Shuttle < ApplicationRecord
  has_many :practices
  has_ancestry
end
