class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :edit, :create, :destroy]


    def new
     @post = Post.new
    end

    def create
      @post = Post.new(user_id: current_user.id, content: params[:post][:content])
      
      if @post.save
      	flash[:success] = "Post submitted"
      	redirect_to root_url
      else
      	flash.now[:danger] = "Error"
      	render 'new'
      end
    end


	def index

		@posts = Post.all
   
	end

   def destroy 
   end

private

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Must be logged in to do that"
      redirect_to login_url 
    end
  end

end
