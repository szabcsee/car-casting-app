# Be sure that /config/oauth.yml exist
# Please find the structure example below.
# You can access your oauth configuration within the application like that:
# OAUTH_CONFIG['client_id']
#
#development:
#  uuid: 'xxx'
#  client_id: 'xxx'
#  redirect_uri: 'xxx'
#  client_secret: 'xxx'
#  sso_uri: 'https://sso.dev-example.org/oauth2/'
#  sso_login: 'false'
#test:
#  uuid: 'xxx'
#  client_id: 'xxx'
#  redirect_uri: 'xxx'
#  client_secret: 'xxx'
#  sso_uri: 'https://sso.test-example.org/oauth2/'
#  sso_login: 'false'
#production:
#  uuid: 'xxx'
#  client_id: 'xxx'
#  redirect_uri: 'xxx'
#  client_secret: 'xxx'
#  sso_uri: 'https://sso.prod-example.org/oauth2/'
#  sso_login: 'false'

# OAUTH_CONFIG = YAML.load_file("#{Rails.root.to_s}/config/oauth.yml")[Rails.env]