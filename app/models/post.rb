class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Ficton"] }
  validate :clickbait?

  def clickbait?
    if !self.title.nil?
      array = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      found = array.find { |phrase| self.title.include?(phrase) }

      if found.nil?
        errors.add(:title, "must be clickbait")
      end
    end
  end

end

# Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should return false.
