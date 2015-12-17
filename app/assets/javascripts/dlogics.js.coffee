# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
flag_led = false
flag_air = false
flag_times = false
flag_letter = false

create_option_for_temp = ->
    temp = [">", ">=", "=", "<", "<="]
    for i in [0...temp.length]
      $('#temp_selete').append( $("<option></option>").attr("value", temp[i]).text(temp[i]))
    temp2 = ["22", "23", "24", "25", "26", "27", "28", "29", "30"]
    for i in [0...temp2.length]
      $('#temp_selete_num').append( $("<option></option>").attr("value", temp2[i]).text(temp2[i]))

create_option_for_led = ->
    led = ["Open", "Close"]
    for i in [0...led.length]
      $('#led_selete').append( $("<option></option>").attr("value", led[i]).text(led[i]))
      
create_option_for_air = ->
    air = ["Open", "Close"]
    for i in [0...air.length]
      $('#air_selete').append( $("<option></option>").attr("value", air[i]).text(air[i]))

create_option_for_times = ->
    times = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    for i in [0...times.length]
      $('#times_selete').append( $("<option></option>").attr("value", times[i]).text(times[i]))






delete_all_logic = ->
    $('.container_sw').hide()
    $('.container_temperature').hide()
    $('.container_uv').hide()
    $('.container_sound').hide()
    $('.container_gas').hide()
    $('.container_ir').hide()
    $('.container_switch').hide()
    $('.container_pressure').hide()
    $('.container_led').hide()
    $('.temp_select').hide()
    $('.dropdrap').hide()
    $('.dropdraptwo').hide()
    $('.drop-target-one-selete').hide()
    $('.drop-target-two-selete').hide()
 
select_option_for_temp = ->
   $('#temp_selete').change (e) ->
     document.getElementById('channel_Event_1').value = $( "#temp_selete" ).val()
   $('#temp_selete_num').change (e) ->
     document.getElementById('channel_Event_2').value = $( "#temp_selete_num" ).val()
   
$ ->
    if $('#channel_When_this_stuff_happens').val() == "SW Sensor"
      delete_all_logic()
      $('.container_sw').toggle()
      $('.drop-target-one').toggle()
      dropZoneone()
    else if $('#channel_When_this_stuff_happens').val() == "Temperature Sensor" || $('#channel_When_this_stuff_happens').val() == "Temperature"
      document.getElementById('channel_When_this_stuff_happens').value = "Temperature"
      document.getElementById('channel_field1').value = "Temperature"
      document.getElementById('channel_Event_1').value = ">"
      document.getElementById('channel_Event_2').value = "22"
      delete_all_logic()
      create_option_for_temp()
      select_option_for_temp()
      $('.container_temperature').toggle()
      $('.container_led').toggle()
      $('.dropdrap').toggle()
      dropZoneone()
    else if $('#channel_When_this_stuff_happens').val() == "UV Sensor"
      delete_all_logic()
      $('.container_uv').toggle()
      $('.dropdrap').toggle()
      dropZoneone()
    else if $('#channel_When_this_stuff_happens').val() == "Sound Sensor"
      delete_all_logic()
      $('.container_sound').toggle()
      $('.dropdrap').toggle()
      dropZoneone()
    else if $('#channel_When_this_stuff_happens').val() == "Gas Sensor"
      delete_all_logic()
      $('.container_gas').toggle()
      $('.dropdrap').toggle()
      dropZoneone()
    else if $('#channel_When_this_stuff_happens').val() == "Switch Sensor"
      delete_all_logic()
      $('.container_switch').toggle()
      $('.dropdrap').toggle()
      dropZoneone()
    else if $('#channel_When_this_stuff_happens').val() == "Pressure Sensor"
      delete_all_logic()
      $('.container_pressure').toggle()
      $('.dropdrap').toggle()
      dropZonetwo()

controller_led_select = ->
  document.getElementById('channel_Then_do_these_things_1st').value = "Led"
  document.getElementById('channel_field3').value = "Led"        
  document.getElementById('channel_Event_3').value = "Open"
  create_option_for_led()
  $('#led_selete').change (e) ->
     document.getElementById('channel_Event_3').value = $( "#led_selete" ).val()
  $('.colledset').toggle()

controller_air_select = ->
  document.getElementById('channel_Then_do_these_things_2st').value = "Airconditioning"
  document.getElementById('channel_field5').value = "Airconditioning"        
  document.getElementById('channel_Event_4').value = "Open"
  create_option_for_air()
  $('#air_selete').change (e) ->
     document.getElementById('channel_Event_4').value = $( "#air_selete" ).val()
  $('.colairset').toggle()


controller_letter_select = ->
  document.getElementById('channel_Then_do_these_things_3st').value = "Letter"
  

controller_times_select = ->
  document.getElementById('channel_Then_do_these_things_4st').value = "Times"
  document.getElementById('channel_Event_6').value = "1"
  create_option_for_times()
  $('#times_selete').change (e) ->
    document.getElementById('channel_Event_6').value = $( "#times_selete" ).val()
  $('.coltimesset').toggle()

dropZoneone = ->

  all_value = ''
  dropZoneOne = document.querySelector('#drop-target-one')
  dragElements = document.querySelectorAll('#drag-elements li')
  elementDragged = null
  i = 0
  while i < dragElements.length
    # Event Listener for when the drag interaction starts.
    dragElements[i].addEventListener 'dragstart', (e) ->
      e.dataTransfer.effectAllowed = 'move'
      e.dataTransfer.setData 'text', @innerHTML
      elementDragged = this
      all_value = e.target.id
      
      return
    # Event Listener for when the drag interaction finishes.
    dragElements[i].addEventListener 'dragend', (e) ->
      elementDragged = null
      
      if all_value == 'Led'
        controller_led_select()
        
      else if all_value == 'Airconditioning'
        controller_air_select()
        
      else if all_value == 'Letter'
        controller_letter_select()
        
      else if all_value == 'Times'
        controller_times_select()
        
      return
    i++
  # Event Listener for when the dragged element is over the drop zone.
  dropZoneOne.addEventListener 'dragover', (e) ->
    if e.preventDefault
      e.preventDefault()
    e.dataTransfer.dropEffect = 'move'
    false
  # Event Listener for when the dragged element enters the drop zone.
  dropZoneOne.addEventListener 'dragenter', (e) ->
    @className = 'over'
    return
  # Event Listener for when the dragged element leaves the drop zone.
  dropZoneOne.addEventListener 'dragleave', (e) ->
    @className = ''
    return
  # Event Listener for when the dragged element dropped in the drop zone.
  dropZoneOne.addEventListener 'drop', (e) ->
    if e.preventDefault
      e.preventDefault()
    if e.stopPropagation
      e.stopPropagation()
    @className = ''
    @innerHTML += e.dataTransfer.getData('text')
    # Remove the element from the list.
    document.querySelector('#drag-elements').removeChild elementDragged
    elementDragged = null
    false
  return
