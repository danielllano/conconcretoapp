class CustomFailure < Devise::FailureApp
  def redirect_url
     request.referrer
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      redirect_to root_path
    end
  end
end