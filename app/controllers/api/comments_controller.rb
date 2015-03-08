class Api::CommentsController < ApplicationController
  def index
    render json: Comment.where(post_id: post_id)
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: comment, status: :not_acceptable
    end
  end

  private

  def post_id
    params[:post_id]
  end

  def comment_params
    params.permit(:author, :body, :post_id)
  end
end
