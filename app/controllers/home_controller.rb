class HomeController < ApplicationController
  

  def home

  end


  def gundem
   @articles = Article.where(category:'Gündem')
  	
  end

  def politika
   @articles = Article.where(category:'Politika')
  	
  end
  

  def dunya
   @articles = Article.where(category:'Dünya')
  	
  end

def ekonomi
	@articles = Article.where(category:'Ekonomi')
end 

def medya
	@articles = Article.where(category:'Medya')
end 

def ozelhaber
	@articles = Article.where(category:'Özel Haber')
end 

def cevre
	@articles = Article.where(category:'Çevre')
end 



end
