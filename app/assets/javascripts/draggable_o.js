var flag_door = false, flag_temperature = false; //boolean

	function dropZoneone() {
		/** dragElements **/
		var dropZoneOne = document.querySelector('#drop-target-one');
		var dropZoneTwo = document.querySelector('#drop-target-two');
		var dragElements = document.querySelectorAll('#drag-elements li');
		//var dragElements = document.querySelectorAll('#drag-elements button');
		var elementDragged = null;
	
		for (var i = 0; i < dragElements.length; i++) {
	
			// Event Listener for when the drag interaction starts.
			dragElements[i].addEventListener('dragstart', function(e) {
				e.dataTransfer.effectAllowed = 'move';
				e.dataTransfer.setData('text', this.innerHTML);
				//e.dataTransfer.setData('text', e.target.id);
				elementDragged = this;
				
				all_value = e.target.id;
				document.getElementById('select_values_1').value = e.target.id;
			
			});
	
			// Event Listener for when the drag interaction finishes.
			dragElements[i].addEventListener('dragend', function(e) {
				elementDragged = null;
				if(all_value == 'Temperature'){
					flag_temperature = true;
					document.getElementById('channel_When_this_stuff_happens').value = "Temperature";
					$(document).ready(function(){
					  $(".temp_select").toggle();
					  $(".led_select").hide();
					  $(".con_2").toggle();
					  draggabletwo();
					});
				}else if(all_value == 'Sw'){
					flag_door = true;
					document.getElementById('channel_When_this_stuff_happens').value = "Sw";
					$(document).ready(function(){
					  $(".led_select").toggle();
					  $(".temp_select").hide();
					  $(".con_2").hide();
					});
				}
			});
			
		};
	
		// Event Listener for when the dragged element is over the drop zone.
		dropZoneOne.addEventListener('dragover', function(e) {
			if (e.preventDefault) {
				e.preventDefault();
			}
			e.dataTransfer.dropEffect = 'move';
			return false;
		});
	
		// Event Listener for when the dragged element enters the drop zone.
		dropZoneOne.addEventListener('dragenter', function(e) {
			this.className = "over";
		});
	
		// Event Listener for when the dragged element dropped in the drop zone.
		dropZoneOne.addEventListener('drop', function(e) {
			if (e.preventDefault) e.preventDefault(); 
	  		if (e.stopPropagation) e.stopPropagation(); 
	
			this.className = "";
			this.innerHTML = e.dataTransfer.getData('text');
			
			return false;
		});
	};

	function draggabletwo() {
		/** dragElements **/
		var dropZoneTwo = document.querySelector('#drop-target-two');
		var dragElements = document.querySelectorAll('#drag-elements li');
		//var dragElements = document.querySelectorAll('#drag-elements button');
		var elementDragged = null;
	
		for (var i = 0; i < dragElements.length; i++) {
	
			// Event Listener for when the drag interaction starts.
			dragElements[i].addEventListener('dragstart', function(e) {
				e.dataTransfer.effectAllowed = 'move';
				e.dataTransfer.setData('text', this.innerHTML);
				//e.dataTransfer.setData('text', e.target.id);
				elementDragged = this;
				
				all_value = e.target.id;
				document.getElementById('select_values_2').value = e.target.id;
			
			});
	
			// Event Listener for when the drag interaction finishes.
			dragElements[i].addEventListener('dragend', function(e) {
				elementDragged = null;
				if(all_value == 'Ledopen'){
					flag_temperature = true;
					document.getElementById('channel_Then_do_these_things_1st').value = "Led";
					$(document).ready(function(){
					  $(".led_select_2").toggle();
					});
				}
			});
			
		};
	
		// Event Listener for when the dragged element is over the drop zone.
		dropZoneTwo.addEventListener('dragover', function(e) {
			if (e.preventDefault) {
				e.preventDefault();
			}
			e.dataTransfer.dropEffect = 'move';
			return false;
		});
	
		// Event Listener for when the dragged element enters the drop zone.
		dropZoneTwo.addEventListener('dragenter', function(e) {
			this.className = "over";
		});
	
		// Event Listener for when the dragged element dropped in the drop zone.
		dropZoneTwo.addEventListener('drop', function(e) {
			if (e.preventDefault) e.preventDefault(); 
	  		if (e.stopPropagation) e.stopPropagation(); 
	
			this.className = "";
			this.innerHTML = e.dataTransfer.getData('text');
	
			return false;
		});
	};
