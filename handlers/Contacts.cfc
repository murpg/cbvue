/**
* My RESTFul Contact Handler
*/
component extends="BaseHandler"{
    // Dependency Injection
    property name="contactService" inject="ContactService";

    /**
	* List All Contacts
	*/
	any function view( event, rc, prc ){
	    prc.response.setData( contactService.getAll() );
	}

	/**
	* Save A Contact
	*/
	any function save( event, rc, prc ){
	    var requestBody = event.getHTTPContent( json=true );
	    var sContacts = contactService.save( requestBody.id, requestBody );
	    prc.response.setData( sContacts );
	}

	/**
	* Delete An Existing Contact
	*/
	any function remove( event, rc, prc ){
	    var sContacts = contactService.remove( rc.contactID );
	    prc.response.setData( sContacts );
	}
 
}