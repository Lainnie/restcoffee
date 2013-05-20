mongoose = require 'mongoose'

# User model
User = new mongoose.Schema(
  login: String
  password: String
  email: String
)

module.exports = mongoose.model 'User', User