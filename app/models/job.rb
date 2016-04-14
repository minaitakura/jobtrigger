class Job < ActiveRecord::Base
  validates :name, presence: true
  validates :company, presence: true
  
  has_many :carrerships , foreign_key: "job_id", dependent: :destroy
  has_many :users, through: :carrerships
  
  has_many :hopes, class_name: "Hope", foreign_key: "job_id", dependent: :destroy
  has_many :hope_users , through: :hopes, source: :user
  has_many :graduates, class_name: "Graduate", foreign_key: "job_id", dependent: :destroy
  has_many :graduate_users , through: :graduates, source: :user
end
