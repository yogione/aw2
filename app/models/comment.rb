require 'application_constant'
class Comment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  attr_accessible :comment_text
  before_save :validate_comment_text

  APPROVED = 1
  REJECTED = 2
  DEFAULT = 0

  validates :comment_text, :presence => true, :length => { :maximum => 1000 }
  # validates :user_id, :presence => true
  validates :story_id, :presence => true

  scope :moderated, lambda {|num|
    where("(comments.moderated = 1 OR comments.moderated = 0 ) AND comments.story_id = ?", num)
  }

  def validate_comment_text
    #Find if a word is there
    ApplicationConstant::ABUSIVE.each do |word|
      self.comment_text.gsub!(/#{word.to_s}/, "****") if self.comment_text.include?(word.to_s)
    end
  end


  def upvote
    self.increment!(:votes)
  end

  def downvote
    self.decrement!(:votes)
  end

  def approved
    self.update_attribute(:moderated, Comment::APPROVED)
  end

  def rejected
    self.update_attribute(:moderated, Comment::REJECTED)
  end
end

