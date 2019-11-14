class CommentsController < ApplicationController
  before_action :set_category, :set_post
  def create
    @comment = if @category.present?
                 @category.comments.new(comment_params)
               else
                 @post.comments.new(comment_params)
               end
    @comment.save
  end

  private

  def comment_params
    parameters = params.require(:comment).permit(:content, :category_id, :post_id)
    parameters[:user_id] = current_user.id
    parameters
  end

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id].present?
  end

  def set_post
    @post = Post.find(params[:post_id]) if params[:post_id].present?
  end
end
