<% if @invitation.valid? %>

$('.invitations tr:last').after '<%= j(render @invitation)  %>' 

<% end %>