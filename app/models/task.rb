class Task < ApplicationRecord
  has_many :task_items , dependent: :destroy
  accepts_nested_attributes_for :task_items,  :reject_if => :all_blank, :allow_destroy => true
end
