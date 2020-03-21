class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all.includes(:favorite_users)
    # favorite_usersはtopic.rbのhas_manyで定義したことになっている？
    @topic = Topic.find_by(params[:id])
    # @comment = Comment.new(topic_id: topic.id)
    # @comment = Comment.new(comment_params)
    @comments = @topic.comments.build
    @comments.save

  end
  
  # def show
  #   @topic = Topic.find_by(topic_id: params[:id])
  # end

  def new
    # @topic = Topic.find(params[:id])
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    # topicsとはなにを示している？クラス？テーブル名？
    if @topic.save
      redirect_to topics_path(comment: @comment.id), success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end


  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
  
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :topic_id)
  end
end