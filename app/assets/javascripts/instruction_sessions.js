console.log( 'INSIDE "instruction_sessions.js"' ); /// TEMP

$( document ).ready( function() {
	console.log( 'INSIDE DOCUMENT READY' ); /// TEMP

	/* -------------------------------------------------- */
	/* DECLARE VARS */
	/* -------------------------------------------------- */
	var fetch_student_input = $( '#fetch_student_data_input' );
	var fetch_student_btn = $( '#fetch_student_data_btn' );
	var results_elem = $( '.load-more-results' );
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
		data.forEach( function( elem, i ) {
			output = $( '<li>' ).append( elem.name );
			results_elem.append( output );
		} );
	}


	/* -------------------------------------------------- */
	/* EVENT */
	/* -------------------------------------------------- */
	fetch_student_input.on( 'keyup', function( e ) {
		console.log( 'INSIDE `keyup` EVENT' ); /// TEMP

		var _this = $( this );

		if ( timeout ) { clearTimeout( timeout ) }

		timeout = setTimeout( function() {
			var data = { user_name: _this.val() };

			fetchStudentData( data );
		}, 2000 );
	} );


} );
