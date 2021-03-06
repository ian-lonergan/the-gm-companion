module SessionHelper
  def login(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def logged_in_user
    unless logged_in?
      respond_to do |format|
        format.html {
            store_location
            redirect_to login_url
          }
        format.js   {
            store_location request.referer
            render js: "window.location.pathname='#{login_path}'"
          }
      end
    end
  end

  def logout
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def choose_campaign(campaign)
    session[:campaign_id] = campaign ? campaign.id : nil
  end
  
  def current_campaign
    session[:campaign_id] ? Campaign.find(session[:campaign_id]) : nil
  end
  
  def current_campaign?
    !current_campaign.nil?
  end
  
  private
    def store_location(override = nil)
       session[:return_to] = override.nil? ? request.fullpath : override  
    end
    
    def redirect_back_or(default)
      redirect_to(session[:return_to] || default)
      session.delete(:return_to)
    end
end
