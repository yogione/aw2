class Retiree < ActiveRecord::Base
  has_attached_file :photo,
    :styles =>{
            :thumb=>"100x100#",
            :small=>"400x400"}

  belongs_to :user
end
