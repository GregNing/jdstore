class ApplicationMailer < ActionMailer::Base
    # 设定通知订单成立的寄信功能
    default from: "service@jdstore.com"
   layout 'mailer'
end
