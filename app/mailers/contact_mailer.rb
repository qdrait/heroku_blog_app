class ContactMailer < ApplicationMailer
    def contact_mail(blog)
         @blog = blog
        #  mail to: "qdrait@gmail.com", subject: @blog.user.email
         mail to: @blog.user.email, subject: "ブログ投稿完了通知"
    end
end
