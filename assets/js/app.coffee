$ ->
  $('#formEdit').submit (evt) -> 
    evt.preventDefault()
    $.ajax {
  	  type: 'PUT'
  	  url: '/products/'+$(location).attr('href').split('/').pop()
  	  data: {
  	  	name: $('input[name="name"]').val()
  	  	description: $('input[name="description"]').val()
  	  }
  	  success: (data) ->
  	  	$('#name').html(data.name)
  	  	$('#desc').html(data.description)
  	  }	
  $('#deleteItem').click (evt) ->
  	evt.preventDefault()
  	$.ajax {
  		type:'DELETE'
  		url: '/products/'+$(location).attr('href').split('/').pop()
  		success: (data) ->
  			console.log data
  			$('html').html(data)
  	}