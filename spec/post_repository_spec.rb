require 'post_repository'
require './app'

def reset_posts_table
    seed_sql = File.read('spec/seeds_posts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
    connection.exec(seed_sql)
end
RSpec.describe PostRepository do
    before(:each) do 
        reset_posts_table
    end
    it 'finds cohort 1 with related students' do
        repo = PostRepository.new
        post = repo.find_with_comments(1)

        expect(post.title).to eq 'Baby Photos'
        expect(post.comments.length).to eq 2
    end
    it "output the list of albums" do
        io = double :i
        post = PostRepository.new
        app = Application.new('blog', io, post)
        expect(io).to receive(:puts).with("Here is the post details: \n").ordered
        expect(app.run).to eq "Baby Photos - 6 month baby pics\n1 - Ray - Great baby pics\n2 - Jay - Wow great baby\n"
    end
end