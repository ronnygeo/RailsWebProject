class DiscourseSsoController < ApplicationController
  def sso
    secret = "mycityamigodubai"
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = "user@email.com"
    sso.name = "Bill Hicks"
    sso.username = "bill@hicks.com"
    sso.external_id = "123" # unique to your application
    sso.sso_secret = secret

    redirect_to sso.to_url("http://l.discourse/session/sso_login")
  end
end