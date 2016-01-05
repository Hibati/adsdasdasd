# allow updates via HTTP GET by setting this to true;
# set to false to only allow updates via HTTP POST
GET_SUPPORT = true

# rate limit channel updates
RATE_LIMIT = false

# number of seconds to wait before a channel can be updated again
RATE_LIMIT_FREQUENCY = '15'

# main production server to handle all requests (can be a proxy)
APPLICATION_IP_ADDRESS = '127.0.0.1'

# domain for the API
API_DOMAIN = 'http://127.0.0.1:3000/'

# get api key from HTTP headers if this value is present
HTTP_HEADER_API_KEY_NAME = 'THINGSPEAKAPIKEY'

# whether to use Redis or not
REDIS_ENABLED = false

# Twitter api credentials
CONSUMER_KEY = ''
CONSUMER_SECRET = ''

# reset password base url
RESET_PASSWORD_URL = 'http://127.0.0.1:3000//users/reset_password/'

# allow only these additional locales (use downcase, easier to parse)
# 注意，這邊要小寫，不要問我為什麼，解釋很麻煩
ALLOWED_LOCALES = ['zh-tw','pt-br','it']

