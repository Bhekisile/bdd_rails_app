# frozen_string_literal: true

# This is the comments controller
class CommentsController < ApplicationController
  before_action :set_article
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    if current_user
      create_comment_for_user
    else
      flash[:alert] = 'Please sign in or sign up first'
      redirect_to new_user_session_path
    end
  end

  private

  def create_comment_for_user
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      broadcast_comment
      flash[:notice] = 'Comment has been created'
    else
      flash.now[:alert] = 'Comment has not been created'
    end
    redirect_to article_path(@article)
  end

  def broadcast_comment
    ActionCable.server.broadcast 'comments',
                                 render_to_string(partial: 'comments/comment', object: @comment)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
