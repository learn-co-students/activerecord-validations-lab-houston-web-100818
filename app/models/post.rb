class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validates_with MyValidator
end

class MyValidator < ActiveModel::Validator
    def validate(post)
        if !post.title.match?(/([Ww]on't believe)|([Ss]ecret)|([Tt]op \d)|([Gg]uess)/)
            errors.add(:title, "Stop writing clickbait and reexamine your life")
        end
    end
end