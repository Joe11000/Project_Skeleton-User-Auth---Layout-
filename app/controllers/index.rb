get '/' do
  @categories = Category.all
  erb :index
end

# submit a post to Category :category_id
get '/create_post/:category_id' do 
    @current_category = Category.find(params[:category_id]);
    #passing in current category
    erb :create_post
end

# edit a post with correct secret encrypted_url
get '/edit_post/:secret_edit_post_url' do
  @post_to_edit = Post.find_by(encrypted_url: params[:secret_edit_post_url]) # get post by encrypted url

  # if post exists
  if !post_to_edit.empty?
      @current_category = Category.find(@post_to_edit.category_id) # get the category name 
    erb :create_post                                               # display previous post
  else
    redirect to '/'
  end
end

post '/create_post/:category_id' do

    newpost = Post.create(params[:post])
    edit_post_url = newpost.encrypted_url
    puts "/n/n/n encryped_url = \"#{edit_post_url}\""

    redirect to "/category/#{params[:post][:category_id]}"
    # or redirect to "/category/#{params[:category_id]}"
end

get '/list_posts_for_category/:category_id' do
    @current_category = Category.find(:category_id)   # get category 
    @posts_list = current_category.posts              # get all posts of @current_category
    erb :list_posts_for_category 
end


get '/create_category' do
  erb :create_category
end

post '/create_category' do
   new_category = Category.create(params[:category])

    # if category wasn't saved
    if new_category.new?
      puts "\n\n\n\nCategory not Created!!\n\n\n"   # log an error onto terminal
      redirect to '/'                               # send them back to the main page
    end 

    redirect to '/list_posts_for_category/:category_id' # check out the new category page
end



