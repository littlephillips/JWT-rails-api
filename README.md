# Jwt walkthrough
    commit your work!!!!

## create rails api  
    rails new jwtapi --api`
#
# gemfile
## install bycrypt 
    gem "bcrypt", "~> 3.1.7"
## install jwt
    gem "jwt"
#

# Generators
## generate models 
    generate user model, with 
    use has_secure_password

## generate controller
    rails g controller users --no-test-framework
    add a create action to register user
     
## generate migrations
    rails db:migrate

# Application controller
## method to encode jwt 
    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end 
# 

# Routing
    config folder/routes.rb
    create a resource with only create route 
#

#  Login action
    add login action in user controller
    add login route in config/routes.rb