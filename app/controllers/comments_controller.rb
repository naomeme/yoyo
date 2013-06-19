class CommentsController < ApplicationController
  before_action :set_topic
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  def index
    @comments = @topic.comments
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = @topic.comments.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = @topic.comments.build(comment_params)

    if @comment.save
      redirect_to [@topic, @comment], notice: 'Comment was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to [@topic, @comment], notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to topic_comments_url(@topic), notice: 'Comment was successfully destroyed.'
  end

  private
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = @topic.comments.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:name, :content, :topic_id)
  end
end
