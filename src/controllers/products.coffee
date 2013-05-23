Product = require '../models/product'

# Class Products
class Products
  
  # List all products
  index: (req, res) ->
    Product.find {}, (err, products) ->
      res.render 'products', 'products': products

  # List one item
  get: (req, res) ->
    Product.findById req.params.id, (err, product) ->
      if not err
        res.render 'products/product', 'product': product
        res.statusCode = 200
      else
        res.send err
        res.statusCode = 500
  
  # Create new item
  create: (req, res) ->
    product = new Product req.body
    product.save (err, product) ->
      if not err
        res.send product
        res.statusCode = 201
      else
        res.send err
        res.statusCode = 500

  # Update item
  update: (req, res) ->
    Product.findByIdAndUpdate req.params.id, {"$set": req.body}, (err, product) ->
      if not err
        res.send product 
        res.statusCode = 200
      else
        res.send err
        res.statusCode = 418

  # delete item
  delete: (req, res) ->
    Product.findByIdAndRemove req.params.id, (err) ->
      if not err
        res.render 'products', 'products': products
      else
        res.send err
        res.statusCode = 500

module.exports = new Products