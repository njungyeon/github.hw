class PostsController < ApplicationController
    def new
        #사용자가 데이터를 입력할 화면
        #자동으로 액션 이름과 같은 화면을 불러서 호출해라
    end
    
    def create
        #사용자가 건네준 데이터를 실제 db에 저장하는 액션이다 new액션과는 다르게 따로 화면이 필요하지 않으므로 
        @post = Post.new       #post하나가 새로 만들어져 제출 될 때마다 새로운 post객체 하나씩 만들어지면서 그 객체 안에 { title: 값, content:값}이 저장되는 것이다.
        @post.title = params[:input_title]    #new페이지에서 전달된 데이터의 name값이 input_title과 input_content 이다
        @post.content = params[:input_content]
        @post.save           #이렇게 되면 db에 데이터가 저장이 된다
        redirect_to "/posts/show/#{@post.id}"  #new창에서 새글을 입력하고 제출하면 그 글의 정보가 보여지도록 수정했다.
    end                                         #원래는 'posts/new'화면을 보여주고 있었는데 바꿨다 show화면에서 id로 화면으로 넘어갔다.
    
    #read
    def index
        #db에 저장된 post들의 목록을 전체 보여주는 페이지
        @posts = Post.all  #post객체 전체를 받아서 실제 창에서는 객체 하나씩 반복문을 통해서 화면에 뿌린다.
    end 
    
    def show
        #목록창index창에서 각 post의 제목을 누르면 내용을 보여주는 화면으로 마지막에 post를 submit버튼을 누르면 이 화면이 나오도록 설정하였다
        @post = Post.find(params[:post_id]) #이 페이지에서 post라는 변수를 사용하는데 이 변수에는 post객체 중에서 post id를 키값으로 전달하여 그 키값에 해당되는 객체를 찾아서 post변수에 넣어준다 
        @comments = Comment.all
    end 
    
    #Update
    def edit #사용자가 수정할 데이터를 입력하는 곳
        @post = Post.find(params[:post_id])
    end
    
    def update  #사용자가 수정할 데이터를 제출하여 고쳐주는 처리를 하는곳
        @post = Post.find(params[:post_id])   #하나의 객체를 찾아서
        #수정할 코드를 입력하시오
        @post.title = params[:input_title]    #new페이지에서 전달된 데이터의 name값이 input_title과 input_content 이다
        @post.content = params[:input_content]
        @post.save
        redirect_to "/posts/show/#{@post.id}"
    end
    
    #Destroy
    def destroy
        @post = Post.find(params[:post_id])
        @post.destroy  # 바로 위에서 post변수에 전달된 하나의 객체가 destroy되는 메소드이다.
        redirect_to '/'  
    end
    
end 
