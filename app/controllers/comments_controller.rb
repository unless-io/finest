class CommentsController < ApplicationController
  before_action :set_item, only: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.item = @item
    if @comment.save
      redirect_to preview_path(google_api_id: @item.google_api_id)
      flash[:notice] = "Comment succesfully created"
    else
      render :new
      flash[:danger] = "Something went wrong"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to preview_path(google_api_id: @item.google_api_id)
      flash[:notice] = "Comment succesfully updated"
    else
      render :edit
      flash[:danger] = "Something went wrong"
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
