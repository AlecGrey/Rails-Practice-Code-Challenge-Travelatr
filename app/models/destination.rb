class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    validates :name, presence: true, uniqueness: true
    validates :country, presence: true, uniqueness: true

    def recent_5_posts
        self.posts.max_by(5) {|post| post.created_at}
    end

    def featured_post
        self.posts.max_by {|post| post.likes}
    end
    
    def unique_bloggers
        self.bloggers.uniq
    end

    def average_unique_blogger_age
        self.unique_bloggers.map {|b| b.age}.reduce do |avg, current|
            (avg + current) / 2
        end
    end
end
