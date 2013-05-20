mongoose = require 'mongoose'

# Post model
Post = new mongoose.Schema(
  title: String
  body: String
)

module.exports = mongoose.model 'Post', Post