class AuthorProfilesController < ApplicationController
   before_action :authenticate_author!
	
	def index
     @categories = Category.all
     @authorprofiles =AuthorProfile.all
	end


	def new
		@categories = Category.all
		@author = Author.find(current_author.id)
		@authorprofile = AuthorProfile.where(author_id: @author.id)

		unless @authorprofile.any?
        @authorprofile = AuthorProfile.new

        else
         redirect_to author_profile_path(@authorprofile)
        end

	end

	def create
        @authorprofile = AuthorProfile.new(author_profile_params)
        @authorprofile.save
        redirect_to root_path
		
	end


	def show
		@categories =Category.all
		@author = Author.find(current_author.id)
		@authorprofile = AuthorProfile.find_by(author_id: @author.id)

	end

	

	def edit
		@categories =Category.all
		@author = Author.find(current_author.id)
		@authorprofile = AuthorProfile.find_by(author_id: @author.id)
    end

    def update
        @authorprofile = AuthorProfile.find(params[:id])
        
        @authorprofile.update(author_profile_params)

        redirect_to author_profile_path(@authorprofile)	
     end

	private
  	
  	def author_profile_params
  		params.require(:author_profile).permit(:first_name, :last_name, :avatar, :author_id)
  	end
end
