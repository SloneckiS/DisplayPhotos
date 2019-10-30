public with sharing class ImageCallout
{
    @future( callout=true )
    public static void makeGetCallout( )
    {
        try
        {
            Http http = new Http( );
            HttpRequest request = new HttpRequest( );
            request.setEndpoint( 'https://jsonplaceholder.typicode.com/photos' );
            request.setMethod( 'GET' );
            System.debug('before request' );
            HttpResponse response = http.send( request );
            System.debug('After request' );
            if ( response.getStatusCode( ) == 200 )
            {
                List<Object> results = ( List<Object> ) JSON.deserializeUntyped( response.getBody( ) );
                List<Image__c> imagesToInsert = new List<Image__c>( );
                for ( Object obj : results )
                {
                    Map<String, Object> tempMap = ( Map<String, Object> ) obj;
                    Image__c image = new Image__c( );
                    image.albumId__c = ( Decimal ) tempMap.get( 'albumId' );
                    image.id__c = ( Decimal ) tempMap.get( 'id' );
                    image.title__c = ( String ) tempMap.get( 'title' );
                    image.url__c = ( String ) tempMap.get( 'url' );
                    image.thumbnailUrl__c = ( String ) tempMap.get( 'thumbnailUrl' );
                    imagesToInsert.add( image );
                }
                System.debug('To insert: ' + imagesToInsert );
                insert imagesToInsert;
            }
        } catch ( Exception exc )
        {
            System.debug( LoggingLevel.ERROR, '[ EXC ] Error in the ImageCallout.makeGetCallout method: ' + exc.getMessage( ) + ' cause ' + exc.getCause( ) + ' at line: ' + exc.getLineNumber( ) + ' stack trace: ' + exc.getStackTraceString( ) );
        }
    }
    private static void deleteImages( )
    {
        delete [ SELECT Id FROM Image__c ];
    }
}