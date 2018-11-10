class Post < ActiveRecord::Base
    validates :title, presence: :true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), 
        message: "%{value} is not a valid category." }
    validate :title_validation



    def title_validation
        if title == nil
             errors.add(:title, "Post needs title")
        else 
      
        a = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if a.any? { |word| title.include?(word) }
            
        else 
            errors.add(:title, "Invalid title")
        end
    end
    end 
end