class PostsController < ApplicationController
  def index  # indexアクションを定義した
    @posts = Post.all.order(id: "DESC") # 新しいメモが一番上に表示される
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index # メモを保存した後にトップページへリダイレクトされるように追記
  end
end
