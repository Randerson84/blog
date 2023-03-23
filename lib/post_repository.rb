require_relative 'post'
require_relative 'comment'

class PostRepository
    def find_with_comments(id)
        # Executes the SQL query:
        sql = 'SELECT posts.id, posts.title, posts.content AS posts_content, comments.id AS comments_id, comments.content, comments.author FROM posts JOIN comments ON comments.post_id = posts.id WHERE posts.id = $1;'
        params = [id]
        results = DatabaseConnection.exec_params(sql, params)

        post = Post.new
        post.id = results.first['id']
        post.title = results.first['title']
        post.content = results.first['posts_content']

        results.each do |record|
            comment = Comment.new
            comment.id = record['id']
            comment.content = record['content']
            comment.author = record['author']
            comment.post_id = record['post_id']
            comment.comments_id = record['comments_id']
      
            post.comments << comment
          end
      
          return post
      end
end