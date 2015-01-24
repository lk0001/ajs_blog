class Api::PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: post, status: :not_acceptable
    end
  end

  private

  def post_params
    params.permit(:title, :body)
  end
end
