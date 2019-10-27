class SignupController < ApplicationController

  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    #if verify_recaptcha
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
      @user = User.new 
    #else
    #end
  end

  def step3
    session[:telephone] = user_params[:telephone]
    @user = User.new 
  end

  def step4
    session[:first_name_kanji] = user_params[:first_name_kanji]
    session[:last_name_kanji] = user_params[:last_name_kanji]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:birth_day] = user_params[:birth_day]
    session[:postal_code] = user_params[:postal_code]
    session[:prefectures] = user_params[:prefectures]
    session[:city] = user_params[:city]
    session[:address] = user_params[:address]
    session[:building] = user_params[:building]
    session[:telephone] = user_params[:telephone]
    @user = User.new 
    @card = Card.new # 新規インスタンス作成
  end

  def done

    if session[:sns].present?
      password = Devise.friendly_token
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: password,
        password_confirmation: password,
        first_name_kanji: session[:first_name_kanji],
        last_name_kanji: session[:last_name_kanji],
        first_name_kana:session[:first_name_kana],
        last_name_kana: session[:last_name_kana],
        birth_day: session[:birth_day],
        postal_code: session[:postal_code],
        prefectures: session[:prefectures],
        city: session[:city],
        address: session[:address],
        building: session[:building],
        telephone: session[:telephone]
      )
      if @user.save 
        Card.create(customer_id: card_params[:customer_id],user_id: @user.id)
        sns = SnsCredential.create(user_id: @user.id,uid: session[:sns]["uid"], provider: session[:sns]["provider"])
        sign_in User.find(@user.id) unless user_signed_in?
        redirect_to done_signup_index_path
      end
    else
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password],
        password_confirmation: session[:password_confirmation],
        first_name_kanji: session[:first_name_kanji],
        last_name_kanji: session[:last_name_kanji],
        first_name_kana:session[:first_name_kana],
        last_name_kana: session[:last_name_kana],
        birth_day: session[:birth_day],
        postal_code: session[:postal_code],
        prefectures: session[:prefectures],
        city: session[:city],
        address: session[:address],
        building: session[:building],
        telephone: session[:telephone]
      )
      if @user.save 
        Card.create(customer_id: card_params[:customer_id],user_id: @user.id)
        sign_in User.find(@user.id) unless user_signed_in?
        redirect_to done_signup_index_path
      end
    end
    
  end

  private
  # 許可するキーを設定します
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :telephone,
      :first_name_kanji, 
      :last_name_kanji, 
      :first_name_kana, 
      :last_name_kana, 
      :birth_day,
      :postal_code,
      :prefectures,
      :city,
      :address,
      :building
  )
  end

  def card_params
    params.require(:card).permit(:customer_id)
  end
end
