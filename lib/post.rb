class Post

    # Replace the attributes by your own columns.
    attr_accessor :id, :title, :content, :comments

    def initialize
        @comments = []
    end
end