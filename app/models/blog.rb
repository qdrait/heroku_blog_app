class Blog < ApplicationRecord
    validates :title,:content,presence:true
    validates :comment,length: { in: 1..140 } 
end
