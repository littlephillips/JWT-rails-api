# Jwt walkthrough
    commit your work!!!!

## create rails api  
`rails new jwtapi --api`
#
# gemfile
## install bycrypt 
`gem "bcrypt", "~> 3.1.7"`

## install jwt
`gem "jwt"`
#

# Generators
## generate models 
`use has_secure_password`

## generate migrations
`rails db:migrate`

## seed data 
     create seeds
`rails db:seed`

#

# Application controller
    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end 