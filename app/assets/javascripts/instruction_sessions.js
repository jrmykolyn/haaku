console.log( 'INSIDE "instruction_sessions.js"' ); /// TEMP

$( document ).on( 'turbolinks:load', function() {
	console.log( 'INSIDE DOCUMENT READY' ); /// TEMP

	/* -------------------------------------------------- */
	/* DECLARE VARS */
	/* -------------------------------------------------- */
	var fetch_student_input = $( '#fetch_student_data_input' );
	var results_elem = $( '.load-more-results' );
	var students_elem = $( '.students-list' );
	var student_endpoint = '/students';

	var timeout = null;
	var request_pending = false;


	/* -------------------------------------------------- */
	/* DECLARE FUNCTIONS */
	/* -------------------------------------------------- */
	function fetchStudentData( data ) {
		console.log( 'INSIDE `fetchStudentData()`' ); /// TEMP

		request_pending = true;

		$.ajax( {
			method: 'GET',
			url: student_endpoint,
			dataType: 'json',
			data: data
		} ).then( function( response ) {
			request_pending	= false;

			outputStudentData( response );
		} );
	}


	function outputStudentData( data ) {
		// Loop over data, build HTML elems and append to DOM
		data.forEach( function( elem, i ) {
			var output = $( '<li>' ).append( elem.name );

			var field = $( '<input>' )
				.attr( 'type', 'hidden' )
				.attr( 'name', 'instruction_session[attendance_records_attributes][' + Math.floor( Math.random() * 1000 ) + '][user_id]' )
				.val( elem.id );

			output.append( field )

			results_elem.append( output );
		} );
	}


	/* -------------------------------------------------- */
	/* EVENT */
	/* -------------------------------------------------- */
	fetch_student_input.on( 'keyup', function( e ) {
		var _this = $( this );

		if ( timeout ) { clearTimeout( timeout ) }

		timeout = setTimeout( function() {
			var data = { user_name: _this.val() };

			fetchStudentData( data );
		}, 2000 );
	} );


	results_elem.on( 'click', 'li', function( e ) {

		// Clear input field.
		fetch_student_input.val('');

		// Clear 'results' list.
		$( e.delegateTarget ).children().remove();

		// ...
		students_elem.append( e.target ); /// TEMP
	} );
} );
