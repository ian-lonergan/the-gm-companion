<% if @note.valid? %>

$('.notes li:last').before '<%= j(render @note)  %>' 
$('.notes-new #note_text').val ''
$('.notes-new #note_text').attr 'placeholder', 'New note'

<% else %>

$('.notes-new #note_text').val ''
$('.notes-new #note_text').attr 'placeholder', '<%= @note.errors[:text].first %>.'

<% end %>