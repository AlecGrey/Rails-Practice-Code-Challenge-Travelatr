class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence: true, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_post_likes
        self.posts.sum {|post| post.likes}
    end

    def featured_post
        self.posts.max_by {|post| post.likes}
    end

    def top_5_destinations
        #returns top 5 destination objects!
        posts_per_destination.max_by(5) {|k,v| v}.map do |arr|
            arr[0]
        end
    end

    def post_destinations
        self.posts.map {|post| Destination.find(post.destination_id)}
    end

    def posts_per_destination
        destination_hash = {}
        self.post_destinations.each do |d|
            if destination_hash.include?(d)
                destination_hash[d] += 1
            else
                destination_hash[d] = 1
            end
        end
        destination_hash
    end


end
