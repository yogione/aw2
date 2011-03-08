class Story < ActiveRecord::Base
  attr_accessible :title, :teaser, :url, :photo
  belongs_to :user
  has_many :comments
  has_attached_file :photo,
    :styles =>{
            :thumb=>"100x100#",
            :small=>"400x400"}

  validates :title, :presence => true, :length => { :maximum => 140 }
  validates :url, :presence => true, :length => { :maximum => 140 }
   validates :teaser, :presence => true, :length => { :maximum => 250 }


  validates :user_id, :presence => true

  def upvote
     self.increment!(:votes)
  end

  def downvote
    self.decrement!(:votes)
  end

end
