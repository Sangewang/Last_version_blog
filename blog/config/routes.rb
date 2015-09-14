Rails.application.routes.draw do
  
  #设置欢迎界面
  get 'welcome/index', to: 'welcome#index', as: 'index'
  root 'welcome#index'
  
  #设置登陆界面
  get 'users/login', to: 'users#login'
  get 'users', to: 'users#index'
  post 'users/login', to: 'users#confirm'
  get 'users/login_fail', to: 'users#login_fail', as: 'login_fail'
  get 'users/wrong_input', to: 'users#wrong_input', as: 'wrong_input'
  
  #设置注册界面
  get 'users/register', to: 'users#register'
  post 'users/register', to: 'users#feedback'
  
  #get 'users', to: 'users#welcome'
  
  #设置用户个人首页
  get 'users/:user_id', to: 'users#show', as: 'user'

  #设置用户个人配置中心
  get 'users/:user_id/profile', to: 'users#profile', as: 'profile'
  get 'users/:user_id/profile/conf_web', to: 'users#conf_web'
  post 'users/:user_id/profile/conf_web', to: 'users#conf', as: 'conf'
  
  
  #设置个人博客文章页面
  get 'users/:user_id/articles', to: 'articles#index', as: 'articles'
  post 'users/:user_id/articles', to: 'articles#create', as: 'create_article'
  get 'users/:user_id/articles/new', to: 'articles#new', as: 'new_article'
  get 'users/:user_id/articles/init_time_sort', to: 'articles#init_time_sort', as: 'init_time_sort'
  get 'users/:user_id/articles/inquire', to: 'articles#inquire', as: 'inquire'
  get 'users/:user_id/articles/dairies', to: 'articles#dairy', as: 'dairy'
  get 'users/:user_id/articles/:article_id/edit', to: 'articles#edit', as: 'edit_article'
  get 'users/:user_id/articles/:article_id', to: 'articles#show', as: 'article'
  delete 'users/:user_id/articles/:article_id', to: 'articles#destroy'
  

  resources :articles do 
    resources :comments
    resources :replies
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:user_id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:user_id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
