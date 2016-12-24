class AdminMailer < AppMailer

  def contact_email params
    @name = params[:macain_name]
    @email = params[:macain_email]
    @message = params[:macain_message]
    @url = 'http://macain.com.ar/'
    mail(to: 'alo@macain.com.ar, tomas@macain.com.ar', subject: 'Siranushen Alert :) - Message from: ' + @name)
  end

  def purchase_product_admin_notification params
    @user = params[:user]
    @product = params[:product]
    @image = params[:image]
    @message = params[:message]
    @url = 'http://macain.com.ar/'
    mail(to: 'tomas@macain.com.ar', subject: 'Papin! Papin! ' + @user[:email] + ' ' + @message  + ' la compra de una ' + @product.name)
  end

end