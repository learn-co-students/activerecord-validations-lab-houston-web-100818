class Post < ActiveRecord::Base
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), 
        message: "%{value} is not a valid category." }
    validate :title_validation



    def title_validation
        a = ["Won't Believe", "Secret", "Top [number]", "Guess"]

        if title == nil
             errors.add(:title, "Post needs title")
        elsif !a.any? { |word| title.include?(word) }
            errors.add(:title, "Invalid title")
        end
    
    end 
end