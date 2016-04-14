class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :carrerships , foreign_key: "user_id", dependent: :destroy
  has_many :jobs, through: :carrerships
  
  has_many :hopes, class_name: "Hope", foreign_key: "user_id", dependent: :destroy
  has_many :hope_jobs , through: :hopes, source: :job
  has_many :graduates, class_name: "Graduate", foreign_key: "user_id", dependent: :destroy
  has_many :graduate_jobs , through: :graduates, source: :job
  
  def hope(job)
    hopes.find_or_create_by(job_id: job.id)
  end

  def unhope(job)
    hope = hopes.find_by(job_id: job.id)
    hope.destroy if hope
  end

  def hope?(job)
    hope_jobs.include?(job)
  end

  def graduate(job)
    graduates.find_or_create_by(job_id: job.id)
  end

  def ungraduate(job)
    graduate = graduates.find_by(job_id: job.id)
    graduate.destroy if graduate
  end

  def graduate?(job)
    graduate_jobs.include?(job)
  end
end
