class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_answers

  scope :corrects, -> { where(correct: true)}

  private

  def validate_count_answers
    errors.add(:question) if self.question.answers.count >= 4
  end
end
