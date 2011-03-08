class StoriesController < ApplicationController
  layout 'application'
  before_filter :authenticate, :only => [:create, :destroy, :show, :upvote, :downvote]
  before_filter :find_story, :only => [:upvote, :downvote,]

  def create
    @story  = current_user.stories.build(params[:story])
    if @story.save
      flash[:success] = "Story created!"
      redirect_to story_comments_url(@story)
    else
      render 'shared/_story_form'
    end
  end

  def show
    @story = Story.find(params[:id])
    #    if params[:comment][:comment_text].include?('shit')
    #      params[:comment][:comment_text].gsub('shit','***')
    #    end
    @comment = Comment.new(params[:comment])
  end

  def upvote

    @story.upvote
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js{
        render :update do |page|
          page.replace_html("vote_#{@story.id}",:partial => '/pages/votes', :locals => {:story => @story})
        end
      }
    end
    flash[:notice] = "Upvoted successfully"
   end

  def downvote
    @story.downvote
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js{
        render :update do |page|
          page.replace_html("vote_#{@story.id}",:partial => '/pages/votes', :locals => {:story => @story})
        end
      }
    end
  end

  def destroy
    @story.destroy
    redirect_back_or root_path
  end


  def find_story
    @story = Story.find(params[:id]) if params[:id]
  end

  private :find_story

end

