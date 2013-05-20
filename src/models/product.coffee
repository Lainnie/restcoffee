mongoose = require 'mongoose'

# Product Model

Product = new mongoose.Schema(
	name: { type: String, required: true, unique: true, index: true } 
	description: String
	price: Number
	)
module.exports = mongoose.model 'Product', Product