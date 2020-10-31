class Post < ApplicationRecord

    belongs_to :blogger
    belongs_to :destination
    
    validates :title, presence: true
    validates :content, length: {minimum: 100}
    validates :blogger_id, presence: true
    validates :destination_id, presence: true

    def add_like
        if self.likes
            self.likes += 1
        else
            self.likes = 1
        end
    end
    
end
