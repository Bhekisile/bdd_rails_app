# frozen_string_literal: true

# Controller for the Articles
class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = 'Article has been created'
      redirect_to articles_path
    else
      flash.now[:danger] = 'Article has not been created'
      render :new
    end
  end

  def show
    @comment = @article.comments.build
    @comments = @article.comments
  end

  def edit
    return if @article.user == current_user

    flash[:alert] = 'You can only edit your own article.'
    redirect_to root_path
  end

  def update
    if @article.user == current_user
      if @article.update(article_params)
        flash[:success] = 'Article has been updated'
        redirect_to @article
      else
        flash.now[:danger] = 'Article has not been updated'
        render :edit
      end
    else
      flash[:alert] = 'You can only edit your own article.'
      redirect_to root_path
    end
  end

  def destroy
    return unless @article.destroy

    flash[:success] = 'Article has been deleted'
    redirect_to articles_path
  end

  protected

  def resource_not_found
    message = 'The article you are looking for could not be found'
    flash[:alert] = message
    redirect_to root_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
