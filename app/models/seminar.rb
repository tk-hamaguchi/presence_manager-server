class Seminar < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user

  has_many   :users, through: :attends
  has_many   :attends
end
