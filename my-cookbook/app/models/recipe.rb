class Recipe < ApplicationRecord
  validates :title , presence: true
  validates :cook_time , presence: true
  validates :cuisine_id , presence: true
  validates :method , presence: true
  validates :ingredients , presence: true
  validates :recipe_type , presence: true
  validates :difficulty, presence: true
  validates :recipe_type_id, presence: true
  belongs_to :cuisine
  belongs_to :recipe_type
end
