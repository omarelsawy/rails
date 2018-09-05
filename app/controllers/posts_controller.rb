class PostsController < ApplicationController
    
  # http_basic_authenticate_with name: "omar" , password: "123456" , except: [:index , :show]

   def men
     @ali = Comment.new
     @ali.save
     #ali.title = 'ff'
     render plain: @ali.inspect
   end

   def index
       @posts = Post.all
   end

   def new
      if current_user
        @post = current_user.posts.build
      else
        @post = Post.new
      end
   end

   def show
   	  @post = Post.find(params[:id])
   end

   def create
       #render plain: params[:post].inspect
       if current_user
        @post = current_user.posts.build(post_params)
      else
        @post = Post.new(post_params)
      end
       if(@post.save)
       	  redirect_to @post
       else
          render 'new'
       end
   end

   def edit
   	   @post = Post.find(params[:id])
   end
   def update
   	   @post = Post.find(params[:id]) 
   	   if(@post.update(post_params))
       	  redirect_to @post
       else
          render 'edit'
       end
   end

   def destroy
   	   @post = Post.find(params[:id])
   	   @post.destroy
   	   redirect_to posts_path
   end

   private def post_params
   	   params.require(:post).permit(:title , :body)
   end

end

















