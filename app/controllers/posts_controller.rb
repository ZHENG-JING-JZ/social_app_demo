class PostsController < ApplicationController
  include Pagy::Backend
  before_action :set_post, only: :destroy
  before_action :authenticate_user!, except: :index

  # GET /posts
  # GET /posts.json
  def index
    @show_time = false
    if params[:user_id].present?
      @pagy, @posts = pagy Post.includes(:likes).where("post.user_id = #{params[:user_id]}").order('posts.created_at DESC')
      @show_time = true
    else
      @pagy, @posts = pagy Post.includes(:likes).order('posts.created_at DESC')
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "Post was successfully created." }
        format.json { render :index }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.fetch(:post,{}).permit(:content, :user_id)
    end
end
