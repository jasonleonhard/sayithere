class MessageBroadcastJob < ApplicationJob
  queue_as :default

  # def perform(*args)
  #   # Do something later
  # end
  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end
# shows output of template rendered in popup alert
  # <!-- <p>Find me in app/views/_message.html.erb</p> -->

  # <div class="message">
  #   <p>shows output of template rendered in popup alert</p>
  # </div>
