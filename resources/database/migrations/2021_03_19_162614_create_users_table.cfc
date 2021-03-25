component {
    
    function up( schema, query ) {
        <!---
        ```
        <cfquery name="generateUsersTable">
            CREATE TABLE [dbo].[Users](
                [id] [int] IDENTITY(1,1) NOT NULL,
                [username] [nvarchar](255) NOT NULL,
                [email] [nvarchar](255) NOT NULL,
                [password] [nvarchar](max) NOT NULL,
                [createdDate] [datetime] NOT NULL,
                [modifiedDate] [datetime] NOT NULL,
            CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
            (
                [id] ASC
            )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
            UNIQUE NONCLUSTERED 
            (
                [email] ASC
            )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
            UNIQUE NONCLUSTERED 
            (
                [username] ASC
            )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
        </cfquery>

        <cfquery name="generatePersonTable">
            ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_createdDate]  DEFAULT (getdate()) FOR [createdDate]
        </cfquery>

        <cfquery name="generatePersonTable">
            ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_modifiedDate]  DEFAULT (getdate()) FOR [modifiedDate]
        </cfquery>
        ```
        --->

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
