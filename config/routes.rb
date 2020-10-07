Rails.application.routes.draw do
  #[HTTPメソッド] '[URIパターン]', to: '[コントローラー名]#[アクション名]'
  # get 'posts', to: 'posts#index' ←編集して下記へ変更
  root to: 'posts#index' # ルートパスへ変更
  # get 'posts/new', to: 'posts#new' ←削除
  #「投稿完了しました」というページは使用しないため、get 'posts/new', to: 'posts#new'の記述は削除
  post 'posts', to: 'posts#create'

end
