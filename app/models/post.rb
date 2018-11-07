class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait

  def is_clickbait
    baito = ['Won\'t Believe', 'Secret', 'Top', 'Guess']
    testo = baito.any? {|bait| title.include?(bait) if title}
    unless testo 
      errors.add(:bait_status, 'Doesn\'t include bait')
    end
  end
end
