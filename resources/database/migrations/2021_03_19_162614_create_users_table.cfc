component {
    
    function up( schema, query ) {
        schema.create( "Users.Users" , function( table ) {
            table.uuid( "userID" ).primaryKey() ;
            table.string( "username" ).unique() ;
            table.string( "email" ).unique() ;
            table.string( "password" ) ;
            table.timestamp( "createdTimestamp" ).default( "GETDATE()" );
            table.timestamp( "modifiedTimestamp" ).default( "GETDATE()" );
        });
    }

    function down( schema, query ) {
        queryExecute( "DROP TABLE Users.Users" ) ;
    }

}
