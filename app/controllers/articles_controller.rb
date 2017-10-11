class ArticlesController < ApplicationController
/	http_basic_authenticate_with name: "dhh", password: "secret",
	except: [:index, :show]/

	#List all Articles
	def index
		@articles = Article.all
	end

	#Show an Article (/::id)
	def show
		@article = Article.find(params[ :id])
	end

	#Add new Article
	def new
		@article = Article.new
	end

	#Edit an Article
	def edit
		@article = Article.find(params[:id])  
	end

	#Create an Article
	def create
	  @article = Article.new(article_params)
	 
	  if @article.save
	  	redirect_to @article
	  else
	  	render 'new'
	  end
	end

	#Update an Article
	def update
		@article = Article.find(params[:id])  
		
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	#Deletes an Article
	def destroy
		@article = Article.find(params[:id])  
		@article.destroy

		redirect_to articles_path
	end

	#Private Params
	private 
		def article_params
			params.require(:article).permit(:title,:text)
		end

end
