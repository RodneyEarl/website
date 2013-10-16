class Project < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300>", :small => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates :title, presence: true
  validates :content, presence: true
end
