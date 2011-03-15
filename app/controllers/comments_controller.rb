class CommentsController < ApplicationController
  before_filter :authenticate
  before_filter :find_comment, :only => [:upvote, :downvote,]

  def index
    #@comments = Comment.find(:all, :conditions => {:moderated => 0})
    @comments = Comment.find(:all)
  end

#  def approve
#    @comment.approved
#    flash[:success] = "comment Moderated Approved!"
#    redirect_to comments_path
#  end
#
#  def reject
#    @comment.rejected
#    flash[:success] = "comment Moderated Rejected"
#    redirect_to comments_path
#  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.create(params[:comment])
    @comment.moderated = Comment::DEFAULT
    @comment.user_id  = current_user.id
    # @comment  = Comment.new(params[:comment])
    if @comment.save
      flash[:success] = "comment added"
      redirect_to story_path(params[:story_id])
      #redirect_to root_path
    else
      #   render 'pages/home'
    end
  end

  def destroy
    @comment.destroy
    redirect_back_or root_path
  end

  def show
    @story = Story.find(params[:id])
    @current_comments = @story.comments
    @comment = Comment.new if signed_in?
  end

  def upvote
    @comment.upvote
 #  p @comment.votes
     respond_to do |format|
      format.html {redirect_to story_path(@comment.story)}
      format.js{
        render :update do |page|
          page.replace_html("vote_#{@comment.id}",:partial => '/comments/votes', :locals => {:story => @comment.story, :comment => @comment})
        end
      }
    end
  end

  def downvote 
    @comment.downvote
     respond_to do |format|
     format.html {redirect_to story_path(@comment.story)}
      format.js{
        render :update do |page|
          page.replace_html("vote_#{@comment.id}",:partial => '/comments/votes', :locals => {:story => @comment.story, :comment => @comment})
        end
      }
    end
  end

  def find_comment
    @comment = Comment.find(params[:id]) if params[:id]
  end

  private :find_comment
end
