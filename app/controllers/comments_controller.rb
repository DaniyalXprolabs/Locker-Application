class CommentsController < ApplicationController
  before_action :getProduct_ID, only: %i[create destroy]

  def create
    @comment = @product.comments.create(comment_params)
    @comment.commenter = current_user.username
    @comment.save
    redirect_to product_path(@product), notice: 'Comment added successfully'
  end

  def destroy
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def getProduct_ID
    @product = Product.find(params[:product_id])
  end
end
