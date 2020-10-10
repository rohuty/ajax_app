class PostsController < ApplicationController
  def index  # indexアクションを定義した
    @posts = Post.all.order(id: "DESC") # 新しいメモが一番上に表示される
  end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
  end

  def checked
    
    post = Post.find(params[:id]) 
    # URLパラメーターから、既読したメモのidが渡されるように設定するので、
    # そのidを使用して該当するレコードを取得している
    if post.checked 
      post.update(checked: false)
    else
      post.update(checked: true)
    end
    # post.checkedという既読であるか否かを判定するプロパティを指定し、
    # 既読であれば「既読を解除するためにfalseへ変更」し、既読でなければ「既読にするためtrueへ変更」します。
    # updateというActiveRecordのメソッドを使用して更新している
    item = Post.find(params[:id])
    render json: { post: item }
    # 更新したレコードをitem = Post.find(params[:id])で取得し直し、
    # render json:{ post: item }でJSON形式（データ）としてchecked.jsに返却
  end
end
