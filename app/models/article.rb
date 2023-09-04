require 'paperclip'
class Article < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :author, presence: true
    validates :category, presence: true
    
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment :image, presence: true, content_type: { content_type: /\Aimage\/.*\z/ }
    belongs_to :category
    belongs_to :author
end
