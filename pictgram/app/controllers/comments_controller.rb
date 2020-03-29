class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
    @comment.user_id = current_user.id
    
  end

  def create
    # @topic = Topic.find_by(params[:id])
    # Paramsを受け取る設定が必要→topicコントローラーからコメントフォームにとぶときのlink_toで引数を指定しtopic.idを渡す
    @comment = Comment.new(comment_params)
    
    # ユーザーとコメントの紐付けはできたが、投稿とコメントの紐付けができておらず、常にtopic_idが1となる→解決
    if @comment.save
      redirect_to topics_path, success:  "コメントできました"
    else
      flash[:danger] = "コメントできません"
      redirect_back(fallback_location: comments_create_path)
    end
  end 
  
  def destroy
    topic = Topic.find(params[:topic_id])
    @comment = topic.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: topics_path)
  end
  
  private 
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :topic_id)
  end
  # privateは必ずdestroyの下に書く！
  
end
