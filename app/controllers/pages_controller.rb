class PagesController < ApplicationController
 layout 'application'
  def home
    @title = "Home"
   
     # @micropost = Micropost.new
      @story = Story.new
      @count1 = 1
      @stories = Story.find(:all, :include => :comments, :order => 'votes DESC')
      # @stories = Story.paginate(:page => params[:page])
      if signed_in?
        @feed_items = current_user.feed.paginate(:page => params[:page])
      end
  end
  
  
  def poststory
    @title = "PostStory"
    @story = Story.new
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end
