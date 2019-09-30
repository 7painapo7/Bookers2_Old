Rails.application.routes.draw do
  # devise_scope :user do
  root :to => 'users#start'
  # end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get 'home/about' => 'users#about'
  # resources :books 下記に書換え
  # 単数にするとそのコントローラのidがリクエストに含まれなくなる。
  # 今回、post_commentsのshowページは必要ない（コメントの詳細ページは作成しない）
  # ため、idを受け渡す必要がなくresource。
  resources :books do
    # sをつける今回はidの詳細の情報が必要なので
    resources :post_comments
  end
end

