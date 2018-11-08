class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Ficton"] }
  validate :clickbait?

  def clickbait?
    if !self.title.nil?
      array = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      if array.find { |phrase| self.title.include?(phrase) }.nil?
        errors.add(:title, "must be clickbait")
      end
    end
  end
end
