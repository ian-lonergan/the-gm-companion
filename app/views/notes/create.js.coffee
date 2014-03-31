<% if @note.valid? %>

$('.notes tr:last').before '<%= j(render @note)  %>' 
$('.notes-new #note_text').val ''

<% else %>

$('.notes-new #text').val ''
$('.notes-new #note_text').attr 'placeholder', '<%= @task.errors[:text].first %>'

<% end %>