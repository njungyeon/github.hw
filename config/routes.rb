Rails.application.routes.draw do
  get '/posts/new' => 'posts#new'  #앞에 주소를 받으면 뒤에 액션이 실행되도록 연결시켜 준 것이다.
  post '/posts/create' => 'posts#create'  #원래 get방식이였는데 post방식으로 처리를 하도록 바꿨다 이렇게 바꾸면 url주소창으로 접근이 불가능하게 만들었다.
    
  #read
  root 'posts#index'   #처음 화면을 index화면으로 설정했다
  get '/posts/show/:post_id' => 'posts#show'
  
  #Update
  get '/posts/edit/:post_id' => 'posts#edit'
  post '/posts/update/:post_id' => 'posts#update'
  
  #Delete
  post '/posts/destroy/:post_id' => 'posts#destroy'
  
  post '/posts/show/:post_id/comments/create' => 'comments#create'
  
  #post '/' => 'comments#destroy'
end
