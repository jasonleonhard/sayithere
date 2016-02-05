App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # callbacks Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # alert data['message']
    $('#messages').append data['message']

  
  # user specified action speak
    # messages in show.html.erb, when pressing keys, check and send 
    # similar as we do in console, but now view
    # send to view # resets field for new input # so it doesnt auto submit
  speak: (message) ->
    @perform 'speak', message: message
    
# similar to /views/room/show.html.erb
# '[data-behavior-=room_speaker]'
$(document).on 'keypress', '[data-behavior=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()