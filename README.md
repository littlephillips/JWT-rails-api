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
    use has_secure_password

## generate controller
    rails g controller users --no-test-framework

## generate migrations
    rails db:migrate

## seed data 
    rails db:seed

#

# Application controller
## method to encode jwt 
    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end 