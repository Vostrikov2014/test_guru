class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  #VALID_EMAIL = /.+@.+../

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  #has_secure_password

  #validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def user_results(level)
    tests.where(level: level)
  end

  def admin?
    is_a?(Admin)
  end
end