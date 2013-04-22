class Seminar < ActiveRecord::Base
  belongs_to :venue
  has_many   :users, through: :attends
  has_many   :attends
end
