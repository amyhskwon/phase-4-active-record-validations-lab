class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum:250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait_titles

    def clickbait_titles
        if title.present?
            unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess")
                errors.add(:title, "Title is not clickbait-y enough!")
            end
        end
    end
end
