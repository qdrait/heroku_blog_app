class ContactMailer < ApplicationMailer
    def contact_mail(blog)
         @blog = blog
         mail to: "qdrait@gmail.com", subject: @blog.user.email
    end
end
